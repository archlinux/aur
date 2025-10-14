# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: coolingtool <coolingtool-backup@outlook.com>

pkgbase=qadwaitadecorations
_pkgname=QAdwaitaDecorations
pkgname=(qadwaitadecorations-qt5 qadwaitadecorations-qt6)
pkgver=0.1.7
pkgrel=3
pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1-or-later)
makedepends=(make cmake qt5-base qt5-wayland-decorations qt6-base qt6-wayland qt5-svg qt6-svg)
source=("https://github.com/FedoraQt/QAdwaitaDecorations/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
		qt6.10.patch)
sha256sums=('6cd96efca241a4b60fb6bf449c64dbad713b223c36e003ae89f45e34739d56d1'
            '44650358bce7359aadc6ddf324369910070df4b091df81beec87f21dd2080a91')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i $srcdir/qt6.10.patch
}

build() {
  cmake -B build-$pkgver-qt5 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAS_QT6_SUPPORT=true \
        -DUSE_QT6=false
  make -C build-$pkgver-qt5

  cmake -B build-$pkgver-qt6 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=true
  make -C build-$pkgver-qt6
}

package_qadwaitadecorations-qt5() {
  pkgdesc='Qt5 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt5-base qt5-wayland-decorations qt5-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt5 install
}

package_qadwaitadecorations-qt6() {
  pkgdesc='Qt6 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt6-base qt6-wayland qt6-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt6 install
}
