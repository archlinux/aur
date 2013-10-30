# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

pkgname=dosemu-git
pkgver=1.4.0.8.180.g35054ba
pkgrel=1
epoch=1
pkgdesc="DOS emulator"
arch=('i686' 'x86_64')
url="http://www.dosemu.org/"
license=('GPL' 'custom')
depends=('gpm' 'slang' 'sdl' 'libxxf86vm' 'libsndfile' 'sh' 'xorg-mkfontdir' 'xorg-bdftopcf')
makedepends=('subversion')
conflicts=('dosemu')
provides=('dosemu')
backup=('etc/dosemu/dosemu.conf'
	'etc/dosemu/dosemu.users'
	'etc/dosemu/global.conf')
source=('dosemu::git://git.code.sf.net/p/dosemu/code'
        https://dl.dropboxusercontent.com/u/13513277/dosemu/dosemu-freedos-1.1-bin.tgz
        debianize.patch
        xdosemu.desktop)
sha256sums=('SKIP'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613'
            '63471aa2c47a52319665c1f3a706d21665edd41df07797c3f558db348b477ba0'
            'ae737e26165c016242d5a8603a5c887c313570e1525091b30f9e8d23d1a9faab')
noextract=('dosemu-freedos-1.1-bin.tgz')

pkgver() {
  cd "$srcdir/dosemu"
  local ver="$(git describe --long)"
  local ver="${ver/dosemu-/}"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/dosemu"

  patch -p1 -i ../debianize.patch

  sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
  ./configure --prefix=/usr --with-fdtarball="$srcdir/dosemu-freedos-1.1-bin.tgz" --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/dosemu"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir"/xdosemu.desktop "$pkgdir"/usr/share/applications/xdosemu.desktop
  install -Dm 644 etc/dosemu.xpm "$pkgdir"/usr/share/icons/dosemu.xpm
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm 644 COPYING.DOSEMU "$pkgdir"/usr/share/licenses/$pkgname/COPYING.DOSEMU
}
