pkgname=ayllu
pkgver=0.4.0
pkgrel=1
pkgdesc="Ayllu Forge"
arch=("x86_64")
license=("AGPL3")
url="https://ayllu-forge.org/projects/ayllu"
depends=(
	"git"
)
makedepends=(
	"rust"
)
provides=("ayllu")
optdepends=()
source=(
	"$pkgname-$pkgver::https://ayllu-forge.org/ayllu/ayllu/refs/archive/$pkgver.tar.gz"
)

sha256sums=("1d4cff32a8b927228198c326c4831a07d528dece8b1183dc35fc98479596a2d1")
# See: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

prepare() {
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
    cargo test --frozen --all-features
}

build() {
	export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
	install -Dm755 \
		"${srcdir}/target/release/ayllu" "${pkgdir}/usr/bin/ayllu"
	install -Dm755 \
		"${srcdir}/target/release/quipu" "${pkgdir}/usr/bin/quipu"
	install -Dm755 \
		"${srcdir}/target/release/ayllu-shell" "${pkgdir}/usr/bin/ayllu-shell"
	install -Dm755 \
		"${srcdir}/target/release/ayllu-keys" "${pkgdir}/usr/bin/ayllu-keys"
	install -Dm644 \
		"${srcdir}/ayllu/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 \
		"${srcdir}/ayllu/config.example.toml" "${pkgdir}/etc/ayllu/config.example.toml"
	install -Dm644 \
		"${srcdir}/ayllu/contrib/systemd/system/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/system/ayllu.service"
	install -Dm644 \
		"${srcdir}/ayllu/contrib/systemd/user/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/user/ayllu.service"
}
