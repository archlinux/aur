# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=datalink
pkgname="${_pkgbase}-git"
pkgver=r12.24b3a70
pkgrel=1
pkgdesc="Simple wrapper for Steam Games that can deploy memorymap bridges and more"
arch=('x86_64')
url="https://github.com/LukasLichten/${_pkgbase}"
license=('MIT')
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
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"

  # Setting up rust build chain
  if [ "$(rustup target list --installed | grep x86_64-pc-windows-gnu)" == '' ]; then
     rustup target add x86_64-pc-windows-gnu
  fi

  cd "$srcdir/${_pkgbase}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/${_pkgbase}"

  make build-full
}

package() {
  cd $srcdir

  install -Dm755 target/release/Datalink "${pkgdir}/usr/bin/Datalink"
}
