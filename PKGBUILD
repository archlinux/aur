# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=uctags-git
pkgver=r10032.033929ad1
pkgrel=1
pkgdesc='Universal ctags (patched to allow installing alongside original ctags)'
arch=('x86_64')
url='https://ctags.io/'
license=('GPL')
depends=('libxml2' 'jansson' 'libyaml' 'bash')
makedepends=('git' 'python-docutils')
provides=('ctags')
conflicts=('ctags')
source=("${pkgname}::git+https://github.com/universal-ctags/ctags.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    ./autogen.sh
    ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 ctags "${pkgdir}/usr/bin/ctags"
    install -Dm755 readtags "${pkgdir}/usr/bin/readtags"
    install -Dm755 optscript "${pkgdir}/usr/bin/optscript"

    MANPREFIX="${pkgdir}/usr/share/man"
	install -dm755 "${pkgdir}"/usr/share/man/man{1,5,7}

	for i in man/*.1; do \
		gzip -c "${i}" > "${MANPREFIX}/man1/$(basename ${i}).gz";
	done

	for i in man/*.5; do \
		gzip -c "${i}" > "${MANPREFIX}/man5/$(basename ${i}).gz";
	done

	for i in man/*.7; do \
		gzip -c "${i}" > "${MANPREFIX}/man7/$(basename ${i}).gz";
	done
}
