# Maintainer: Astrophagus <ocr12@duck.com>
pkgname=lockinToday-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A minimalistic pomodoro app built in Tauri and deno: With task tracker, focus music and focus timer"
arch=('x86_64')
url="https://github.com/purplehippo911/pomodoro-app"
license=('MIT')
groups=()
depends=('glibc' 'webkit2gtk' 'gtk3') # Tauri runtime
makedepends=('rust' 'rustup' 'cargo' 'deno' 'tauri-cli') # Build deps
checkdepends=()
optdepends=()
provides=()
conflicts=('lockinToday-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/purplehippo911/pomodoro-app.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "pomodoro-app"
}

build() {
	cd "pomodoro-app" 
  export CARGO_HOME="$PWD/cargo-home"
  rustup toolchain install stable
  cargo tauri build --release
}

package() {
	cd "pomodoro-app"
  install -Dm755 "src-tauri/target/release/lockinToday" "$pkgdir/usr/bin/lockinToday"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/lockinToday.png" 2>/dev/null || true
cp lockinToday.desktop "$pkgdir/usr/share/applications/lockinToday.desktop"
}
