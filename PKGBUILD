# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-git
_pkgname=matterhorn

pkgver=30701.0.0
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | cut -d- -f1
}

pkgrel=1
pkgdesc='A terminal-based chat client for MatterMost'
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
makedepends=('git' 'cabal-install')
source=("$_pkgname::git+https://github.com/matterhorn-chat/matterhorn.git"
        "mattermost-api::git+https://github.com/matterhorn-chat/mattermost-api.git")
provides=('matterhorn')
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cabal update
  cabal sandbox init
  cabal sandbox add-source "$srcdir/mattermost-api"
  cabal install --force-reinstalls
  cabal build $_pkgname
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  cp dist/build/matterhorn/matterhorn $pkgdir/usr/bin
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
}

