# Contributor: Leonidas <marek@xivilization.net>
pkgname=homeshick-git
pkgver=20130401
pkgrel=1
pkgdesc="bash stand-in for homesick by technicalpickles"
arch=(any)
url="https://github.com/andsens/homeshick"
license=('BSD')
makedepends=('git')

_gitroot="git://github.com/andsens/homeshick.git"
_gitname="homeshick"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  # patch out the paths
  sed -i "s|source \$homeshick|source /usr/lib/homeshick|" "$srcdir"/$_gitname/home/.homeshick
}

package() {
  # copy the 'binary' *ahem* script
  install -D "$srcdir"/$_gitname/home/.homeshick "$pkgdir"/usr/bin/homeshick
  install -D "$srcdir"/$_gitname/utils/fs.sh "$pkgdir"/usr/lib/homeshick/utils/fs.sh
  install -D "$srcdir"/$_gitname/utils/git.sh "$pkgdir"/usr/lib/homeshick/utils/git.sh
  install -D "$srcdir"/$_gitname/utils/help.sh "$pkgdir"/usr/lib/homeshick/utils/help.sh
  install -D "$srcdir"/$_gitname/utils/log.sh "$pkgdir"/usr/lib/homeshick/utils/log.sh
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$_gitname/LICENSE*
}
