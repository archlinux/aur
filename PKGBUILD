pkgname=icarus-launcher-bin
_pkgname=Icarus
pkgver=0.2.5
pkgrel=1
pkgdesc='Privacy-focused Minecraft launcher forked from the Modrinth App'
arch=('x86_64')
url='https://github.com/fraa2a/Icarus-Launcher'
license=('AGPL-3.0-only')
depends=(
	'gtk3'
	'hicolor-icon-theme'
	'libsoup3'
	'openssl'
	'webkit2gtk-4.1'
)
makedepends=('binutils')
provides=('icarus-launcher')
conflicts=('icarus-launcher' 'icarus-launcher-git')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('43ce7368fa33e69591db726d3ef5f92fb415ecc191e7bd6de3ef0abafbe392ac')

package() {
	cd "$srcdir"

	ar x "${_pkgname}_${pkgver}_amd64.deb"

	local data_archive=''
	for candidate in data.tar.zst data.tar.xz data.tar.gz; do
		if [[ -f "$candidate" ]]; then
			data_archive="$candidate"
			break
		fi
	done

	if [[ -z "$data_archive" ]]; then
		printf 'Could not find a data archive inside %s\n' "${_pkgname}_${pkgver}_amd64.deb" >&2
		return 1
	fi

	bsdtar --no-same-owner -xf "$data_archive" -C "$pkgdir"
}
