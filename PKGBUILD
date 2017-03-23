# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=tvdoon-git
pkgver=r3.69640c1
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="http://www.stack.blog.ir"
license=('GPL3')
depends=('python2-prettytable' 'python-prettytable')
makedepends=('git' 'python' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/LinArcX/tvdoon")
md5sums=('SKIP')

prepare(){
	cd "${srcdir}/${pkgname}"
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/tvdb_api-git.tar.gz
	#mv tvdb_api-git.tar.gz tvdb_api.tar.gz 
	tar xvzf tvdb_api-git.tar.gz
	cd tvdb_api-git
	makepkg -f
	echo "installing tvdb_api-git from Aur."
	tvdb_pkgver=$(grep -Po 'pkgver=\K[^ ]+' PKGBUILD)
	tvdb_pkgrel=$(grep -Po 'pkgrel=\K[^ ]+' PKGBUILD)
	tvdb_arch=$(grep -Po 'arch=\K[^ ]+' PKGBUILD | cut -d "(" -f2 | cut -d "'" -f2)
	sudo pacman -U tvdb_api-git-${tvdb_pkgver}-${tvdb_pkgrel}-${tvdb_arch}.pkg.tar.xz
}

pkgver() {
	cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
}

#build(){
#	cd "${srcdir}/${pkgname}"
#	python setup.py build
#}

package() {
	# install -d ${pkgdir}/usr/share/tvdoon
	# cp -a ./sirfiliams.py  ${pkgdir}/usr/share/sirfiliams
	# cp -a ./setup.py ${pkgdir}
	# python setup.py install --root="$pkgdir/" --optimize=1
    
	cd "${srcdir}/${pkgname}"
	python setup.py install --prefix=/usr --root="$pkgdir"
	# sudo python setup.py install --optimize=1 --prefix=/usr/share/tvdoon
	# sudo python setup.py install --root="$pkgdir/" --optimize=1
	# make DESTDIR="$pkgdir/" install
}
