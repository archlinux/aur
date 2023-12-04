# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>
# Contributor: Felipe Zimmerle <zimmerle@gmail.com> (GPG SIGNATURE)
# Contributor: Victor Hora <victor.hora@nccgroup.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=modsecurity2
pkgver=2.9.7
_localpkgname_ver=${pkgname%2}-${pkgver}
pkgrel=2
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx, v2 branch'
arch=('x86_64')
url='https://github.com/SpiderLabs/ModSecurity/tree/v2/master'
license=('APACHE')
depends=(
  'apache'
  'apr-util'
  'pcre'
  'libxml2'
  'lua'
  'curl'
  'yajl'
  'db'
  'perl'
  'apr'
  'libldap'
  'expat'
  'glibc'
  'gdbm'
)
provides=("${pkgname}=${pkgver}" "modsecurity")
conflicts=("modsecurity")
source=("https://github.com/SpiderLabs/ModSecurity/releases/download/v${pkgver}/${_localpkgname_ver}.tar.gz")
sha256sums=('2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839')

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cp -a "${srcdir}/${_localpkgname_ver}"/* ./
  ./autogen.sh
}

build() {
  # Build package
  cd "${srcdir}/build"
  ./configure \
    --prefix=/usr \
    --enable-standalone-module \
    --enable-htaccess-config
  # Remove RPATH
  # https://tracker.debian.org/media/packages/m/modsecurity-apache/rules-2.9.1-2
  echo "Fixing libtool for hardcoded_into_libs"
  sed -ri 's|(hardcode_into_libs)=.*|\1=no|' libtool
  # Fix lua version check
  # This seems stupid, but the --with-lua option to ./configure doesn't seem to be
  # able to impose the version, and it "just works" with 5.4 so lets go…
  echo "Fixing apache2/msc_lua.c to accept lua 5.4"
  sed -i 's#LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503#LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503 || LUA_VERSION_NUM == 504#' "apache2/msc_lua.c"
  sed -ri 's/We are only tested under Lua 5.0, 5.1, 5.2, or 5.3./We are only tested under Lua 5.0, 5.1, 5.2, or 5.3 (and faking 5.4)./' "apache2/msc_lua.c"
  make
}

package() {
  # Install package
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/httpd/modules"
  cp "${pkgdir}/usr/lib/mod_security2.so" "${pkgdir}/usr/lib/httpd/modules/mod_security2.so"
}
