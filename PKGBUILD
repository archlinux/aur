# Maintainer: Oliver Mangold <o.mangold at gmail dot com>
pkgname=bedup-git
pkgver=150302
pkgrel=1
pkgdesc="Offline deduplication utility for the BTRFS filesystem"
arch=('i686' 'x86_64')
url="https://github.com/g2p/bedup"
_commit="14d3a6d29f9742e2cf5953a215b4053d48ac45d4"
#_commit="HEAD"
source=('bedup-contextlib2.patch' 'bedup-update-current-rev.patch')
md5sums=('46d987c6d89c2f95484cacecc63eb669'
         '8c131a46db8dd755f8026552faf99c8c')
license=('GPL')
depends=('python' 'python-distribute' 'python-alembic' 'python-cffi' 'python-sqlalchemy' 'python-xdg' 'python-mako')
makedepends=('gcc' 'btrfs-progs')
conflicts=('bedup')
provides=('bedup')

prepare() {
  if [ ! -e "${srcdir}/bedup.git" ]; then
    git clone "$url" "${srcdir}/bedup.git"
    cd "${srcdir}/bedup.git"
    git reset --hard "$_commit"
  else
    cd "${srcdir}/bedup.git"
    git pull origin master
    git reset --hard "$_commit"
  fi
  git apply ../bedup-contextlib2.patch
  patch -p1 -i "${srcdir}/bedup-update-current-rev.patch"
}

build() {
  cd "${srcdir}/bedup.git"
  python setup.py build
}

package() {
  cd "${srcdir}/bedup.git"
  python setup.py install --root "${pkgdir}"
}
