# Maintainer: Moritz Poldrack <moritz@poldrack.dev>

pkgname=(uniview-git)
_pkgname=uniview
pkgver=0.1.0.r11.gf4ba24a
pkgrel=1
pkgdesc='Email Client for your Terminal (compiled without notmuch support)'
arch=('x86_64')
url='https://git.sr.ht/~mpldr/uniview'
license=('AGPL')
depends=()
makedepends=('go' 'git' 'protobuf')
optdepends=('mpv: video playback')
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
	make VERSION="${pkgver}"
}

package () {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 ./uniview -t "$pkgdir/usr/bin/"
	install -Dm755 ./univiewd -t "$pkgdir/usr/bin/"
	install -Dm644 ./LICENSES/AGPL-3.0-or-later.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
