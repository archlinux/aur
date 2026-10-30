# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>
# Maintainer: tpaau <tpaau-17db@tutamail.com>

pkgname=chilen-git
pkgver=r624.2cb51b2
pkgrel=1
pkgdesc="Fully offline, blazingly fast music player for your library"
arch=(x86_64)
url="https://github.com/tpaau/chilen"
license=('GPL-3.0-or-later')
depends=(wayland libxkbcommon alsa-lib)
makedepends=(git cargo-nightly)
provides=("chilen-git=$pkgver")
conflicts=("chilen-git")
source=(git+https://github.com/tpaau/chilen.git)
b2sums=(SKIP)

prepare() {
	cd "${srcdir}/chilen"

	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target $(rustc --print host-tuple)
}

pkgver() {
	cd "${srcdir}/chilen"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/chilen"

	export RUSTUP_TOOLCHAIN=nightly
	export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

	# TODO: The git version can be considered a development build so the `dev-opts` feature is enabled
	cargo build --release --features mpris --features dev-opts
}

package() {
	cd "${srcdir}/chilen"

	install -Dm755 target/release/chilen "${pkgdir}/usr/bin/chilen-git"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
