# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=datalink
pkgname="${_pkgbase}-git"
pkgver=r10.ed183d0
pkgrel=1
pkgdesc="Simple wrapper for Steam Games that can deploy memorymap bridges and more"
arch=('x86_64')
url="https://github.com/LukasLichten/${_pkgbase}"
license=('GPL-3.0')
depends=('dbus')
makedepends=('git' 'make' 'cargo' 'mingw-w64-gcc')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")
source=(
  "git+${url}"
)
md5sums=(
  SKIP
)

pkgver() {
	cd "$srcdir/${_pkgbase}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Setting up rust build chain
  if [ "$(rustup target list --installed | grep x86_64-pc-windows-gnu)" == '' ]; then
     rustup target add x86_64-pc-windows-gnu
  fi

  cd "$srcdir/${_pkgbase}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/${_pkgbase}"

  make build
}

package() {
  cd $srcdir/${_pkgbase}

  install -Dm755 target/release/Datalink "${pkgdir}/usr/bin/Datalink"
}
