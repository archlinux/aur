# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=frogatto-git
pkgver=1.2.4474.g4185880
# The versioning scheme changed from date-based to git tag based on 2013-05-27
epoch=1
pkgrel=2
pkgdesc="An action-adventure game, starring a certain quixotic frog."
arch=(any)
url="http://www.frogatto.com/"
license=('custom')
depends=(anura-git)
makedepends=('git')
source=(git+https://github.com/frogatto/frogatto.git
        frogatto-git.sh
        frogatto-git.desktop)
md5sums=(SKIP
         c3faef878e21beccf0e4f7b26b4eb1f6
         935c3d8662a92b9bc775da36cf1ef059)

_gitname=frogatto

pkgver() {
  cd $_gitname
  if _tag=$(git describe 2>/dev/null)
  then
    # Use the tag of the last commit
    echo $_tag | sed 's|-|.|g'
  else
    # The project currently has no tags yet
    echo 0.0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  fi
}

package() {
  install -DT -m755 frogatto-git.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 frogatto-git.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  cd $_gitname
  # the LICENSE file is currently missing in the repository
  # install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  _installdir=$pkgdir/usr/share/anura-git/modules/frogatto
  install -DT -m644 module.cfg $_installdir/module.cfg
  install -DT -m644 master-config.cfg $_installdir/master-config.cfg
  rm -rf music/Unused sounds/unused images/os/mac
  cp -r data images locale music sounds $_installdir
}

# vim:set ts=2 sw=2 et:
