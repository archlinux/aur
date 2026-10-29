# Maintainer: Alexandru Spinu <spinualexandru@outlook.com>

# Mirrors upstream's scripts/build-linux-arch-package.sh, but downloads the .deb
pkgname=cap-bin
_pkgname=cap
pkgver=0.6.2
pkgrel=1
pkgdesc='Screen recording with Studio, Instant, and screenshot modes'
arch=('x86_64')
url='https://cap.so'
license=('AGPL-3.0-only AND MIT')
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
        "LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/CapSoftware/Cap/cap-v$pkgver/licenses/LICENSE-MIT")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('4e7427eb7a46a1ef567419bbca7a82c356746baa51eed7f622a283ad8d223868'
            '146364c489e69407a2deaf7621a872339bde0be46d8db6495a51f3d63d95c8dc'
            '8078cb8be22f999ac72697dc96d930031203d18a52f22edd8f20b0f9f4defc1a')

package() {
  bsdtar -xOf "$srcdir/$pkgname-$pkgver.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  for binary in Cap cap-cli cap-muxer; do
    test -x "$pkgdir/usr/bin/$binary"
  done

  # Tells Cap's updater to point users at their package manager instead of the .deb
  printf 'arch\n' > "$pkgdir/usr/lib/cap/package-format"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
