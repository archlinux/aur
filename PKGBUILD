# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=castlequest-git
_pkgname=castlequest
pkgver=ca1aac9
pkgrel=1
provides=("$_pkgname=$pkgver")
pkgdesc="Text-based adventure game set in a remote castle somewhere in Eastern Europe."
depends=('asa')
makedepends=('git' 'gcc-fortran')
arch=('any')
url="https://github.com/Quuxplusone/Castlequest"
license=('custom')
source=("$_pkgname.sh"
        "$_pkgname::git+$url.git#branch=patches")
backup=('usr/share/games/castlequest/CQUEST.SAV')
sha256sums=('886ba8d515c89fde5514127dad3b5726177c0f4cb866b59575ffce8cdd1aa115'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git rev-parse --short HEAD
}

build() {
  cd $_pkgname/src
  gfortran -std=legacy *.f -o cquest
}

package() {
  
  # Copy wrapper
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

  cd $_pkgname

  # Create install directory
  install -m0755 -d -o root -g games "$pkgdir/usr/share/games/$_pkgname"
  
  # Copy files from project root
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
  install -m0644 castlequest.pdf "$pkgdir/usr/share/games/$_pkgname"

  cd src  

  # generate blank save file
  echo -e "NO\nSAVE" | ./cquest > /dev/null


  # Install files
  install -Dm644 -o root -g games *.dat "$pkgdir/usr/share/games/$_pkgname"
  install -Dm2755 -o root -g games cquest "$pkgdir/usr/share/games/$_pkgname"
  install -Dm664 -o root -g games CQUEST.SAV "$pkgdir/usr/share/games/$_pkgname"


}
