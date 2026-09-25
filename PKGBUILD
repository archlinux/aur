# Maintainer: Lucasion <ion@ionnet.dev>
pkgname=podium-bin
_pkgname=podium
pkgver=0.1.1
pkgrel=1
pkgdesc='Open-source, local-first game clipping: an instant replay buffer, global hotkeys and a clip library (prebuilt)'
arch=('x86_64')
url='https://github.com/LucasionGS/podium'
license=('GPL-3.0-or-later')
# Electron's runtime libraries (as in electron-builder.yml); gpu-screen-recorder does the capturing.
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib' 'at-spi2-core' 'libxkbcommon' 'mesa' 'libcups'
  'gpu-screen-recorder')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Electron ships prebuilt, already-stripped binaries.
options=('!strip' '!debug')
# The pacman package the release workflow builds with electron-builder.
source=("$_pkgname-$pkgver.pacman::$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman")
noextract=("$_pkgname-$pkgver.pacman")
# publish.sh fills in the checksum of each release.
sha256sums=('5ae303861eb9992c319e4889190100ee47567aa10c0f95a8e24ebf1f3f5f17bb')

package() {
  # Install its files, minus its pacman metadata; this PKGBUILD provides its own.
  bsdtar -xf "$_pkgname-$pkgver.pacman" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL --exclude .BUILDINFO
  # electron-builder's install script creates this link at install time; ship it in the package instead.
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Podium/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
