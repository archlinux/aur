# AUR Maintainer: shadichy <shadichy@blisslabs.org>
_pkg=ibus-lotus
pkgname=${_pkg}-bin

# Auto versioning
get_redirected() {
	if command -v curl >/dev/null; then
		curl -Ls -w '%{url_effective}' -o /dev/null "$1"
	elif command -v wget >/dev/null; then
		wget -O /dev/null "$1" 2>&1 | grep "Location: " | head -1 | cut -f2
	else
		echo "Could not find curl or wget"
		return 1
	fi
}

url=https://github.com/LotusInputEngine/$_pkg

_upstream_version=$(get_redirected "$url/releases/latest")
_upstream_version=${_upstream_version##*/}

_upver=${_upstream_version#v}
pkgver=${_upver%-*}
pkgrel=${_upver#*-}
if [ ! "$pkgrel" ] || [ "$pkgrel" = "$_upver" ]; then
	pkgrel=1
fi
pkgdesc="A Vietnamese IME for IBus - fork of ibus-bamboo"
arch=(any)
license=('GPL3')
depends=('ibus')
optdepends=('kdotool: for switching modes on KDE Plasma')
makedepends=('bash')
conflicts=('ibus-bamboo-git' 'ibus-bamboo' 'ibus-lotus-git' 'ibus-lotus')
provides=('ibus-lotus')
source=("${_pkg}-${_upver}.zip::$url/releases/latest/download/${_pkg}-${_upver}.zip")
sha256sums=('SKIP')

package() {
	cd "${_pkg}-${_upver}"
	env DESTDIR="$pkgdir" bash ./install
}
