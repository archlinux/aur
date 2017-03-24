# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=tvdoon-git
pkgver=r3.69640c1
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="http://www.stack.blog.ir"
license=('GPL3')
depends=('python' 'python2-prettytable' 'python-prettytable' 'python-pyfiglet' 'python-pillow')
makedepends=('git'  'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/LinArcX/tvdoon")
md5sums=('SKIP')

prepare(){
	cd "${srcdir}/${pkgname}"

	# install requests-cache(V2 and V3)
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/python-requests-cache.tar.gz
	tar xvzf python-requests-cache.tar.gz
	cd python-requests-cache
	makepkg -f
	echo "installing python-requests-cache from Aur."
	rc_pkgver=$(grep -Po 'pkgver=\K[^ ]+' PKGBUILD)
	rc_pkgrel=$(grep -Po 'pkgrel=\K[^ ]+' PKGBUILD)
	rc_arch=$(grep -Po 'arch=\K[^ ]+' PKGBUILD | cut -d "(" -f2 | cut -d "'" -f2)
	sudo pacman -U tvdb_api-git-${rc_pkgver}-${rc_pkgrel}-${rc_arch}.pkg.tar.xz

	# install tvdb_api (V2)
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/tvdb_api-git.tar.gz
	tar xvzf tvdb_api-git.tar.gz
	cd tvdb_api-git
	makepkg -f
	echo "installing tvdb_api-git(V2) from Aur."
	tvdb_pkgver_2=$(grep -Po 'pkgver=\K[^ ]+' PKGBUILD)
	tvdb_pkgrel_2=$(grep -Po 'pkgrel=\K[^ ]+' PKGBUILD)
	tvdb_arch_2=$(grep -Po 'arch=\K[^ ]+' PKGBUILD | cut -d "(" -f2 | cut -d "'" -f2)
	sudo pacman -U tvdb_api-git-${tvdb_pkgver_2}-${tvdb_pkgrel_2}-${tvdb_arch_2}.pkg.tar.xz

	# install tvdb_api (V3)
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/tvdb3_api-git.tar.gz
	tar xvzf tvdb3_api-git.tar.gz
	cd tvdb3_api-git
	makepkg -f
	echo "installing tvdb_api-git(V3) from Aur."
	tvdb_pkgver_3=$(grep -Po 'pkgver=\K[^ ]+' PKGBUILD)
	tvdb_pkgrel_3=$(grep -Po 'pkgrel=\K[^ ]+' PKGBUILD)
	tvdb_arch_3=$(grep -Po 'arch=\K[^ ]+' PKGBUILD | cut -d "(" -f2 | cut -d "'" -f2)
	sudo pacman -U tvdb3_api-git-${tvdb_pkgver_3}-${tvdb_pkgrel_3}-${tvdb_arch_3}.pkg.tar.xz
}

pkgver() {
	cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
}

package() { 
	cd "${srcdir}/${pkgname}"
	python setup.py install --prefix=/usr --root="$pkgdir"
}
