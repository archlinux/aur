# Maintainer: Light2Yellow <oleksii.vilchanskyi@gmail.com>

pkgname=ckb-next-newfw-git
pkgver=0.2.8.r246.ga35db6e
pkgrel=2
pkgdesc="Corsair Keyboard and Mouse Input Driver, git newfw branch"
arch=('i686' 'x86_64')
url="https://github.com/mattanger/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)'
            'libappindicator-gtk3: Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library)')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next-newfw-git.install
source=('ckb-next-newfw-git::git+https://github.com/mattanger/ckb-next.git#branch=newfw')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  # based on annotated and lightweight tags, always has long version as it's a rolling release
  # discards v, replaces dashes with dots
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname%-VCS}"
  ./qmake-auto
  make -j$(nproc --all)
}

package() {
  cd "$srcdir/${pkgname%-VCS}"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/ckb-animations"
  install -Dm755 bin/ckb{,-daemon} "$pkgdir/usr/bin/"
  install -D bin/ckb-animations/* "$pkgdir/usr/lib/ckb-animations/"

  install -Dm644 usr/ckb.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ckb.png"
  install -Dm644 usr/ckb.desktop "${pkgdir}/usr/share/applications/ckb.desktop"

  install -Dm644 service/systemd/ckb-daemon.service "${pkgdir}/usr/lib/systemd/system/ckb-daemon.service"
}
