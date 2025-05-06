# Maintainer: edwloef
# Maintainer: may

pkgname=mayland-git
_pkgname=mayland
pkgver=r431.f25660c
pkgrel=1
pkgdesc="a bad wayland compositor"
arch=('x86_64')
url="https://github.com/m4rch3n1ng/mayland"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
	'libdisplay-info'
	'libinput'
    'libxkbcommon'
    'mesa'
	'seatd'
    'systemd-libs'
)
optdepends=(
	'kitty: the default terminal emulator'
)
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/m4rch3n1ng/mayland.git")
sha256sums=(SKIP)

pkgver() {
	cd "${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked
}

build() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --frozen
	cargo build -p mayctl --release --frozen
}

package() {
	cd "${_pkgname}"

	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "target/release/mayctl" "${pkgdir}/usr/bin/mayctl"

	install -Dm644 "resources/mayland.desktop" "${pkgdir}/usr/share/wayland-sessions/mayland.desktop"
	install -Dm644 "resources/mayland.mf" "${pkgdir}/usr/share/mayland/mayland.mf"

	install -Dm644 <(COMPLETE=bash   exec -a "mayctl" "target/release/mayctl") "$pkgdir/usr/share/bash-completion/completions/mayctl"
	install -Dm644 <(COMPLETE=zsh    exec -a "mayctl" "target/release/mayctl") "$pkgdir/usr/share/zsh/site-functions/_mayctl"
	install -Dm644 <(COMPLETE=fish   exec -a "mayctl" "target/release/mayctl") "$pkgdir/usr/share/fish/vendor_completions.d/mayctl.fish"
	install -Dm644 <(COMPLETE=elvish exec -a "mayctl" "target/release/mayctl") "$pkgdir/usr/share/elvish/lib/mayctl.elv"

	install -Dm644 <(COMPLETE=bash   exec -a "$_pkgname" "target/release/$_pkgname") "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 <(COMPLETE=zsh    exec -a "$_pkgname" "target/release/$_pkgname") "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -Dm644 <(COMPLETE=fish   exec -a "$_pkgname" "target/release/$_pkgname") "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
	install -Dm644 <(COMPLETE=elvish exec -a "$_pkgname" "target/release/$_pkgname") "$pkgdir/usr/share/elvish/lib/$_pkgname.elv"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
