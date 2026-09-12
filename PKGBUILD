# Maintainer: FatDawlf <zazaguichi@outlook.com>
pkgname=lupa-git
pkgver=r49.ef611c9
pkgrel=1
pkgdesc="A minimalist launcher built on gtk4-layer-shell."
arch=('x86_64' 'aarch64')
url="https://github.com/Azakidev/lupa"
license=('MIT')

conflicts=('lupa')
provides=("lupa=${pkgver}")

makedepends=('git' 'cargo' 'rust' 'gettext' 'blueprint-compiler' 'pkgconf')
options=(!debug !lto)

depends=(
	'gtk4' 'gtk4-layer-shell' 'libadwaita'
	'xdg-utils' 'localsearch'
)

source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
	export CARGO_HOME="$SRCDEST/cargo-home"
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export CARGO_HOME="$SRCDEST/cargo-home"
	cargo build --frozen --release
}

package() {
	cd "$pkgname"

	local binname="${pkgname//-git/}"

	install -Dm755 "target/release/$binname" "$pkgdir/usr/bin/$binname"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	local out_dir
	out_dir=$(find target/release/build/ -maxdepth 2 -type d -name "out" -exec test -d "{}/locale" \; -print -quit)

	if [ -d "$out_dir/locale" ]; then
		for mo in "$out_dir"/locale/*/LC_MESSAGES/*.mo; do
			if [ -f "$mo" ]; then
				local lang
				lang=$(echo "$mo" | awk -F'/locale/' '{print $2}' | cut -d'/' -f1)
				install -Dm644 "$mo" "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/${binname}.mo"
			fi
		done
	fi
}
