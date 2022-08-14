# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=l2md-git
pkgver=r23.9db252b
pkgrel=1
pkgdesc="Import public-inbox archives via Git"
arch=('any')
url="https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git"
license=('GPL2')
groups=()
depends=('git' 'libgit2')
makedepends=('git' 'libgit2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	sed -e 's/WorkingDirectory=.*$/WorkingDirectory=%h/' -i l2md.service
	sed -e 's/User=.*$/User=%u/' -i l2md.service
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	make PREFIX="${pkgdir}/usr/bin" install

	install -Dt "${pkgdir}/usr/lib/systemd/user" l2md.service
	install -Dt "${pkgdir}/usr/share/doc/l2md" procmailrc
	install -Dt "${pkgdir}/usr/share/doc/l2md" l2mdconfig.maildir
	install -Dt "${pkgdir}/usr/share/doc/l2md" l2mdconfig.procmail
	install -Dt "${pkgdir}/usr/share/doc/l2md" TODO
	install -Dt "${pkgdir}/usr/share/doc/l2md" README
}
