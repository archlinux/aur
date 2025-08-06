pkgname=ayllu
pkgver=0.5.1
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

sha256sums=("f761da5740aa7da683276bb3ba1363995d38ae34abb7c3530f1f71476d80f360")
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
	SRC_ROOT="${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 \
		"${srcdir}/target/release/ayllu" "${pkgdir}/usr/bin/ayllu"
	install -Dm755 \
		"${srcdir}/target/release/quipu" "${pkgdir}/usr/bin/quipu"
	install -Dm755 \
		"${srcdir}/target/release/ayllu-shell" "${pkgdir}/usr/bin/ayllu-shell"
	install -Dm755 \
		"${srcdir}/target/release/ayllu-keys" "${pkgdir}/usr/bin/ayllu-keys"
	install -Dm644 \
		"${SRC_ROOT}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 \
		"${SRC_ROOT}/config.example.toml" "${pkgdir}/etc/ayllu/config.example.toml"
	install -Dm644 \
		"${SRC_ROOT}/contrib/systemd/ayllu-sysusers.conf" \
		"${pkgdir}/usr/lib/sysusers.d/ayllu.conf"
	install -Dm644 \
		"${SRC_ROOT}/contrib/systemd/system/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/system/ayllu.service"
	install -Dm644 \
		"${SRC_ROOT}/contrib/systemd/user/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/user/ayllu.service"
}
