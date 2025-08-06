# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>
# Contributor: Felipe Zimmerle <zimmerle@gmail.com> (GPG SIGNATURE)
# Contributor: Victor Hora <victor.hora@nccgroup.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=libmodsecurity2
_name=modsecurity
pkgver=2.9.12
pkgrel=1
pkgdesc='Cross platform web application firewall module for Apache httpd (v2)'
arch=('x86_64')
url='https://github.com/owasp-modsecurity/ModSecurity/tree/v2/master'
license=('Apache-2.0')
depends=(
  'apache'
  'apr'
  'apr-util'
  'db'
  'curl'
  'expat'
  'glibc'
  'libldap'
  'libxml2'
  'lua'
  'pcre2'
  'perl'
  'gdbm'
  'yajl'
)
makedepends=('gcc')
provides=('libmodsecurity' 'modsecurity')
conflicts=("libmodsecurity")
source=(
  "https://github.com/owasp-modsecurity/ModSecurity/releases/download/v${pkgver}/${_name}-v${pkgver}.tar.gz" 
)
sha256sums=('79ada8693303be3490201397344bf66900a45f07ae328bf6cf01ca99e5d135fa')

prepare() {
  cd "${srcdir}/${_name}-v${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_name}-v${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-htaccess-config
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
  echo "Stripping unneeded symbols from shared objects"
  find ./ -name '*.so' -exec strip --strip-unneeded {} \+
}

package() {
  cd "${srcdir}/${_name}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo "Adding prefix to bin files"
  cd "${pkgdir}/usr/bin"
  for f in * ; do mv -- "$f" "mod_security2_$f" ; done
}
