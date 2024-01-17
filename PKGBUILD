# Maintainer: skwerlman <skw@tetrarch.co>

pkgname=aw-watcher-steam-git
_name=${pkgname%-git}
pkgver=r5.13c4b65
pkgrel=1
pkgdesc="ActivityWatch watcher to watch your currently playing Steam game"
arch=('any')
url="https://github.com/Edwardsoen/aw-watcher-steam"
depends=('python' 'python-requests' 'activitywatch-bin')
makedepends=('python-poetry' 'git')
conflicts=('aw-watcher-steam')
provides=('aw-watcher-steam')
source=("$_name::git+https://github.com/Edwardsoen/aw-watcher-steam.git")
md5sums=('SKIP')
license=('MIT')

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "$_name"
    poetry build
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
