# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

pkgname=dosemu-git
pkgver=1.4.0.8.r753.18f6f5cd
pkgrel=2
epoch=2
pkgdesc="DOS emulator"
arch=('i686' 'x86_64')
url="http://www.dosemu.org/"
license=('GPL' 'custom')
depends=('gpm' 'slang' 'sdl' 'libsndfile' 'libxxf86vm')
makedepends=('git' 'xorg-mkfontdir' 'xorg-bdftopcf')
conflicts=('dosemu')
provides=('dosemu')
backup=('etc/dosemu/dosemu.conf'
        'etc/dosemu/dosemu.users'
        'etc/dosemu/global.conf')
source=('dosemu::git://git.code.sf.net/p/dosemu/code#branch=devel'
        https://chungy.keybase.pub/dosemu/dosemu-freedos-1.2-bin.tgz
        debianize.patch
        xdosemu.desktop)
sha512sums=('SKIP'
            'e65cf0fdb119f9923574d2a3f68cb272a1430554271e1968da3899ad43d1c763a818080f06951e7aaf84f057691a8b038eab6256e34f519c4a2a570de3697f83'
            '173525b8c622315dfe3860c9fda62e48c19603bad84f16cbc4db723a2a4c80adc85069fc6a8696229253adc03d29ea35c79fdaf1ca911c4d8d96e5de9c38ff39'
            'ff3ccaebb84eca622484f98750f360de5470f169271eed7500b713dcfb705c32618af239494741ea3396c5e1d9d97f374aa4e6346bf171f158d645d10ba24de7')
noextract=('dosemu-freedos-1.2-bin.tgz')

pkgver() {
  cd "dosemu"

  printf %s "$(git describe --long | sed 's/^dosemu-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "dosemu"

  patch -p1 -i ../debianize.patch
  sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
  sed -ie 's/((no_instrument_function/&,optimize("no-stack-protector")/' \
          src/arch/linux/async/sigsegv.c src/arch/linux/async/signal.c
}

build() {
  cd "dosemu"

  ./configure --prefix=/usr --with-fdtarball="$srcdir/dosemu-freedos-1.2-bin.tgz" --mandir=/usr/share/man
  make
}

package() {
  cd "dosemu"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir"/xdosemu.desktop "$pkgdir"/usr/share/applications/xdosemu.desktop
  install -Dm 644 etc/dosemu.xpm "$pkgdir"/usr/share/icons/dosemu.xpm
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm 644 COPYING.DOSEMU "$pkgdir"/usr/share/licenses/$pkgname/COPYING.DOSEMU
}
