# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgbase='rxvt-unicode'
pkgname='rxvt-unicode-fontspacing-noinc-vteclear-secondarywheel'
pkgver=9.21
pkgrel=2
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing, no increment resizing, clear patched to behave like VTEs (keep all lines) and secondaryWheel.'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
source=("http://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2"
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch'
        'noinc.diff'
        'popup-menu-hang.diff'
        'clear.patch'
        'secondaryWheel.patch'
)
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')

prepare() {
  cd $_pkgbase-$pkgver
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../popup-menu-hang.diff
  patch -p1 -i ../noinc.diff
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
}

build() {
  cd $_pkgbase-$pkgver
  # we disable smart-resize (FS#34807)
  ./configure \
    --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
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
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf \
    --disable-frills

  cd doc
  make *.man.in
  cd ..

  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done
  cd $_pkgbase-$pkgver
  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}

md5sums=('a9a06c608258c5fd247c3725d8f44582'
         'fec94dc986fa37ec380079d81de3e0b2'
         'fac55f0a8404c86dad3e702146762332'
         '8a5599197568c63720e282b9722a7990'
         'f6bb5770d2e7b06d88882513710a267d'
         'd4e03127a0d3bbf2e173850770651b08'
         '1c85de8253b3a9002fabaaaccbdb51de'
         'aead33ba3b08eeb251fb0c1427a4a024'
         '061b851e89e53a71d1afad6947c51ca7'
         '6e137593a69b4b584305f3d513e471bf')
