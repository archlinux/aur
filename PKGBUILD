# Maintainer: hikarilucky79 <hikarilucky79@users.noreply.github.com>
pkgname=keyra-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Premium low-latency typing sound engine & real-time mechanical keyboard visualizer"
arch=('x86_64')
url="https://github.com/hikarilucky79/keyra"
license=('GPL3')
depends=('gtk3' 'alsa-lib' 'glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('keyra')
conflicts=('keyra')
source=("git+https://github.com/hikarilucky79/keyra.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/keyra"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/keyra/keyra-daemon"
  export CARGO_HOME="$srcdir/cargo-home"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --release

  cd "$srcdir/keyra/keyra-flutter"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  flutter build linux --release
}

package() {
  # 1. Instalar o Daemon
  install -Dm755 "$srcdir/keyra/keyra-daemon/target/release/keyra-daemon" "$pkgdir/usr/bin/keyra-daemon"

  # 2. Instalar a UI (Flutter bundle) no /opt/keyra
  mkdir -p "$pkgdir/opt/keyra"
  cp -r "$srcdir/keyra/keyra-flutter/build/linux/x64/release/bundle/"* "$pkgdir/opt/keyra/"
  
  # Dar permissão de execução ao binário do Flutter
  chmod +x "$pkgdir/opt/keyra/keyra_app"

  # Criar link simbólico para a UI no /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/keyra/keyra_app" "$pkgdir/usr/bin/keyra"

  # 3. Instalar o arquivo .desktop para aparecer no menu de aplicativos
  install -Dm644 "$srcdir/keyra/packaging/io.github.hikarilucky79.keyra.desktop" "$pkgdir/usr/share/applications/io.github.hikarilucky79.keyra.desktop"

  # 4. Instalar o serviço systemd do usuário
  install -Dm644 "$srcdir/keyra/packaging/keyra.service" "$pkgdir/usr/lib/systemd/user/keyra.service"

  # 5. Instalar o ícone do aplicativo
  install -Dm644 "$srcdir/keyra/keyra-flutter/assets/icons/tray_icon.png" "$pkgdir/usr/share/pixmaps/io.github.hikarilucky79.keyra.png"
}
