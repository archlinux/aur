# Maintainer: Rokoucha(aka Atnanasi) <aur@rokoucha.net>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Daniel Hahler <archlinux+aur@thequod.de>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-improve-font-rendering
pkgver=9.30
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with improved font rendering'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxt' 'libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'https://gist.githubusercontent.com/emonkak/28bbc5474697695321452b6d9bf1d0bd/raw/a888c37ae10376598e663cf989132648f89219c0/rxvt-unicode-9.22-improve-font-endering.patch'
        )
sha256sums=(
        'fe1c93d12f385876457a989fc3ae05c0915d2692efc59289d0f70fabe5b44d2d'
        '13b3ce60ef607b5c94c9e0e2aa5236781e7a4c1c69da2c0ea9ef30c52728ac69'
        '9c1964776a1f7fe0ccfff937355e7dedca812c328e38970598bf2f62633ee121'
        '1841d774887c4402f9fd431abc54776a914ac7f9d19cb1903035fb2afd6a79c4'
        'b3708e6be20a87e99c3bdb498ceb7aef3c149d063d687118a5e008881dcd335b')
prepare() {
  cd $_pkgname-$pkgver

  patch -p1 -i ../rxvt-unicode-9.22-improve-font-endering.patch 
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
  make
}

package() {

  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done

  cd $_pkgname-$pkgver

  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install

  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
