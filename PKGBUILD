# Maintainer: Luigi Guevara <luigi.t.guevara@killua.me>
pkgname=pomello
pkgver=0.9.4
pkgrel=1
pkgdesc="Stay Focused. Accomplish more."
arch=('x86_64' 'i686')
url="http://www.pomelloapp.com/"
license=('custom')
depends=('libsystemd')
makedepends=('tar' 'binutils')
install='pomello.install'
source_i686=("Pomello_${pkgver}.deb::http://www.pomelloapp.com/download/linux?package=deb&arch=32")
source_x86_64=("Pomello_${pkgver}.deb::http://www.pomelloapp.com/download/linux?package=deb&arch=64")
options=(!strip)
md5sums_i686=('2aa608af394fbe0303bb0e1411e1708e')
md5sums_x86_64=('7c999fc6596276f5d32d9f5f356ff27d')

prepare() {
  cd "$srcdir"

  ar x "Pomello_${pkgver}.deb"
}

package() {
  cd "$srcdir"

  tar -C "$pkgdir" -xf data.tar.xz

  mkdir -p "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/opt/Pomello/lib"
  ln -nsf /usr/lib/libudev.so.1 "$pkgdir/opt/Pomello/lib/libudev.so.0"

  install -D -m644 "${pkgdir}/opt/Pomello/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
  install -D -m644 "${pkgdir}/opt/Pomello/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

  ln -nsf "/opt/Pomello/pomello" "${pkgdir}/usr/bin/pomello"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "$pkgdir/usr/share/applications/pomello.desktop"
  sed -e 's#/opt/Pomello/pomello#/usr/bin/pomello#' -i "$pkgdir/usr/share/applications/pomello.desktop"
}

# vim:set ts=2 sw=2 et:
