# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
# Contributor anze <alberto.anzellotti@gmail.com>

pkgname=nsfminer-git
_pkgname=nsfminer
pkgver=r14556.a1b3e8623
pkgrel=1
pkgdesc="Ethereum miner with OpenCL and CUDA support derived from ethminer. RTX 30 series compatible."
arch=('x86_64')
url="https://github.com/no-fee-ethereum-mining/nsfminer"
license=('GPL3')
depends=('pth' 'cuda' 'mesa')
makedepends=('cmake' 'gcc' 'perl' 'python' 'git')
provides=('nsfminer')
conflicts=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Bazaar
        #printf "r%s" "$(bzr revno)"

# Git, tags available
        #printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
        #printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

# Subversion
        #printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build () {
  cd "$_pkgname"
  git submodule update --init --recursive

  mkdir -p build && cd build
  
  cmake ..
  cmake --build .
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
