# Maintainer: hikarilucky79 <hikarilucky79@users.noreply.github.com>
pkgname=keyra-git
pkgver=0.1.0
pkgrel=2
pkgdesc="Premium low-latency typing sound engine & real-time mechanical keyboard visualizer"
arch=('x86_64')
url="https://github.com/hikarilucky79/keyra"
license=('GPL3')
depends=('gtk3' 'alsa-lib' 'glibc' 'gcc-libs' 'openssl' 'zstd')
makedepends=('rust' 'cargo' 'git' 'pkgconf' 'cmake' 'openssl' 'zstd')
provides=('keyra')
conflicts=('keyra')
source=("git+https://github.com/hikarilucky79/keyra.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/keyra"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/keyra"
  # Initialize Flutter submodules (tray_manager, etc.)
  git submodule update --init --recursive
}

build() {
  # Compilar daemon da raiz do workspace para que o target/ fique em keyra/target/
  cd "$srcdir/keyra"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --release --locked -p keyra-daemon

  cd "$srcdir/keyra/keyra-flutter"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  flutter pub get
  flutter build linux --release
}

package() {
  # Binário: em workspace Rust, o target/ fica na raiz keyra/keyra-daemon (nao dentro de keyra-daemon/target/)
  local daemon_bin="$srcdir/keyra/target/release/keyra-daemon"
  if [ ! -f "$daemon_bin" ]; then
    echo "ERRO: keyra-daemon não encontrado em $daemon_bin"
    ls "$srcdir/keyra/target/release/" 2>/dev/null || true
    exit 1
  fi
  install -Dm755 "$daemon_bin" "$pkgdir/usr/bin/keyra-daemon"

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
