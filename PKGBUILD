# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=jamovi-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=jamovi
pkgver=r481.e08f52f
pkgrel=1
pkgdesc="Open Source Software to bridge the gap between researcher and statistician"
arch=('any')
url=""
license=('git')
depends=('electron' 'python' 'python-protobuf' 'python-tornado' 'python-nanomsg' 'python-yaml' 'boost-libs')
makedepends=('boost' 'npm' 'cython') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/jamovi/jamovi.git 
	"rinclude.patch")
md5sums=('SKIP'
         '60a8bd543e49debf6d917afde56f60c3')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 <$srcdir/rinclude.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# Electron
	cd electron
	npm install
	# Server
	cd ../server
	python setup.py build_ext --inplace
	# Client
	cd ../client
	npm install
	# Engine
	cd ../engine
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/lib/$_pkgname/bin
	mkdir -p $pkgdir/usr/lib/$_pkgname/Resources
}
