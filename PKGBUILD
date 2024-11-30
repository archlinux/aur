pkgname=gpu-state-tray
pkgver=0.1.0
pkgrel=1
pkgdesc='Tray icon showing the power state of an Nvidia Optimus GPU'
url='https://github.com/technologicalMayhem/gpu-state-tray'
source=("$pkgname-$pkgver.tar.gz::https://github.com/technologicalMayhem/gpu-state-tray/archive/v$pkgver.tar.gz")
depends=('glibc' 'gcc-libs' 'dbus')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL-3.0-or-later')
sha256sums=('9c603c433d6f5f2f710320bc096901389f9f5f1f0f2d31bef00875b8c8681f1b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 target/release/gpu-state-tray "${pkgdir}/usr/bin/gpu-state-tray"
    install -Dm 644 gpu-state-tray.service "${pkgdir}/usr/lib/systemd/user/gpu-state-tray.service"
}
