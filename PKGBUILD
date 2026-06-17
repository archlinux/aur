# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whylian
pkgver=1.0.2
pkgrel=1
pkgdesc="Lian Li device control for Linux — HydroShift II AdvanceMode fork of lian-li-linux"
arch=('x86_64')
url="https://github.com/byrdltd/whylian"
license=('MIT')
depends=(
  'libusb'
  'ffmpeg'
  'fontconfig'
  'mesa'
  'libxkbcommon'
  'wayland'
  'libx11'
  'libinput'
  'libdrm'
  'libjpeg-turbo'
  'evdi-dkms'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'clang'
  'cmake'
  'pkg-config'
  'nasm'
)
optdepends=(
  'systemd: user daemon unit (enabled globally on install)'
)
provides=('lianli-linux' 'lianli-linux-git')
conflicts=('whylian-git' 'lianli-linux' 'lianli-linux-git')
source=("whylian::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=whylian.install
options=('!debug' '!lto' 'strip')

prepare() {
  cd whylian
  git submodule update --init --recursive
  /usr/bin/cargo fetch --locked --target "$(/usr/bin/rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd whylian
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SLINT_NO_QT=1
  export RUSTFLAGS='-D warnings'
  /usr/bin/cargo build --frozen --release -p lianli-daemon -p lianli-gui
}

package() {
  cd whylian

  install -Dm755 target/release/lianli-daemon "${pkgdir}/usr/bin/lianli-daemon"
  install -Dm755 target/release/lianli-gui "${pkgdir}/usr/bin/lianli-gui"
  install -Dm644 packaging/udev/99-lianli.rules "${pkgdir}/usr/lib/udev/rules.d/99-lianli.rules"
  install -Dm644 packaging/systemd/lianli-daemon.service \
    "${pkgdir}/usr/lib/systemd/user/lianli-daemon.service"
  install -Dm644 packaging/modules-load.d/lianli-evdi.conf \
    "${pkgdir}/usr/lib/modules-load.d/lianli-evdi.conf"
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.desktop \
    "${pkgdir}/usr/share/applications/com.sgtaziz.lianlilinux.desktop"
  install -Dm644 assets/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.sgtaziz.lianlilinux.svg"
  install -dm755 "${pkgdir}/usr/share/whylian/templates"
  cp -a templates/. "${pkgdir}/usr/share/whylian/templates/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 DISCLAIMER.md "${pkgdir}/usr/share/doc/${pkgname}/DISCLAIMER.md"
}
