# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=apache-git
pkgver=2.5.0.alpha.r2263.g939538607c
pkgrel=1
pkgdesc="Provides useful functions commonly found on BSD systems"
arch=('i686' 'x86_64')
url="https://httpd.apache.org/"
license=('apache')
depends=('glibc' 'apr-util' 'libnghttp2' 'openssl' 'pcre' 'zlib')
makedepends=('git' 'brotli' 'curl' 'jansson' 'libxml2' 'lua')
optdepends=('brotli: for mod_brotli module'
            'curl: for mod_md module'
            'jansson: for mod_md module'
            'libxml2: for mod_proxy_html, mod_xml2enc modules'
            'lua: for mod_lua module'
            'lynx: apachectl status'
            'perl: for apxs and dbmmanage'
            'uwsgi: for mod_proxy_uwsgi module')
provides=('apache')
conflicts=('apache')
backup=('etc/httpd/conf/httpd.conf'
        'etc/httpd/conf/extra'/httpd-{autoindex,dav,default,info,languages,manual,mpm,multilang-errordoc,ssl,userdir,vhosts}.conf
        'etc/httpd/conf/extra/proxy-html.conf'
        'etc/httpd/conf'/{mime.types,magic}
        'etc/logrotate.d/httpd')
source=("git+https://github.com/apache/httpd.git"
        "apache.tmpfiles.conf::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/apache/trunk/apache.tmpfiles.conf"
        "arch.layout::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/apache/trunk/arch.layout"
        "httpd.logrotate::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/apache/trunk/httpd.logrotate"
        "httpd.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/apache/trunk/httpd.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "httpd"

  # set default user
  sed -e 's#User daemon#User http#' \
      -e 's#Group daemon#Group http#' \
      -i "docs/conf/httpd.conf.in"

  cat "$srcdir/arch.layout" >> "config.layout"
}

pkgver() {
  cd "httpd"

  _tag=$(git tag -l --sort -v:refname | grep -m1 "^[0-9]")
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/./g'
}

build() {
  cd "httpd"

  ./buildconf \
    --with-apr=apr-1-config
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --enable-layout=Arch \
    --enable-mpms-shared=all \
    --enable-modules=all \
    --enable-mods-shared=all \
    --enable-so \
    --enable-suexec \
    --with-suexec-caller=http \
    --with-suexec-docroot="/srv/http" \
    --with-suexec-logfile="/var/log/httpd/suexec.log" \
    --with-suexec-bin="/usr/bin/suexec" \
    --with-suexec-uidmin=99 --with-suexec-gidmin=99 \
    --enable-ldap --enable-authnz-ldap --enable-authnz-fcgi \
    --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
    --enable-ssl --with-ssl \
    --enable-deflate --enable-cgi --enable-cgid \
    --enable-proxy --enable-proxy-connect \
    --enable-proxy-http --enable-proxy-ftp \
    --enable-dbd --enable-imagemap --enable-ident --enable-cern-meta \
    --enable-lua --enable-xml2enc --enable-http2 \
    --enable-proxy-http2 --enable-md --enable-brotli \
    --with-apr="/usr/bin/apr-1-config" \
    --with-apr-util="/usr/bin/apu-1-config" \
    --with-pcre="/usr"
  make
}

package() {
  cd "httpd"

  make DESTDIR="$pkgdir" install
  install -D -m644 "LICENSE" -t "$pkgdir/usr/share/licenses/apache"

  install -D -m644 "$srcdir/httpd.logrotate" "$pkgdir/etc/logrotate.d/httpd"
  install -D -m644 "$srcdir/httpd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -D -m644 "$srcdir/apache.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/apache.conf"

  # set sane defaults
  sed -e 's#/usr/lib/httpd/modules/#modules/#' \
      -e 's|#\(LoadModule negotiation_module \)|\1|' \
      -e 's|#\(LoadModule include_module \)|\1|' \
      -e 's|#\(LoadModule userdir_module \)|\1|' \
      -e 's|#\(LoadModule slotmem_shm_module \)|\1|' \
      -e 's|#\(Include conf/extra/httpd-multilang-errordoc.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-autoindex.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-languages.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-userdir.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-default.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-mpm.conf\)|\1|' \
      -i "$pkgdir/etc/httpd/conf/httpd.conf"

  # cleanup
  rm -r "$pkgdir/etc/httpd/conf/original"
  rm -r "$pkgdir/run"
  rm -r "$pkgdir/srv"
}
