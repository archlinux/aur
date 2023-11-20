# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=12.1
pkgrel=6
pkgdesc="MIT/GNU Scheme"
url="https://www.gnu.org/software/mit-scheme/"
arch=(x86_64)
license=(GPL)
depends=(
  glibc
  libx11
  ncurses
)
makedepends=(
  ghostscript
  texlive-latex
  texlive-bin
  texlive-plaingeneric
)
checkdepends=(
  bash
)
optdepends=('openssl: support for openssl')

source=(
  "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz"
  "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz.sig"
  "disable-long-running-tests.patch"
)
sha256sums=(
  '8cfbb21b0e753ab8874084522e4acfec7cadf83e516098e4ab788368b748ae0c'
  'SKIP'
  '3f55a9690d1d0614899ab641f7ae8807e5d5bdca1550d5f5621e3e8fa8898fc9'
)
validpgpkeys=('8F664EF430167B808170D35AC9E40BAAFD0CB132') # Chris Hanson <cph@chris-hanson.org>

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/disable-long-running-tests.patch"

  rm -rf src_real src_test
  cp -r src src_real
  cp -r src src_test
}

build() {
  cd "$_archive"

  # Running ./configure the original src/ directory pollutes it and will make
  # re-installs fail
  (
    cd src_real
    ./configure \
      --prefix=/usr \
      --with-x \
      --enable-x11 \
      --enable-native-code
    make -j1
  )

  (
    cd doc
    ./configure --prefix=/usr \
      --enable-pdf \
      --disable-html
    make
  )
}

check() {
  cd "$_archive"

  # Run tests with a temporary installation
  (
    cd src_test
    ./configure \
      --prefix="$PWD/../tmp_install/usr/" \
      --with-x \
      --enable-x11 \
      --enable-native-code
    make -j1
    make install
  )

  # Tests confirmed to fail when using fish as shell, use bash explicitly
  SHELL=/bin/bash tmp_install/usr/bin/mit-scheme --eval '(load "tests/check.scm")'
}

package() {
  cd "$_archive"

  install -Dm644 "etc/xscheme.el" "$pkgdir/usr/share/emacs/site-lisp/xscheme.el"

  (
    cd src_real
    make DESTDIR="$pkgdir" install
  )

  (
    cd doc
    make DESTDIR="$pkgdir" install
  )

  # Remove to avoid namcap warning about empty directory
  rm -r "$pkgdir/usr/lib/mit-scheme-x86-64-12.1/lib/"
}
