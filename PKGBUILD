# Maintainer: poly000 <1348292515@qq.com>

pkgname=waylyrics-git
_pkgname=waylyrics
_appname="io.poly000.${_pkgname}"
pkgver=0.1.0_r261.g7e4002c
pkgrel=1
pkgdesc="On screen lyrics for wayland with netease cloud music source"
url="https://github.com/waylyrics/waylyrics"
conflicts=('waylyrics')
provides=('waylyrics')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gtk4')
makedepends=('cargo' 'git' 'jq')

source=("git+${url}.git"
	"${_appname}.desktop"
)

sha256sums=('SKIP'
	'bd954c5c3e274c5d297168287483dbb06943efddab982be4b2ead359e0c39ba1')

pkgver() {
	cd "${_pkgname}"
	semver=$(cargo metadata --no-deps --format-version=1 | jq -r '.packages | .[0] | .version')
	echo "${semver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"

	# workarounds to allow enabling feature gates with stable rustc
	# this should be ok since localkey is not in active development
	export RUSTC_BOOTSTRAP=1

	# template files
	export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/${_pkgname}/themes"

	if [[ $CARCH != x86_64 ]]; then
		export CARGO_PROFILE_RELEASE_LTO=off
	fi

	cargo build --locked --release --target-dir target
}

package() {
	install -vDm644 "${_appname}.desktop" -t "${pkgdir}/usr/share/applications/"

	cd "$srcdir/$_pkgname"
	install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm644 "${_appname}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

	install -vdm755 "${pkgdir}/usr/share/${_pkgname}/themes"
	cp -arv themes/* "${pkgdir}/usr/share/${_pkgname}/themes/"
	cp -arv res/* "${pkgdir}/usr/share/"

	# License
	install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
