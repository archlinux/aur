# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=uu-remote-linux
pkgver=0.2.8
pkgrel=1
pkgdesc='Unofficial Linux host for NetEase UU Remote (remote desktop)'
arch=('x86_64')
url='https://github.com/VallierDev/uu-remote-linux'
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'glib2'
  'glibc'
  'gtk3'
  'libei'
  'libpipewire'
  'libx11'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxtst'
  'sdl2'
  'wayland'
)
makedepends=(
  'cargo'
  'pkgconf'
)
optdepends=(
  'hyprland: native Hyprland backend (hyprctl)'
  'libayatana-appindicator: tray icon on GNOME'
  'pciutils: GPU detection when choosing an encoder'
  'wl-clipboard: clipboard integration on Wayland'
  'xclip: clipboard integration on X11'
  'xsel: clipboard integration on X11 (alternative to xclip)'
  'xdg-desktop-portal: screen capture and input on Wayland'
  'xdg-desktop-portal-gnome: GNOME Wayland capture and input backend'
  'xdg-desktop-portal-kde: KDE Wayland capture and input backend'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'uuremote-native.service'
        '60-uu-remote-linux-uinput.rules')
sha256sums=('d0a8e1b42474a75f667ef366495a7ffd0f3e7e6a3e3b1fc3abf3cb3c3e78fe56'
            'c33ce11f40c530fd2a6238707ca1711f8e734db3cf6fb7e5d6d93c6d4fea68f8'
            '2752412c9c2ddbffa4d5882be06a2f10d7ee590c3d1f3b16bf37ea5c1b8d1f34')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
  cargo build --release --locked --frozen --features wayland,portal
  cargo build --release --locked --frozen --features native-viewer,viewer-sdl --bin uuremote-viewer
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/uuremote-server "${pkgdir}/usr/bin/uuremote-server"
  install -Dm755 target/release/uuremote-viewer "${pkgdir}/usr/bin/uuremote-viewer"

  install -Dm644 contrib/desktop/uu-remote-linux.desktop \
    "${pkgdir}/usr/share/applications/uu-remote-linux.desktop"
  install -Dm644 contrib/desktop/uu-remote-linux.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uu-remote-linux.svg"

  install -Dm644 "${srcdir}/uuremote-native.service" \
    "${pkgdir}/usr/lib/systemd/user/uuremote-native.service"
  install -Dm644 "${srcdir}/60-uu-remote-linux-uinput.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/60-uu-remote-linux-uinput.rules"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 config.example.json "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
}
