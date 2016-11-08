# Arch Linux PKGBUILD, mainly for improved width handling of (wide) glyphs.
# WIP at https://github.com/blueyed/rxvt-unicode/pull/1.
# README: https://github.com/blueyed/rxvt-unicode/pull/1/files#diff-04c6e90faac2675aa89e2176d2eec7d8.

# You can remove "--enable-wcwidthpreload" to not add LD_PRELOAD for the
# child process automatically, and then export it manually for more control.
# --enable-debug-wcwidth can be added to enable debug output on stderr.
# See the README linked above.

# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-wcwidthcallback
pkgver=9.22
pkgrel=1
pkgdesc='rxvt-unicode terminal emulator (urxvt) with wcwidth callback for better wide glyph handling of Xft fonts'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'line-spacing-fix.patch'
        'https://gist.githubusercontent.com/alexoj/df5bae7a4825cb596581/raw/75a1e75c2ae1ec5c0db68a29f8a6821e9e3d87a5/sgr-mouse-mode.patch'
        # https://github.com/exg/rxvt-unicode/compare/master...blueyed:wcwidth-hack.diff
        'wcwidthcallback.patch')
sha1sums=('e575b869782fbfed955f84f48b204ec888d91ba1'
          'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          'b7fde1c46af45e831828738874f14b092b1e795f'
          'dfbc8729c545105eff21e20ef3a4a3841a68a192'
          '1c138cb00670bbac7ef918d5f0050e17792bcbfb')

prepare() {
  cd $_pkgname-$pkgver

  # Patches from rxvt-unicode-patched.
  # Without font-width-fix.patch, which I consider to be wrong, too.
  # Would not handle "🀄 " from Symbola correctly
  # (g.xOff: 15, g.width: 17, g.x: 1).
  # patch -p0 -i ../font-width-fix.patch

  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../sgr-mouse-mode.patch

  # Remove new files to make the patch apply when rebuilding.  Is there a option for `patch`?!
  rm -f src/rxvtwcwidth.C src/rxvtwcwidth.h README.md
  patch -Np1 -i ../wcwidthcallback.patch
}

build() {
  cd $_pkgname-$pkgver

  # we disable smart-resize (FS#34807); will be fixed in 9.23.
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
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --enable-wcwidthpreload
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
