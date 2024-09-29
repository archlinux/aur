# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>
# Contributor: Felipe Zimmerle <zimmerle@gmail.com> (GPG SIGNATURE)
# Contributor: Victor Hora <victor.hora@nccgroup.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

pkgname=libmodsecurity2
_name=modsecurity
pkgver=2.9.8
pkgrel=2
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx, v2 branch'
arch=('x86_64')
url='https://github.com/owasp-modsecurity/ModSecurity/tree/v2/master'
license=('Apache-2.0')
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
makedepends=('gcc')
provides=('libmodsecurity' 'modsecurity')
conflicts=("libmodsecurity")
source=("https://github.com/owasp-modsecurity/ModSecurity/releases/download/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha256sums=('cd57bd37f6062dca39dc8fba8d3e8db7351c5095de1e9ce7c3aa3890bc95855f')

prepare() {
  cd "${srcdir}/${_name}-v${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_name}-v${pkgver}"
  # Consider errors from -Wformat-security -Wincompatible-pointer-types as warnings
  # see https://github.com/owasp-modsecurity/ModSecurity/issues/3173
  export CFLAGS="$CFLAGS -Wno-error=format-security -Wno-error=incompatible-pointer-types"
  export CXXFLAGS="$CXXFLAGS -Wno-error=format-security -Wno-error=incompatible-pointer-types"
  ./configure \
    --prefix=/usr \
    --enable-standalone-module \
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
}

package() {
  cd "${srcdir}/${_name}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/httpd/modules"
  cp "${pkgdir}/usr/lib/mod_security2.so" "${pkgdir}/usr/lib/httpd/modules/mod_security2.so"
}
