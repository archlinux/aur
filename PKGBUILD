# Maintainer: Vladimir Maryasov <mx.wg@yandex.ru>
#
# Personal modification of Microsoft Edit (msedit) from the maryasov fork,
# branch `mk`. Tracks upstream + personal patches (e.g. Escape-to-exit).
#
# Build from source with:   makepkg -si
# Or, once published to AUR: yay -S msedit-mod-git

_pkgbase=msedit
pkgname="$_pkgbase-mod-git"
pkgver=2.0.0.r505.gfd2e67a
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit) — maryasov modified build"
arch=('x86_64' 'aarch64')
url="https://github.com/maryasov/edit"
license=('MIT')
depends=('icu')
makedepends=('git' 'rust')
provides=("$_pkgbase")
conflicts=("$_pkgbase" "$_pkgbase-git")
source=("$_pkgbase::git+https://github.com/maryasov/edit.git#branch=mk")
sha256sums=('SKIP')

# pkgver: <cargo version>.r<commit count since root>.g<short sha>
pkgver() {
	cd "$_pkgbase"
	local ver
	ver="$(sed -n 's/^version = "\(.*\)"$/\1/p' crates/edit/Cargo.toml | head -1)"
	printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgbase"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export CARGO_TARGET_DIR=target
	# Stable Rust build (no nightly-only -Zbuild-std). The project's
	# [profile.release] in Cargo.toml already applies LTO + strip + opt-level=s.
	cargo build --frozen --release
}

check() {
	cd "$_pkgbase"
	cargo test --frozen --release
}

package() {
	cd "$_pkgbase"

	# Binary (canonical alternative name `msedit`, per upstream README).
	install -Dm755 "target/release/edit" "$pkgdir/usr/bin/$_pkgbase"

	# Manpage (rewrite `edit` -> `msedit` in the title / synopsis / name lines).
	install -d "$pkgdir/usr/share/man/man1"
	sed -e 's/^\.TH EDIT 1/.TH MSEDIT 1/' \
	    -e 's/^edit \\- a simple text editor$/msedit \\- a simple text editor/' \
	    -e 's/^edit is a simple text editor/msedit is a simple text editor/' \
	    -e 's/\\fBedit\\fP/\\fBmsedit\\fP/g' \
	    assets/manpage/edit.1 > "$pkgdir/usr/share/man/man1/$_pkgbase.1"

	# .desktop entry + SVG icon (so it shows up in app launchers).
	install -d "$pkgdir/usr/share/applications"
	sed -e "s/^Exec=edit %F/Exec=$_pkgbase %F/" \
	    -e "s/^Icon=edit/Icon=$_pkgbase/" \
	    assets/com.microsoft.edit.desktop \
	    > "$pkgdir/usr/share/applications/$_pkgbase.desktop"
	install -Dm644 assets/edit.svg \
	    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgbase.svg"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
