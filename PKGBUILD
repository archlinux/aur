# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>

_srcname=git-cola
pkgname=${_srcname}-git_p
pkgver=2.2.1.r48.g9b2d394
pkgrel=1
pkgdesc="A powerful GUI for Git"
url="http://git-cola.github.com/"
arch=('any')
license=('GPL')
depends=('git' 'python-pyqt4>=4.4' 'icu')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx>=1.1.3' )
optdepends=('python-pyinotify>=0.7.1: for inotify support'
            'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
provides=('git-cola')
conflicts=('git-cola' 'git-cola-git')
replaces=()
install=${pkgname}.install
source=("${_srcname}::git+https://github.com/davvid/git-cola.git")
sha512sums=('SKIP')

pkgver() {
  cur_prefix='v'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${_srcname}"
    make all doc html
}

package() {
    cd "${srcdir}/${_srcname}"
    make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
