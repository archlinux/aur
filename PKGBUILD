# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=arena
pkgver=1.06
pkgrel=2
pkgdesc="The Elder Scrolls I: Arena"
arch=('any')
url="http://www.elderscrolls.com/arena/"
license=('custom:arena')
depends=('dosbox')
makedepends=('unrar')
options=(emptydirs)
install='arena.install'
source=(http://cms.elderscrolls.com/sites/default/files/tes/extras/Arena106Setup.zip
        license arena-launcher.pl ARENA.BAT SOUND.CFG
        arena.conf)
md5sums=('b55b3ddcce98c1905a723781dbe1df7c'
         '2b726b740a5ef663556dea5fe3f25931'
         'b1cc68ee04ad1ff652f1a764a8461b62'
         'f125209433385b76e6cdf10977bd1d6a'
         '7b7c3c2b9961c8d9e649b12c41266662'
         '36e4de3a8b1030bbf12c6badd23da2ec')

package() {
  cd "$srcdir"
  _target="${pkgdir}"/usr/share/games/arena
  install -d -m 775 "$_target"

  cd "$_target"
  unrar x "$srcdir/Arena106.exe"
  chmod 775 "$_target/ARENA"

  install "$srcdir/SOUND.CFG" "$_target/ARENA"
  install "$srcdir/ARENA.BAT" "$_target/ARENA"
  mv "$_target/ARENA/Docs/Passwords.txt" "$_target/passwords.txt"
  rm -rf "$_target/ARENA/Docs"
  cd ARENA
  ls | while read file
  do
    _A=$file
    _B=`echo $file | sed 's/.*/\U&/'`
    if [ $_A != $_B ]
    then
      mv $_A $_B
    fi
  done
  cd ..

  install "$srcdir/arena.conf" "$_target"
  install -D -m644 "$srcdir/license" "$pkgdir/usr/share/licenses/arena/license"
  install -D -m754 "$srcdir/arena-launcher.pl" "$pkgdir/usr/bin/arena"
}

