# Maintainer: hashworks <mail@hashworks.net>
pkgname=pam-ihosts-git
_pkgname="${pkgname%-git}"
pkgver=1.5.7.r0.g24f61b1
pkgrel=2
pkgdesc="A PAM module that provides access control by ip, mac-address, or country-code/region"
arch=("x86_64")
url="https://github.com/ColumPaget/pam_ihosts"
license=("GPL3")
depends=("pam")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -e 's|$(CFLAGS)|$(CFLAGS) $(LDFLAGS) $(CPPFLAGS)|;s| -fno-stack-protector ||' -i "${srcdir}/${_pkgname}/Makefile.in"
	sed '/$(INSTALL) -d $(DESTDIR)$(bindir)/d' -i "${srcdir}/${_pkgname}/Makefile.in"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	make DESTDIR="${pkgdir}/" install
}
