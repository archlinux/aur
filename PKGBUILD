# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Alex Kneipp <aur.usable613@passmail.net>
pkgname=fchart3-git
pkgver=0.12.0.r31.99fd498
pkgrel=2
pkgdesc="A Python project for creating high-quality astronomical finder charts and maps"
arch=(any)
url="https://github.com/skybber/fchart3"
license=('GPL-2.0-or-later')
groups=()
depends=(python python-numpy python-skyfield python-pillow python-skia python-cairo python-astroquery)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fchart3::git+https://github.com/skybber/fchart3.git')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/RELEASE-//g' |sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/${pkgname%-git}"
	#make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
