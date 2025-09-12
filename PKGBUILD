# Maintainer: Tomasz Kowalski <jackpotmachinedev777@gmail.com>
pkgname='tauri-system-monitor'
pkgver=r29.a41b5bf
pkgrel=1
pkgdesc="Lightweight system monitor"
arch=('x86_64')
url="https://github.com/JackpotMachine777/tauri-system-monitor"
license=('GPL')
depends=('glibc' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
makedepends=('nodejs' 'npm' 'rust' 'pkg-config' 'gcc' 'make' 'git' 'clang' 'lld' 'llvm')
options=(!strip)
source=("git+https://github.com/JackpotMachine777/tauri-system-monitor#branch=main")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	npm install
}

build() {
	cd "$srcdir/$pkgname"

  export NO_STRIP=true
  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export RANLIB=llvm-ranlib
  export RUSTFLAGS="-C lto=no -C linker=clang -C link-arg=-fuse-ld=lld"
  export TAURI_LOG=trace

  unset CFLAGS
  unset LDFLAGS

  npm run tauri build --release --verbose
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 src-tauri/target/release/tauri-system-monitor "$pkgdir/usr/bin/tauri-system-monitor"

    install -d "$pkgdir/usr/share/applications/"

    cat > "$pkgdir/usr/share/applications/tauri-system-monitor.desktop" <<EOF
[Desktop Entry]
Name=Tauri System Monitor
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/tauri-system-monitor
Icon=/usr/share/icons/hicolor/128x128/apps/tauri-system-monitor.png
Type=Application
Categories=Utility;
EOF

    install -Dm644 src-tauri/icons/sysmon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/tauri-system-monitor.png"
}

