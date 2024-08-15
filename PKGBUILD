# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=monocoque
pkgname=monocoque-git
pkgver=0.1.0r3
pkgrel=3
pkgdesc="Device Manager for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/monocoque"
license=('GPL3')
depends=(
        hidapi
	libserialport
	libxml2
	argtable
	libconfig
	pipewire-pulse
)
makedepends=(
  git
)
source=(
  git+https://github.com/spacefreak18/monocoque
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -d "-" -f 1-2 | tr "-" "r"
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake -DUSE_PULSEAUDIO=yes ..
  make

  mkdir -p "${pkgdir}/usr/bin/"
  cp "$srcdir/$_reponame"/build/monocoque "${pkgdir}/usr/bin/monocoque"
}

