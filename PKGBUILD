# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=12.1
pkgrel=8
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
  cd "$_archive"

  (
    cd src
    ./configure \
      --prefix=/usr \
      --with-x \
      --enable-x11 \
      --enable-native-code
    make -j1
  )

  (
    cd doc
    ./configure \
      --prefix=/usr \
      --enable-pdf \
      --disable-html
    make
  )
}

check() {
  cd "$_archive-test"

  # Run tests with a temporary installation
  local tmp_install_prefix=$PWD/tmp_install/usr
  mkdir -p "$tmp_install_prefix"

  (
    cd src
    ./configure \
      --prefix="$tmp_install_prefix" \
      --with-x \
      --enable-x11 \
      --enable-native-code
    make -j1
    make DESTDIR=/ install
  )

  # Tests confirmed to fail when using fish as shell, use bash explicitly
  SHELL=/bin/bash "$tmp_install_prefix/bin/mit-scheme" --eval '(load "tests/check.scm")'
}

package() {
  cd "$_archive"

  install -Dm644 "etc/xscheme.el" "$pkgdir/usr/share/emacs/site-lisp/xscheme.el"

  (
    cd src
    make DESTDIR="$pkgdir" install
  )
  (
    cd doc
    make DESTDIR="$pkgdir" install
  )

  # Remove to avoid namcap warning about empty directory
  rm -r "$pkgdir/usr/lib/mit-scheme-x86-64-12.1/lib/"
}
