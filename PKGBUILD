# Maintainer: Filippo Squillace <feel dot sqoox at gmail dot com>
# More details on how to change this file:
# https://wiki.archlinux.org/index.php/PKGBUILD
# https://wiki.archlinux.org/index.php/Creating_packages
# https://wiki.archlinux.org/title/Python_package_guidelines

pkgname=pearl-git
pkgver=r140.e504230
pkgrel=1
pkgdesc="Package manager for dotfiles, plugins, programs and any form of code accessible via git. Allow to easily share and sync packages across systems and have them ready to work out of the box."
arch=('any')
url="https://github.com/pearl-core/pearl"
license=('GPL')
groups=()
depends=('git' 'python')
makedepends=(git python-build python-installer python-wheel python-poetry)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.
source=('pearl::git+https://github.com/pearl-core/pearl.git#branch=master' 'git+https://github.com/fsquillace/buava#branch=master')
noextract=()
md5sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.src/pearllib/static/buava.url "$srcdir/buava"
  git -c protocol.file.allow=always submodule update
}


pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
    # https://wiki.archlinux.org/title/Python_package_guidelines
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    # https://wiki.archlinux.org/title/Python_package_guidelines
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
