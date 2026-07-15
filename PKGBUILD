# Maintainer: massiveadam <massiveadam@users.noreply.github.com>
pkgname=massiveeq-git
pkgver=0.3.0.beta.1.r0.g00571ee
pkgrel=1
pkgdesc='Beta device-aware equalizer for PipeWire and Wayland desktops'
arch=('x86_64')
url='https://github.com/massiveadam/massiveeq'
license=('MIT')
depends=('pipewire>=1:1.4' 'libpipewire' 'wireplumber>=0.5' 'gtk4>=4.18' 'libadwaita>=1.8' 'glib2' 'cairo' 'libsndfile' 'libsamplerate' 'glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'git')
provides=('massiveeq')
conflicts=('massiveeq')
options=('!debug')
install=massiveeq.install
source=("$pkgname::git+https://github.com/massiveadam/massiveeq.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf '0.3.0.beta.1.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  local _target
  _target=$(rustc -vV | sed -n 's/^host: //p')
  cargo fetch --locked --target "$_target"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --workspace --release --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/massiveeq "$pkgdir/usr/bin/massiveeq"
  install -Dm755 target/release/massiveeqd "$pkgdir/usr/bin/massiveeqd"
  install -Dm755 target/release/massiveeq-tray "$pkgdir/usr/bin/massiveeq-tray"
  install -Dm644 packaging/massiveeq.service "$pkgdir/usr/lib/systemd/user/massiveeq.service"
  install -Dm644 packaging/massiveeq-tray.service "$pkgdir/usr/lib/systemd/user/massiveeq-tray.service"
  install -Dm644 packaging/org.massiveeq.Service1.service "$pkgdir/usr/share/dbus-1/services/org.massiveeq.Service1.service"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.desktop "$pkgdir/usr/share/applications/org.massiveeq.MassiveEQ.desktop"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.metainfo.xml "$pkgdir/usr/share/metainfo/org.massiveeq.MassiveEQ.metainfo.xml"
  install -Dm644 packaging/org.massiveeq.MassiveEQ.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.massiveeq.MassiveEQ.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
