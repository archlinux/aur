# Maintainer: Yangtse Su <i@yangtse.me>

_pkgname=xpadneo
pkgname=xpadneo-dkms-git
pkgver=0.r209.g38f3f71
pkgrel=3
pkgdesc='Advanced Linux Driver for Xbox One S Wireless Gamepad'
arch=('x86_64')
url='https://github.com/atar-axis/xpadneo'
license=('GPL')
depends=('dkms')
makedepends=('git')
source=('git+https://github.com/atar-axis/xpadneo.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

package() {
	cd "${srcdir}/${_pkgname}"

	VERSION=$(cat VERSION)

	echo "* copying module into /usr/src"
	install -dm755 ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
	cp --recursive $PWD/hid-xpadneo/* ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
}
