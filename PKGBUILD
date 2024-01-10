# Maintainer: poly000 <1348292515@qq.com>

pkgname=waylyrics-git
_pkgname=waylyrics
_appname="io.poly000.${_pkgname}"
pkgver=0.1.0_r350.ge187f00
pkgrel=2
pkgdesc="general desktop lyrics with QQMusic/NetEase Cloud Music source"
url="https://github.com/waylyrics/waylyrics"
conflicts=('waylyrics')
provides=('waylyrics')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gtk4')
makedepends=('cargo' 'git' 'jq' 'mimalloc')
optdepends=(
	'feeluown-qqmusic: QQMusic player'
	'feeluown-netease: NetEase Cloud Music player'
	'electron-netease-cloud-music: NetEase Cloud Music player'
	'yesplaymusic: NetEase Cloud Music player'
	'qcm: NetEase Cloud Music player'
)

source=("git+${url}.git")

sha256sums=('SKIP')

options=('!lto')

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

	cargo build --locked --release --target-dir target
}

package() {
	cd "$srcdir/$_pkgname"

	install -vDm644 "${_appname}.desktop" -t "${pkgdir}/usr/share/applications/"

	install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm644 "${_appname}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

	install -vdm755 "${pkgdir}/usr/share/${_pkgname}/themes"
	cp -arv themes/* "${pkgdir}/usr/share/${_pkgname}/themes/"
	cp -arv res/* "${pkgdir}/usr/share/"

	# License
	install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
