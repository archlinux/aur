# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=acc-setupmanager
pkgname="${_pkgbase}-git"
pkgver=v0.2.0.r31.5542480
pkgrel=1
pkgdesc="Setupmanager for Assetto Corsa Competizione using rust and iced"
arch=('x86_64')
url="https://gitlab.com/LukasLichten/${_pkgbase}"
license=('AGPL-3.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")
source=(
  "git+${url}"
  "acc-setupmanager.desktop"
)
md5sums=(
  SKIP
  899f4bc2cd0dc411a6f23a200b4b7f75
)

pkgver() {
	cd "$srcdir/${_pkgbase}"

	# Git, with tags available
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count $(git describe --tags --abbrev=0)..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"

  cd "$srcdir/${_pkgbase}"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR=target
  # no, it won't build without these here, also -ffat-lto-objects does not work either, only disabling it
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export CXXFLAGS="$CXXFLAGS -ffat-lto-objects"

  cd "$srcdir/${_pkgbase}"

  cargo build --release
}

package() {
  cd $srcdir/${_pkgbase}

  install -Dm755 target/release/acc-setupmanager "${pkgdir}/usr/bin/acc-setupmanager"
  install -Dm644 "src/assets/logo.svg" "${pkgdir}/usr/share/pixmaps/com.gitlab.lukaslichten.acc-setupmanager.svg"

  install -Dm644 "${srcdir}/acc-setupmanager.desktop" "${pkgdir}/usr/share/applications/com.gitlab.lukaslichten.acc-setupmanager.desktop"

}
