# Maintainer: Tomas Ostasevicius (aquarix) <t dot ostasevicius at gmail dot com>

_pkgbasename=gitter
pkgname=lib32-$_pkgbasename
pkgver=3.1.0
pkgrel=0
pkgdesc='Where developers come to talk'
url='https://gitter.im'
license=('unknown')
arch=('i686')
depends=('libsystemd' 'desktop-file-utils' 'gconf')
makedepends=('tar' 'binutils')
source=("https://update.gitter.im/linux32/${_pkgbasename}_${pkgver}_i386.deb"
        gitter.sh)
noextract=("${_pkgbasename}_${pkgver}_i386.deb")
install='gitter.install'
md5sums=('84218f2b1850026f0ce9440ab74efd90'
         'c64f66a8e47439c42b00da135665c9ee')
options=(!strip)

prepare() {
  cd "$srcdir"
  ar x "${_pkgbasename}_${pkgver}_i386.deb"
}

package() {
  cd "$srcdir"
  tar -C "$pkgdir" -xf data.tar.gz
  mkdir -p "$pkgdir/opt/Gitter/lib"
  ln -sf /usr/lib/libudev.so.1 "$pkgdir/opt/Gitter/lib/libudev.so.0"
  install -Dm755 "$srcdir/$_pkgbasename.sh" "$pkgdir/usr/bin/$pkgname"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "$pkgdir/opt/Gitter/linux32/gitter.desktop"
  sed -e 's#/opt/Gitter/linux32/Gitter#/usr/bin/gitter#' -i "$pkgdir/usr/share/applications/gitter.desktop"
}
