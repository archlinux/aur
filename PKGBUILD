# Maintainer: Furkan Kardame <tech@fkardame.com>
pkgname=cammus-ff-dkms
_pkgname="${pkgname%-*}"
pkgver=r28.2a2be93
pkgrel=2
pkgdesc='Enable Force Feedback for Cammus C5 Direct Drive Wheel'
arch=(any)
url="https://github.com/spikerguy/${_pkgname}"
license=(GPL2)
depends=(dkms)
install=${pkgname}.install
makedepends=(git joyutils)
source=("$_pkgname::git+${url}.git#branch=master"
		'cammus.rules'
		'cp5-pedal.sh')
b2sums=('SKIP'
        '2f2982dea2cd2ec565ed59175188660da96a0bda68808270b0d78b85ac6860d6d11f11dabaa6cd653f0753a1ff502065cc504ecf4c5c1417008cbe6b6be3c02d'
        'ec4dfd2fd6872ff16bd73fcf01e78d3e54413f3da6fcf5c0e0c686cec6e0eee0f302ee63d25bbd2e67622e3d85605ad48e6fae212037297b5b8483fd693859aa')

prepare() {
	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/)}"
		[[ $src = *.patch ]] || continue
		echo -e "Applying patch: \\033[1;36m$src\\033[0m"
		patch -Np1 < "$srcdir/$src"
	done
}

pkgver() {
	cd "$srcdir"/"$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 0644 -T cammus.rules "${pkgdir}/usr/lib/udev/rules.d/99-cammus.rules"
	install -Dm 0755  cp5-pedal.sh -t "${pkgdir}/usr/bin/"
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir/usr/src/$_pkgname-$pkgver"
	cp -r . "$pkgdir/usr/src/$_pkgname-$pkgver"

}
