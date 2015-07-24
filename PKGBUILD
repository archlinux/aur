# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Yichao Yu <yuyichao@gmail.com>

_pkgbasename=ibus-qt
pkgname=lib32-${_pkgbasename}
pkgver=1.3.3
pkgrel=2
pkgdesc='IBus qt library and IBus qt input method plugin'
arch=('x86_64')
license=('LGPL')
url='https://github.com/ibus/ibus-qt'
depends=('lib32-qt4' ${_pkgbasename})
makedepends=('gcc-multilib' 'cmake' 'automoc4' 'doxygen')
source=("https://github.com/ibus/ibus-qt/releases/download/${pkgver}/${_pkgbasename}-${pkgver}-Source.tar.gz")
sha1sums=('3711d9099ac97d1b3bc7313080a016caa04ae66e')

build() {
  _cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  _jc=$((${_cpucount:-1}))

  cd "${srcdir}"
  mkdir -p build
  cd build

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake "../${_pkgbasename}-${pkgver}-Source" -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib32 -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins/
  make -j $_jc
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
