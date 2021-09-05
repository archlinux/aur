# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=os-251
pkgver=1.0.1
pkgrel=1
pkgdesc="Pure digital lo-fi synthesizer plugin"
arch=('x86_64')
groups=('vst3-plugins' 'pro-audio')
url="https://onsenaudio.com/products/os251"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'npm' 'git')
provides=("$pkgname")
source=("$pkgname::git+https://github.com/utokusa/OS-251#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"

  # Build the UI (Node.js and react-juce)
  pushd src/jsui
  npm ci
  npm run build
  popd

  rm -rf build
  mkdir -p build
  cd build
  cmake -DCMAKE_CXX_STANDARD=20 -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}/build"

  pwd
  install -vDm 755 src/Os251_artefacts/Standalone/OS-251 -t "${pkgdir}/usr/bin/"
  install -dvDm 644 src/Os251_artefacts/VST3/OS-251.vst3 "${pkgdir}/usr/lib/vst3/"
}
