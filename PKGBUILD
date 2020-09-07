# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=gimp-plugin-akkana-git
provides=(gimp-plugin-akkana)
conflicts=(gimp-plugin-akkana)
pkgver=r73.6ac8a1a
pkgrel=1
pkgdesc='A collection of GIMP scripts and plug-ins by Akkana Peck.'
arch=('any')
url='https://github.com/akkana/gimp-plugins'
license=('GPL2')
depends=(gimp)
optdepends=('glabels: crating labels and business cards')
source=("git+$url")
md5sums=('SKIP')
_gitname='gimp-plugins'

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
package(){
  cd "$srcdir"/$_gitname
  _scripts='/usr/share/gimp/2.0/scripts/'
  _plugins='/usr/share/gimp/2.0/plug-ins/'

  msg2 "Installing plugins"
  install -dm755 "$pkgdir"/{$_scripts,$_plugins}
  for i in *.py; do
    install -Dm755 $i "$pkgdir/$_plugins"
  done

  msg2 "Installing scripts"
  for i in *.scm; do
    install -Dm644 $i "$pkgdir/$_scripts"
  done

  install -Dm644 gimplabels/labels.scm "$pkgdir/$_scripts/labels.scm"
  sed -e 's#/glabels/#/libglabels-3.0/#g' -i "$pkgdir/$_scripts/labels.scm"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
