# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=12.1
pkgrel=9
pkgdesc="MIT/GNU Scheme"
url="https://www.gnu.org/software/mit-scheme/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  glibc
  libx11
  ncurses
)
makedepends=(
  ghostscript
  texlive-bin
  texlive-latex
  texlive-plaingeneric
)
checkdepends=(bash)
optdepends=('openssl: support for openssl')

source=(
  "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz"
  "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz.sig"
  "disable-long-running-tests.patch"
)
sha256sums=(
  '8cfbb21b0e753ab8874084522e4acfec7cadf83e516098e4ab788368b748ae0c'
  'SKIP'
  '8351ada9f5f71472b8992d6b1ad2c8120b26e4a9b5503ba266c80931152e9a66'
)
noextract=("$pkgname-$pkgver-x86-64.tar.gz")
validpgpkeys=('8F664EF430167B808170D35AC9E40BAAFD0CB132') # Chris Hanson <cph@chris-hanson.org>

_archive="$pkgname-$pkgver"

prepare() {
  tar -xf "$_archive-x86-64.tar.gz"

  mkdir -p "$_archive-test"
  tar -C "$_archive-test" --strip-components 1 -xf "$_archive-x86-64.tar.gz"

  patch --forward --strip=1 --input="$srcdir/disable-long-running-tests.patch" \
    --directory="$_archive-test/"
}

build() {
  cd "$srcdir/$_archive/src"
  ./configure \
    --prefix=/usr \
    --with-x \
    --enable-x11 \
    --enable-native-code
  make -j1

  cd "$srcdir/$_archive/doc"
  ./configure \
    --prefix=/usr \
    --enable-pdf \
    --disable-html
  make
}

check() {
  cd "$srcdir/$_archive-test"

  # Run tests with a temporary installation
  _tmp_install_prefix=$PWD/tmp_install/usr
  mkdir -p "$_tmp_install_prefix"

  cd "$srcdir/$_archive-test/src"
  ./configure \
    --prefix="$_tmp_install_prefix" \
    --with-x \
    --enable-x11 \
    --enable-native-code
  make -j1
  make DESTDIR=/ install

  cd "$srcdir/$_archive-test"

  # Tests confirmed to fail when using fish as shell, use bash explicitly
  SHELL=/bin/bash "$_tmp_install_prefix/bin/mit-scheme" --eval '(load "tests/check.scm")'
}

package() {
  cd "$srcdir/$_archive"
  install -Dm644 "etc/xscheme.el" "$pkgdir/usr/share/emacs/site-lisp/xscheme.el"

  cd "$srcdir/$_archive/src"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_archive/doc"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_archive"
  # Remove to avoid namcap warning about empty directory
  rm -r "$pkgdir/usr/lib/mit-scheme-x86-64-12.1/lib/"
}
