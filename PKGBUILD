# AUR Maintainer: shadichy <shadichy@blisslabs.org>
pkgname=ibus-lotus

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

url=https://github.com/LotusInputEngine/$pkgname

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
makedepends=('go' 'gtk3' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'ibus-bamboo' 'ibus-lotus-git' 'ibus-lotus-bin')
provides=('ibus-lotus')
source=("${pkgname}-${_upver}.tar.gz::${url}/archive/${_upstream_version}.tar.gz")
sha256sums=('a15b7febdb5b3f0280ffc4efbfab4d3e55db135f0be860660735bc641a1710e4')

build() {
	cd "${pkgname}-${_upver}"
	make
}

package() {
	cd "${pkgname}-${_upver}"
	make DESTDIR="$pkgdir/" install
}
