# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgname=gvm
pkgname="${_pkgname}-git"
pkgver=1.0.22.r112.g1f6c108
pkgrel=1
pkgdesc="Go Version Manager"
url="https://github.com/moovweb/gvm"
arch=('any')
license=('MIT')
depends=('bash' 'bison' 'curl')
makedepends=('automake')
source=(
	"git+${url}#branch=master"
	"Makefile.am.patch"
)
sha256sums=('SKIP'
	'c148da45463b0153aeed502ce659849d3bec3685575504a4c62cfcf5a2064bcc')

# https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	# git diff Makefile.am > Makefile.am.patch
	patch --input="${srcdir}/Makefile.am.patch"
}

build() {
	cd "$_pkgname"
	./autogen.sh --prefix=/opt --exec-prefix=/usr
}

package() {
	cd "$_pkgname"
	DESTDIR="${pkgdir}" make install
}
