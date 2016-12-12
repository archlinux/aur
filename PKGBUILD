pkgname=alterego
# could not find any version number, so using 1.0
pkgver=1.0
pkgrel=3
pkgdesc="You control a hero who has a phantom twin, his alter ego"
url="http://www.retrosouls.net/?page_id=614"
arch=('any')
license=('custom:free')
depends=('mono' 'sdl_mixer')
source=('http://www.retrosouls.net/files/AlterEgo_Linux.tar.gz'
        'alterego.desktop'
        'ae1-150x150.png')
sha256sums=('5766a21d292658c0ffc30d523c510e44e943df42f53df4d08702e035e8eeda8b'
            '979a8d6bfbca2209b18e7c5b33d9eb8ecf4f17850c9c36c3a19b7ab3963e6d1b'
            '960ed1417b8db64ceadf6331f2e3abbad7a83aa9770090b41bd1961411e1a225')

prepare() {
  cd AlterEgo_Linux/AlterEgo

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' AlterEgo.sh

  # patch launcher script
  sed -i '2i cd\ /usr/share/games/alterego' AlterEgo.sh
}

package() {
  cd AlterEgo_Linux/AlterEgo

  install -Dm755 AlterEgo.sh "$pkgdir"/usr/bin/alterego
  rm AlterEgo.sh

  install -d "$pkgdir"/usr/share/games/alterego
  cp -r * "$pkgdir"/usr/share/games/alterego/

  # game does not run without world writable bit set for the level files :-/
  find "$pkgdir"/usr/share/games/alterego/Content/level* -type f -exec chmod 666 {} \;

  install -Dm644 "$srcdir"/alterego.desktop "$pkgdir"/usr/share/applications/alterego.desktop
  install -Dm644 "$srcdir"/ae1-150x150.png "$pkgdir"/usr/share/pixmaps/alterego.png
}
