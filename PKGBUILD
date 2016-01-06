# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=haka
pkgver=0.3.0
pkgrel=2
pkgdesc="Collection of tools that allows capturing TCP/IP packets and filtering them based on Lua policy files"
url="http://haka-security.org/"
arch=('i686' 'x86_64')
license=('MPL')
depends=('wireshark-cli' 'rsync' 'libpcap' 'gawk' 'libedit' 'pcre' 'lua' 'capstone' 'luajit')
makedepends=('cmake' 'swig' 'doxygen' 'python2-sphinx' 'check' 'iniparser')
options=('!emptydirs')
backup=('etc/haka/haka.conf')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/haka-security/haka/releases/download/v${pkgver}/haka_${pkgver}_source.tar.gz
        fix-32bit-build.patch::https://github.com/haka-security/haka/commit/187e56b8df5b2ddfd8ade5eef747b3952ee6435c.patch
        missing-return.patch::https://github.com/haka-security/haka/commit/185b0aee04d8d80997a6d250c5788ba058149981.patch
        unused-arg.patch::https://github.com/haka-security/haka/commit/50c5968b345f7c76ede00cb2103d47aa32d6648c.patch)
sha512sums=('8c2c219b8e89710289e300c1fd8ad9b6a95562efc77966bee7ddf343d73b108d6ebf3f7ff73963ca66954bdc0719c08eef127e58ffa42469ae47cf95e817e720'
            'b3be609b41e46de2d611bd08887b032fa0fba8d00256c306f449489ea951a4343ec8bba7588cb80f89e35f82c9892fe6581e9fab25c5e25715822909f45e6d9c'
            '3ae11ec71f9f66fe3f5d28a3ab10cb772b674a89d87939fbd3e733d60dee298173e7248a1c42ee48638d11e9a3aa730f105d942d2c553143f13aba1c11147a5a'
            '16a7f23b106a0c6af18f8d3fdc7f6c4cb074af7aae1665db9b74ee8231f8962a6a61f81d2a9aabbe8ed8acb514fc9ae8aa7c125d219c3fed3ffc5c4c19b42ee8')

prepare() {
  cd ${pkgname}_${pkgver}_source

  patch -p1 < "${srcdir}/fix-32bit-build.patch"
  patch -p1 < "${srcdir}/missing-return.patch"
  patch -p1 < "${srcdir}/unused-arg.patch"
  sed 's|sbin|bin|g' -i \
    CMakeLists.txt \
    src/hakactl/CMakeLists.txt \
    src/haka/CMakeLists.txt \
    external/luajit/luajit.cmake
  sed 's|sphinx-build|sphinx-build2|g' -i build/FindSphinx.cmake
  # temporary html docs via doxygen as sphinx generator is broken
  sed -r 's|(GENERATE_XML[ ]+=) YES|\1 NO|g' -i doc/Doxyfile.in
  sed -r 's|(HTML_OUTPUT[ ]+=) xml|\1 html|g' -i doc/Doxyfile.in

  mkdir make
}

build() {
  cd ${pkgname}_${pkgver}_source/make
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make doc-doxygen
}

check() {
  cd ${pkgname}_${pkgver}_source/make
  make tests
}

package() {
  cd ${pkgname}_${pkgver}_source/make
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/html "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /usr/share/haka/sample "${pkgdir}/usr/share/doc/${pkgname}/sample"
}

# vim: ts=2 sw=2 et:
