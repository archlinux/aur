# Maintainer: Moritz Poldrack <moritz@poldrack.dev>

pkgname=(uniview-git)
_pkgname=uniview
pkgver=0.1.0.r16.g4b59af6
pkgrel=1
pkgdesc='Watchparties by syncronising video playback across multiple players'
arch=('x86_64')
url='https://git.sr.ht/~mpldr/uniview'
license=('AGPL')
depends=()
makedepends=('go' 'git' 'protobuf')
optdepends=(
	'mpv: video playback'
	'hicolor-icon-theme: for high-resolution icon'
)
provides=('uniview')
conflicts=('uniview')
source=("${_pkgname}::git+https://git.sr.ht/~mpldr/${_pkgname}")
sha512sums=('SKIP')
options=('!buildflags')

pkgver () {
	cd "${srcdir}/${_pkgname}"

	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${srcdir}/${_pkgname}"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	make VERSION="${pkgver}" EXTRA_GO_LDFLAGS="-s -w"
}

package () {
	cd "${srcdir}/${_pkgname}"
	make install "DESTDIR=$pkgdir"
	install -Dm644 ./LICENSES/AGPL-3.0-or-later.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
