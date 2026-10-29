# Maintainer: Alexandru Spinu <spinualexandru@outlook.com>

# Mirrors upstream's scripts/build-linux-arch-package.sh, but downloads the .deb
pkgname=cap-bin
_pkgname=cap
# Version of the bundled libonnxruntime.so.1, only used to fetch its license
_onnxver=1.24.3
pkgver=0.6.2
pkgrel=1
pkgdesc='Screen recording with Studio, Instant, and screenshot modes'
arch=('x86_64')
url='https://cap.so'
# Cap is AGPL-3.0-only and MIT; the bundled ffmpeg is built with --enable-gpl --enable-version3,
# libheif is LGPL-3.0-or-later and onnxruntime is MIT
license=('AGPL-3.0-only AND MIT AND GPL-3.0-or-later AND LGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'alsa-plugins'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libpipewire'
  'libpulse'
  'libstdc++'
  'libva'
  'libx11'
  'libxkbcommon'
  'libxkbcommon-x11'
  'openssl'
  'vulkan-icd-loader'
  'wayland'
  'xdg-desktop-portal'
  'xdg-utils'
)
optdepends=(
  'xdg-desktop-portal-hyprland: screen capture on Hyprland and Omarchy'
  'vulkan-driver: hardware accelerated recording and editing'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Upstream binaries are already stripped and bundle their own ffmpeg/onnxruntime
options=('!strip' '!debug')
# CrabNebula only serves the current release under /latest/
source=("$pkgname-$pkgver.deb::https://cdn.crabnebula.app/download/cap/cap/latest/Cap_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/CapSoftware/Cap/cap-v$pkgver/LICENSE"
        "LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/CapSoftware/Cap/cap-v$pkgver/licenses/LICENSE-MIT"
        "LICENSE-onnxruntime-$_onnxver::https://raw.githubusercontent.com/microsoft/onnxruntime/v$_onnxver/LICENSE")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('4e7427eb7a46a1ef567419bbca7a82c356746baa51eed7f622a283ad8d223868'
            '146364c489e69407a2deaf7621a872339bde0be46d8db6495a51f3d63d95c8dc'
            '8078cb8be22f999ac72697dc96d930031203d18a52f22edd8f20b0f9f4defc1a'
            '2f07c72751aed99790b8a4869cf2311df85a860b22ded05fa22803587a48922c')

package() {
  bsdtar -xOf "$srcdir/$pkgname-$pkgver.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  for _binary in Cap cap-cli cap-muxer; do
    test -x "$pkgdir/usr/bin/$_binary"
  done

  # Tells Cap's updater to point users at their package manager instead of the .deb
  printf 'arch\n' > "$pkgdir/usr/lib/cap/package-format"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-onnxruntime-$_onnxver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-onnxruntime"
}
