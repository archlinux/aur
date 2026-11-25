# Maintainer: KometTeam

pkgname=komet
pkgver=0.5.0_dev.23
pkgrel=1
pkgdesc="Komet — Multifunctional MAX client (Flutter desktop)"
arch=('x86_64')
url="https://github.com/KometTeam/Komet"
license=('GPL3')
depends=('gtk3' 'glib2' 'libsecret' 'libepoxy'
         'at-spi2-core' 'mpv' 'opus' 'libogg' 'jsoncpp')
makedepends=('flutter' 'git' 'rustup' 'clang' 'cmake' 'ninja')
options=(!debug !buildflags !lto) # Отключаем debug пакет, чтобы не было конфликтов с flutter-debug
source=("git+https://github.com/KometTeam/Komet.git#tag=v${pkgver//_/-}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/Komet"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/Komet"

  export RUSTUP_HOME="$srcdir/rustup"
  export CARGO_HOME="$srcdir/cargo"
  export RUSTUP_TOOLCHAIN=stable

  rustup toolchain install stable --profile minimal

  unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS

  flutter build linux --release
}

package() {
  cd "$srcdir/Komet"

  install -d "$pkgdir/opt/komet"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/komet/"


  ln -s /opt/komet/Komet "$pkgdir/usr/bin/komet"


  echo "[Desktop Entry]
Name=Komet
Comment=Multifunctional MAX client
Exec=/usr/bin/komet
Icon=komet
Type=Application
Categories=Network;Chat;
Terminal=false" > "$pkgdir/usr/share/applications/komet.desktop"

  if [ -f "assets/icon/komet_512.png" ]; then
    install -m644 assets/icon/komet_512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/komet.png"
  fi
}
