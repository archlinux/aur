# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=pam-python-git
pkgver=r31.9641aa5
pkgrel=1
pkgdesc='Python for PAM (py3 fork)'
arch=('x86_64')
url='https://github.com/castlabs/pam-python'
license=('GNU Affero General Public License')
depends=(
	'pam'
	'python'
)
makedepends=(
	'python-sphinx'
	'make'
        'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pam-python::git+https://github.com/castlabs/pam-python.git')
sha256sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
        sed -i'' 's|LIBDIR ?= /lib/security|LIBDIR ?= /usr/lib/security|g' src/Makefile
        sed -n '/^License/,/^--$/p' README.txt | grep -v -e '^License' -e '^-\+' > LICENSE
}

build() {
	cd "$srcdir/${pkgname%-git}"
        PREFIX=/usr make
}

package() {
	cd "$srcdir/${pkgname%-git}"
        PREFIX=/usr make DESTDIR="${pkgdir}" install
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

