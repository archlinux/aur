# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=kdeglance-bin
pkgver=2.0.2
pkgrel=1
# Upstream's own package release in the asset name, synced by pkg.sh. It moves
# when upstream rebuilds a version that has already shipped.
_relver=1
pkgdesc="Quick Look-style file preview for KDE Plasma and Dolphin (upstream binary, needs an x86-64-v3 CPU)"
arch=('x86_64')
url="https://github.com/AlexGraveler/KDEGlance"
license=('GPL-3.0-or-later')
# The same list as upstream's package, checked by pkg.sh, minus qt6-wayland
# (in qt6-base since Qt 6.12) and ffmpeg (nothing links it, qt6-multimedia-ffmpeg
# pulls it in). The Qt minimum is the Qt upstream built against.
depends=('dolphin' 'glibc' 'hicolor-icon-theme' 'kcoreaddons' 'kimageformats'
         'kio' 'kio-fuse' 'kjobwidgets' 'kservice' 'kwindowsystem' 'libgcc'
         'libraw' 'libstdc++' 'poppler-qt6' 'procps-ng' 'qt6-5compat' 'qt6-base>=6.12.0'
         'qt6-imageformats' 'qt6-multimedia' 'qt6-multimedia-ffmpeg' 'qt6-svg')
optdepends=('libreoffice: Office document previews'
            'kio-extras: SMB and more network protocols'
            'libheif: HEIF/HEIC photos'
            'libavif: AVIF images'
            'libjxl: JPEG XL images'
            'openexr: OpenEXR images'
            'openjpeg2: JPEG 2000 images'
            'fluidsynth: MIDI playback'
            'soundfont-fluid: General MIDI SoundFont for fluidsynth')
provides=("kdeglance=${pkgver}")
conflicts=('kdeglance')
options=('!strip' '!debug')
install=kdeglance.install
# The release asset is a pacman package built by upstream on CachyOS from its
# packaging/arch/PKGBUILD. makepkg extracts it, only its usr/ is taken.
source=("${url}/releases/download/v${pkgver}/kdeglance-${pkgver}-${_relver}-x86_64.pkg.tar.zst")
sha256sums=('4557e74e2bed503ca14b319570f51c4bd2d552007216032d2c0efb172964b165')

prepare() {
  # The viewer is built for x86-64-v3, and glibc refuses to start it on an
  # older CPU. Say so now instead.
  if ! /usr/lib/ld-linux-x86-64.so.2 --help | grep -q 'x86-64-v3 (supported'; then
    echo "This CPU does not support x86-64-v3. Install kdeglance instead." >&2
    return 1
  fi
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/kdeglance" "$pkgdir/usr/share/licenses/$pkgname"
}
