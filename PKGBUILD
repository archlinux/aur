# Maintainer: Kloenk <kloenk@kloenk.de>
pkgname=phrased-git
pkgver=v0.1.1.r13.4b68f7e
pkgrel=1
pkgdesc="Generate awesome passphrases from a set of dictionaries."
arch=('x86_64' 'i686')
url="https://phrased.org/"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('phrased::git+https://github.com/phrased-org/phrased.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
build() {
	cd "$srcdir/${pkgname%-git}"
	./go release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	./go test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	if [[ $arch == 'x86_64' ]]; then
		install -Dm0755 dist/linux_amd64/phrased $pkgdir/usr/bin/phrased
	elif [[ $arch == 'i686' ]]; then
		install -Dm0755 dist/linux_386/phrased $pkgdir/usr/bin/phrased
	fi
	
	install -Dm0644 README.md $pkgdir/usr/share/doc/${pkgname%-git}/README.md
}

