# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgbase=pygobject-tutorial-git
pkgname=('pygobject-tutorial-git' 'pygobject-tutorial-devhelp-git')
pkgver=r192.280e3e0
pkgrel=1
pkgdesc="The PyGObject Tutorial in html format."
arch=('any')
url="https://github.com/sebp/PyGObject-Tutorial"
license=('FDL1.3')
makedepends=('git' 'python-sphinx')
source=("${pkgbase}::git+https://github.com/sebp/PyGObject-Tutorial.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build(){
    cd "${srcdir}/${pkgbase}"
    make html
    make devhelp
}

package_pygobject-tutorial-git() {
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	replaces=("${pkgname%-git}")
	
	install -d ${pkgdir}/usr/share/doc/python-gobject-tutorial
	cd "${srcdir}/${pkgbase}"
	cp -a build/html ${pkgdir}/usr/share/doc/python-gobject-tutorial/
}

package_pygobject-tutorial-devhelp-git() {
	pkgdesc="The PyGObject Tutorial for GNOME devhelp."
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	replaces=("${pkgname%-git}")

	install -d ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial
	cd "${srcdir}/${pkgbase}"
	cp -a build/devhelp/* ${pkgdir}/usr/share/devhelp/books/PythonGTK3Tutorial/
}
