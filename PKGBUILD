# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-kwin-git
pkgver=5.3.14.r21.gab13507c0
pkgrel=1
pkgdesc='KWin configures on DDE'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-kwin"
license=('GPL3')
depends=('deepin-qt5integration' 'deepin-wallpapers' 'kwin')
makedepends=('extra-cmake-modules' 'expac' 'ninja' 'qt5-tools')
source=("$pkgname::git://github.com/linuxdeepin/dde-kwin/"
        tabbox-chameleon-rename.patch
        added-functions-from-their-forked-kwin.patch
        fix-crash.patch
        fix-x11.patch)
sha512sums=('SKIP'
            'c98ee0d884f833b58c207437bddfca9f8c31d71c28d9bfc4de880e937e0bb9094466d1ccf348bae2b3581c2159af448b218cfe3d79c8c4d74c7effda491162bb'
            '48a3bead1c7cde1261f5f710fd055c52f061320999064ba4cc96a81f9b0770ea2a8fba7aff37d20bb7671b219c38bf8424f24fd7742d36b3c6bf171d3874c1f4'
            '73aef1435c83aec18f4535cc121d09121c1fb180f02b11fc57bb61339b79667ae310a4e3eb33263d6ba218b2eab7281dc9014578edf1317226239e8538e08830'
            '625113af4b4fe00b82b18c6697c2f2b23366774a820e0a83c33818846611c972dde079e5422cda92111c561d064f3767177aaa9258dd805704dbc7bb5361dab9')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|/usr/share/backgrounds/default_background.jpg|/usr/share/backgrounds/deepin/desktop.jpg|' plugins/kwineffects/multitasking/background.cpp
  patch -R -p1 -i ../added-functions-from-their-forked-kwin.patch
  patch -p1 -i ../tabbox-chameleon-rename.patch
  patch -p1 -i ../fix-crash.patch
  patch -p1 -i ../fix-x11.patch
}

build() {
  cd $pkgname
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DKWIN_VERSION=$(expac %v kwin | cut -d - -f 1)
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install

  chmod +x "$pkgdir"/usr/bin/kwin_no_scale
}
