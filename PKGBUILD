# Maintainer: Surya Vamsi <25237999+suryavamsi6@users.noreply.github.com>
# AUR recipe: fetches the tagged source archive from GitHub by checksum.
pkgname=bluet
pkgver=1.1.1
pkgrel=1
pkgdesc='Native Bluetooth device manager using the system BlueZ service'
arch=('x86_64')
url='https://github.com/suryavamsi6/bluet'
license=('MIT OR Apache-2.0')
depends=('bluez' 'dbus' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'libglvnd' 'libpulse' 'vulkan-icd-loader'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo' 'rust' 'pkg-config' 'desktop-file-utils')
optdepends=('vulkan-driver: a Vulkan driver for your graphics hardware')
# Let makepkg strip: the Rust binary carries about 10 MB of symbols it does not
# need at runtime. The Bun build this replaced needed !strip because its payload
# lived inside the executable, which no longer applies.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('36327571d239804295fecc1b3ccc2439380c3c95dd677e60aea05e292c4a3a12')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --lib --bins
  desktop-file-validate packaging/linux/dev.bluet.manager.desktop
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/bluet "${pkgdir}/usr/bin/bluet"
  install -Dm644 packaging/linux/dev.bluet.manager.desktop \
    "${pkgdir}/usr/share/applications/dev.bluet.manager.desktop"
  install -Dm644 packaging/linux/dev.bluet.manager.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.bluet.manager.svg"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/bluet/README.md"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/bluet/"
  install -dm755 "${pkgdir}/usr/share/licenses/bluet/third-party"
  install -m644 assets/licenses/* "${pkgdir}/usr/share/licenses/bluet/third-party/"
}
