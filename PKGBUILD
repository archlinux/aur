# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=$_pkgname-sgr-mouse
pkgver=9.22
pkgrel=10
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with support for sgr mouse mode'
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'libnsl')
makedepends=('libxft' 'perl' 'startup-notification' 'libnsl')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2"
  'urxvt.desktop'
  'urxvtc.desktop'
  'urxvt-tabbed.desktop'
  'sgr-mouse-mode.patch' # https://gist.githubusercontent.com/alexoj/df5bae7a4825cb596581/raw/75a1e75c2ae1ec5c0db68a29f8a6821e9e3d87a5/sgr-mouse-mode.patch
)

sha512sums=(
  'b39f1b2cbe6dd3fbd2a0ad6a9d391a2b6f49d7c5e67bc65fe44a9c86937f8db379572c67564c6e21ff6e09b447cdfd4e540544e486179e94da0e0db679c04dd9'
  '7184714a908071a4e8e5c065c5f90255e94dfd072df459c8d6f66fca3647781b3d1f6908b9303bcfd0d5b3f2e3822a8d66efaaa8a7c4d44f6e682839031a6e99'
  'aa501eeeb220ba03b3f101b160230612efbca87694fef88c469b2976d29769c24b34576ea82f6c7941fad6039ac776f32e397add9b957b49bf2e84aeb67b66d6'
  '18c7afb0c3eb8c832893b9ead09d25374b70ae1cd5479a5291d11794906c53daa6f1a1bf698b37efda062bb2b991cacac53a0a6c185ca416b8718fde2bb6a7af'
  '9c92782b41edf69c7fc70f7d1cefbb9eed699ec78e5fc6db2f51a4f1aa3be583a7d75a09e6e954215a6d433e9530bda34013808dd2eaa1699fac1f21d0b8b9fd'
)

prepare() {
  cd $_pkgname-$pkgver/src
  patch -p1 < "$srcdir"/sgr-mouse-mode.patch
}

build() {
  cd $_pkgname-$pkgver

  # we disable smart-resize (FS#34807)
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
    --disable-pixbuf \
    --disable-frills

  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm 644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
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
