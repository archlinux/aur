# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Ricardo Madriz <richin13 at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=beye
pkgver=6.1.0
_lver=610
pkgrel=5
pkgdesc="A portable viewer of binary files, hexadecimal and disassembler modes"
arch=('x86_64')
license=('GPL')
depends=('slang' 'gpm')
makedepends=('libx11')
replaces=('biew')
url="http://beye.sourceforge.net/"
source=("http://downloads.sourceforge.net/project/beye/biew/$pkgver/biew-${_lver}-src.tar.bz2"
        'biew-610-fix_localedep-1.patch'
        'biew-610-portable_configure-1.patch'
        'biew-610-setup_window-1.patch')
md5sums=('1b6477defaa61b8ca0f2ae1254978e94'
         'f2d510cbeffadc4cc20e4bc4e7a08014'
         '32e8bc2673db6566720c1ec6f9512fd6'
         '93d7e300bd5fb85952891f220b12250a')

build() {
  cd "$srcdir"/biew-${_lver}

  patch -Np1 -i "${srcdir}/biew-610-fix_localedep-1.patch"
  patch -Np1 -i "${srcdir}/biew-610-portable_configure-1.patch"

  # Patch fixing a crash if MainWindow is not yet set
  patch -Np1 -i "${srcdir}/biew-610-setup_window-1.patch"

  sed -i -e "s:lib32:lib:g" configure
  export CFLAGS="$CFLAGS -mmmx -msse"
  ./configure --prefix=/usr

  # Fix man pages path
  sed -i -e 's^man/man1/biew.1^share/man/man1/biew.1^' makefile

  make LDFLAGS="${LDFLAGS}"
}

package() {
  cd "$srcdir"/biew-${_lver}

  make DESTDIR="$pkgdir" install
}
