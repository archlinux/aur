# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://forgejo.voten.me/Voten641/minnow"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=('breeze-icons: the icons Minnow is designed around'
            'udisks2: mounting removable drives and disk images'
            'polkit: Act as Administrator (admin:///)'
            'kdeconnect: Send To your phone and other devices'
            'bluedevil: Send To over Bluetooth'
            'xdg-utils: Send by Email'
            'smbclient: browsing smb:// (Windows/Samba) network folders'
            'ffmpegthumbnailer: video thumbnails'
            'git: version control status on icons'
            'avahi: finding servers for the Network place')
makedepends=('cargo')
# Forgejo-generated archive - unpacks to a bare "minnow/" directory, not "minnow-$pkgver/"
source=("$pkgname-$pkgver.tar.gz::https://forgejo.voten.me/Voten641/minnow/archive/v$pkgver.tar.gz")
sha256sums=('9ddd38f31edd86c3a46b3eaaa5c740d304b4accbf0b51e49966aa18ce2a8b54b')

prepare() {
  cd minnow
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd minnow
  MINNOW_APP_VERSION="$pkgver" CARGO_TARGET_DIR=target cargo build --release --frozen
}

check() {
  cd minnow
  CARGO_TARGET_DIR=target cargo test --release --frozen
}

package() {
  cd minnow
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
