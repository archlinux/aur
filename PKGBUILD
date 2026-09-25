# Maintainer: Lucasion <ion@ionnet.dev>
pkgname=podium-git
_pkgname=podium
pkgver=0.1.0.r5.g2f12869
pkgrel=1
pkgdesc='Open-source, local-first game clipping: an instant replay buffer, global hotkeys and a clip library'
arch=('x86_64')
url='https://github.com/LucasionGS/podium'
license=('GPL-3.0-or-later')
# Electron's runtime libraries (as in electron-builder.yml); gpu-screen-recorder does the capturing.
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib' 'at-spi2-core' 'libxkbcommon' 'mesa' 'libcups'
  'gpu-screen-recorder')
makedepends=('git' 'nodejs' 'pnpm' 'libarchive')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Electron ships prebuilt, already-stripped binaries.
options=('!strip' '!debug')
source=("$_pkgname::git+https://github.com/LucasionGS/podium.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' "$(node -p 'require("./package.json").version')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  pnpm install --frozen-lockfile
}

build() {
  cd "$_pkgname"
  # A reused source dir may still hold the package of an older version.
  rm -rf dist
  pnpm dist:pacman --publish never
}

package() {
  cd "$_pkgname"
  # Install what electron-builder packaged, minus its pacman metadata; this PKGBUILD provides its own.
  bsdtar -xf dist/*.pacman -C "$pkgdir" --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL --exclude .BUILDINFO
  # electron-builder's install script creates this link at install time; ship it in the package instead.
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Podium/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
