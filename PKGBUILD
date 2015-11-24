# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=haka
pkgver=0.3.0
pkgrel=1
pkgdesc="Collection of tools that allows capturing TCP/IP packets and filtering them based on Lua policy files"
url="http://haka-security.org/"
arch=('i686' 'x86_64')
license=('MPL')
depends=('wireshark-cli' 'rsync' 'libpcap' 'gawk' 'libedit' 'pcre' 'lua' 'capstone' 'luajit')
makedepends=('cmake' 'swig' 'doxygen' 'python2-sphinx' 'check' 'iniparser')
options=('!emptydirs')
backup=('etc/haka/haka.conf')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/haka-security/haka/releases/download/v${pkgver}/haka_${pkgver}_source.tar.gz
        fix-32bit-build.patch)
sha512sums=('8c2c219b8e89710289e300c1fd8ad9b6a95562efc77966bee7ddf343d73b108d6ebf3f7ff73963ca66954bdc0719c08eef127e58ffa42469ae47cf95e817e720'
            'd4b5db5fb3d04a4c2bb6d4c5833d34a21b3aac8f81eafa8305a0ca57a8bd24578a7baab05e485cb855d3ff0c48b3baa1627ed1db3553fda8c4b7de420d61a857')

prepare() {
  cd ${pkgname}_${pkgver}_source

  patch -p1 < "${srcdir}/fix-32bit-build.patch"
  sed 's|sbin|bin|g' -i \
    CMakeLists.txt \
    src/hakactl/CMakeLists.txt \
    src/haka/CMakeLists.txt \
    external/luajit/luajit.cmake
  sed 's|-Wall -Werror|-Wall|g' -i CMakeLists.txt
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
