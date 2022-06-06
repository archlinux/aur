# Maintainer: Emil Gedda <emil.gedda@emilgedda.se>
# Contributor: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-patched-with-scrolling
pkgver=9.26
pkgrel=3
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing and scrolling in pages'
arch=('i686' 'x86_64' 'armv7h')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'libxt' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch'
        'clear.patch'
        'secondaryWheel.patch'
        'enable-wide-glyphs.patch'
        '24-bit-color.patch')
sha1sums=('d325d8cdea6bcb8e0b8b219b8451bf5c690b6c62'
          'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          '01ee8f212add79a158dcd4ed78d0ea1324bdc59b'
          'b7fde1c46af45e831828738874f14b092b1e795f'
          'fc77f75bd2d51baa4abef81983dab044d7f498ce'
          'e50503f786deb6d6c2b6b8bcf486bf509c14af71'
          'd9f3b52b273d13fbd4089a7869ab2e70bf190bc9'
          '9f5db305863b17175e72f9e2d4a78d0d7f25fd34')

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  #patch -p0 -i ../24-bit-color.patch
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
  patch -p1 -i ../enable-wide-glyphs.patch
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
    --enable-frills \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-24-bit-color \
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
