# Maintainer: Lucasion <ion@ionnet.dev>
pkgname=podium
pkgver=0.1.1
pkgrel=1
pkgdesc='Open-source, local-first game clipping: an instant replay buffer, global hotkeys and a clip library'
arch=('x86_64')
url='https://github.com/LucasionGS/podium'
license=('GPL-3.0-or-later')
# Electron's runtime libraries (as in electron-builder.yml); gpu-screen-recorder does the capturing.
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib' 'at-spi2-core' 'libxkbcommon' 'mesa' 'libcups'
  'gpu-screen-recorder')
makedepends=('nodejs' 'pnpm' 'libarchive')
# Electron ships prebuilt, already-stripped binaries.
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# publish.sh fills in the checksum of each release.
sha256sums=('445da77f70b6cec51f843e843b083fa08641ed4f16d0114d96782a8179517a44')

prepare() {
  cd "$pkgname-$pkgver"
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname-$pkgver"
  pnpm dist:pacman --publish never
}

package() {
  cd "$pkgname-$pkgver"
  # Install what electron-builder packaged, minus its pacman metadata; this PKGBUILD provides its own.
  bsdtar -xf dist/*.pacman -C "$pkgdir" --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL --exclude .BUILDINFO
  # electron-builder's install script creates this link at install time; ship it in the package instead.
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Podium/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
