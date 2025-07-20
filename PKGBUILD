pkgname=ayllu-git
_pkgname=ayllu
pkgver=0.0.0
pkgrel=1
pkgdesc="Hyper Performant & Hackable Code Forge"
arch=("x86_64")
license=("AGPL3")
url="https://ayllu-forge.org/ayllu/ayllu"
depends=(
	"git"
	"libgit2"
	"tree-sitter"
)
makedepends=(
	"rust"
	"gcc"
	"libgit2"
	"tree-sitter"
)
provides=("ayllu-git")
optdepends=()
source=(
	"$_pkgname::git+https://ayllu-forge.org/ayllu/${_pkgname}"
)
# See: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)
sha256sums=("SKIP")

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
		"${srcdir}/ayllu/contrib/systemd/ayllu-sysusers.conf" \
		"${pkgdir}/usr/lib/sysusers.d/ayllu.conf"
	install -Dm644 \
		"${srcdir}/ayllu/contrib/systemd/system/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/system/ayllu.service"
	install -Dm644 \
		"${srcdir}/ayllu/contrib/systemd/user/ayllu.service" \
		"${pkgdir}/usr/lib/systemd/user/ayllu.service"
}
