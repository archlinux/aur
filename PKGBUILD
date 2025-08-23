# Maintainer: Huynh Thien Khiem <my_github_name 2000 at gmail dot com>
_pkgname=euphonica
pkgname=${_pkgname}-git
pkgver=0.96.3.r354
pkgrel=1
pkgdesc="Libadwaita MPD client with visualiser, wikis and synced lyrics"
arch=("x86_64")
url="https://github.com/htkhiem/euphonica"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libpipewire' 'sqlite' 'dbus' 'xdg-desktop-portal-gtk' 'dconf' 'openssl')
makedepends=('git' 'meson' 'cargo' 'clang')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!lto)
source=(
	"git+https://github.com/htkhiem/euphonica.git"
)
sha256sums=('SKIP')

pkgver() {
	local semantic_version
	cd "$srcdir/${_pkgname%-git}"
	# Extract semantic version from Cargo.toml (seems easier than meson.build).
	# Take care to only do so under the [package] group and not the dependencies.
	semantic_version=$(awk -F '=' '
        /^\[package\]/ { in_package_section = 1 }
        in_package_section && /^version/ {
            gsub(/[" \t]/, "", $2) # Remove quotes from the version string
            print $2
            exit
        }
		' Cargo.toml)

	# Add commit count in case we have an update version bump
	printf "%s.r%s" "${semantic_version}" "$(git rev-list --count HEAD)"
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/${_pkgname%-git}"
	meson setup build --buildtype=release --prefix=/usr
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/${_pkgname%-git}/build"
	meson compile
}

check() {
	cd "$srcdir/${_pkgname%-git}/build"
	meson test --print-errorlogs
}

package() {
	cd "$srcdir/${_pkgname%-git}/build"
	meson install --no-rebuild --destdir "$pkgdir"
}
