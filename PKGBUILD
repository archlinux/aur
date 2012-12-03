# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

pkgname=dosemu-git
pkgver=20121125
pkgrel=1
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
source=(https://dl.dropbox.com/u/13513277/dosemu/dosemu-freedos-1.1-bin.tgz
        debianize.patch
        xdosemu.desktop)
sha256sums=('8f25916dc7f58e71398820b9bc83987cb39e3cd23a7d2d15a7294b2d42cfbed0'
            '9d07462543a6ce35eca7e647c17e1de7193de0a9067b83159aa1f6a18391a6ea'
            'ae737e26165c016242d5a8603a5c887c313570e1525091b30f9e8d23d1a9faab')
noextract=('dosemu-freedos-1.1-bin.tgz')

_gitroot=git://git.code.sf.net/p/dosemu/code
_gitname=dosemu

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"
  patch -p1 < ../debianize.patch
  sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
  ./configure --prefix=/usr --with-fdtarball="$srcdir/dosemu-freedos-1.1-bin.tgz" --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir"/xdosemu.desktop "$pkgdir"/usr/share/applications/xdosemu.desktop
  install -Dm 644 etc/dosemu.xpm "$pkgdir"/usr/share/icons/dosemu.xpm
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm 644 COPYING.DOSEMU "$pkgdir"/usr/share/licenses/$pkgname/COPYING.DOSEMU
}
