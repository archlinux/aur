# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=haka-git
_pkgname=haka
pkgver=0.3.0.2192.47374d2
pkgrel=1
pkgdesc="Collection of tools that allows capturing TCP/IP packets and filtering them based on Lua policy files"
url="http://haka-security.org/"
arch=('i686' 'x86_64')
license=('MPL')
depends=('wireshark-cli' 'rsync' 'libpcap' 'gawk' 'libedit' 'pcre' 'lua' 'capstone' 'luajit')
makedepends=('cmake' 'swig' 'doxygen' 'python2-sphinx' 'check' 'iniparser' 'git')
options=('!emptydirs')
backup=('etc/haka/haka.conf')
provides=('haka')
conflicts=('haka')
source=(${pkgname}::git+https://github.com/haka-security/haka
        fix-32bit-build.patch)
sha512sums=('SKIP'
            'd4b5db5fb3d04a4c2bb6d4c5833d34a21b3aac8f81eafa8305a0ca57a8bd24578a7baab05e485cb855d3ff0c48b3baa1627ed1db3553fda8c4b7de420d61a857')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}

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
  git submodule update --init
}

build() {
  cd ${pkgname}/make
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make doc-doxygen
}

check() {
  cd ${pkgname}/make
  make tests
}

package() {
  cd ${pkgname}/make
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r doc/html "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -s /usr/share/haka/sample "${pkgdir}/usr/share/doc/${_pkgname}/sample"
}

# vim: ts=2 sw=2 et:
