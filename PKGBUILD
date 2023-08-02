# Maintainer: André Kugland <kugland@gmail.com>
# Contributor: Giorgi Kobakhidze <gk@koba.pvt.ge>
# Contributor: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-patched
pkgver=9.31
pkgrel=3
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo' 'libptytty')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch'
        )
sha256sums=('aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
            '13b3ce60ef607b5c94c9e0e2aa5236781e7a4c1c69da2c0ea9ef30c52728ac69'
            '9c1964776a1f7fe0ccfff937355e7dedca812c328e38970598bf2f62633ee121'
            '1841d774887c4402f9fd431abc54776a914ac7f9d19cb1903035fb2afd6a79c4'
            'ee7ad6f56c22fa7379c1ac2594ff941bf7f99344152da0b813319d3dadd1395b'
            '8d5f2ee9dae827b7a99757fd5432416927a31cde2093e3ad1aefee0987d6ab8d')
sha512sums=('4d14ecbbb62de1b1c717277f5aae5cfb536e11392f2d4b82c884c1713f437fce8e9dd69a328fa353a55d068d8ee4121a31900f45191acec172d5dc76652b6255'
            'cc363f2905cb58af0e7ab1c8532ccb1052b9689e257c7bd205a82fa3bc0adc2f6b9d90f2379ef5deaff5556806c9806090f7b2fc4d8ce1650504de6b211868c0'
            'ad936e502085b39993b48278c5b09b87ecf723a347bf15be82d9087d81d7e027b27c9c9e15481bb836c2da108a8e8e7ff2c78196e84141bdcf6230a0b54e29a4'
            'c4e77c7fda94494ccfecad683ec725054dafa4587d2876d5d0817abd87872fda2b18f4a90359c28bb9327b9d69ef76513c2c144533967e0c68c3eb4a4e457dab'
            '0336281f46e1fe0d8ce4abe7a9cd2de0d406c62afc9e63846526c72f88565e9bed9a97339104bb2d51af21fa11631dfdd6319f4c67b50514637c618f5dd85292'
            'a38be68512070af71245ac599611ef7eb91bdd4b6a405c651e2ad2260784dff5e20d57025e51b440814b1b9269322ef1cda45a482e6efe5c8e2ca8fdd6e883fa')

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
}

build() {
  cd $_pkgname-$pkgver

  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll

  # workaround terminfo installation
  sed -Eie '/(^[[:blank:]]+\/usr\/bin\/tic)/s//#&/g' doc/Makefile

  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done

  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
