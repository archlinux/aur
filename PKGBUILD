# Maintainer: Jeremey Hustman <jeremeyhustman at gmail daught com>
# Contributor:

_name="cflint"
_gitname="CFLint"
pkgname="$_name-git"
pkgver=20150708.185
pkgrel=1
pkgdesc="A static code analysis tool for ColdFusion - git branch"
arch=('any')
url="https://github.com/$_name/$_gitname/wiki"
license=("BSD")
depends=('java-environment' 'bash')
makedepends=('git' 'maven')
provides=("$_name" "$_name-ui")
conflicts=("$_name" "$_name-ui")
source=(git+https://github.com/$_gitname/${_gitname}.git)
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
	# Git, tags available
	# git describe --long | sed 's/.........$//;s/-/./g'
}

build() {
	# cd "$_gitname"
	cd "$srcdir/$_gitname"
	mvn clean install
}

package() {
	cd "${srcdir}/${_gitname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc"
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/share/licenses/$_name"
	echo "http://www.opensource.org/licenses/bsd-license.html" >> ${pkgdir}/usr/share/licenses/$_name/LICENSE
	install -Dm755 target/appassembler/bin/cflint "${pkgdir}/usr/bin/"
	install -Dm755 target/appassembler/bin/cflint-ui "${pkgdir}/usr/bin/"
	install -Dm644 target/appassembler/etc/* "${pkgdir}/etc/"
	install -Dm644 target/appassembler/lib/* "${pkgdir}/usr/lib/"
}
