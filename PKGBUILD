# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=pikaur-aurnews
pkgver=1.14.7
pkgrel=1
pkgdesc="AUR helper which asks all questions before installing/building. Inspired by pacaur, yaourt and yay, and with the live aurnews eggzpatch"
arch=('any')
url="https://github.com/actionless/pikaur"
license=('GPL3')
conflicts=('pikaur')
source=(
	"$pkgname::git+https://github.com/actionless/pikaur.git#branch=master"
	'aurnews.patch'
)
md5sums=(
	"SKIP"
	'SKIP'
)
depends=(
	'pyalpm'
	'git'
	'fakeroot'
)
makedepends=(
	'python-markdown-it-py'
)
optdepends=(
	'asp: for ABS support in -G/--getpkgbuild operation'
	'python-pysocks: for socks5 proxy support'
)
conflicts=('pikaur')
provides=('pikaur')

pkgver() {
	#cd "${srcdir}/${pkgname}" || exit 2
	#set -o pipefail
	#git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 0.0.1
	echo $pkgver
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	msg2 "Implementing eggz his Magic aurnews patch!!!"
	git apply ../aurnews.patch || exit 2
	sed -i -e "s/VERSION.*=.*/VERSION = '${pkgver}'/g" pikaur/config.py
	msg2 "building pikaur with aurnews injection by eggz"
	make
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	for langmo in $(cd ./locale && ls ./*.mo); do
		lang=$(sed -e 's/.mo$//' <<< "${langmo}")
		install -Dm644 "locale/${langmo}" "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/pikaur.mo"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 pikaur.1 "$pkgdir/usr/share/man/man1/pikaur.1"
	cp -r ./packaging/* "${pkgdir}"
}
