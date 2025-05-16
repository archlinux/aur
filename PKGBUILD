# Maintainer: Pierce Thompson <pierce at insprill dot net>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=uim
pkgver=1.9.6
pkgrel=1
pkgdesc="Multilingual input method library"
url="https://github.com/uim/uim"
license=(BSD-3-Clause)
arch=(x86_64)
depends=(
  gcc-libs
  glibc
  libedit
  libxext
  libxft
  m17n-lib
  ncurses
  sqlite
)
makedepends=(
  anthy
  extra-cmake-modules
  gettext
  gtk2
  gtk3
  intltool
  plasma-framework5
  qt5-x11extras
  skk-jisyo
)
optdepends=(
  'anthy: input method'
  'gtk2: immodule and helper applications'
  'gtk3: immodule and helper applications'
  'qt5-declarative: immodule and helper applications'
  'qt5-x11extras: immodule and helper applications'
  'skk-jisyo: input method'
)

source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5436f5507b64c772da64e8ad7e598cb8b32dc9e5617e01d54e4a71eaf5566a3d')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/uim \
    --with-qt5-immodule \
    --with-qt5 \
    --with-anthy-utf8 \
    --with-skk

  # -Wno-deprecated-declarations          | Silence very noisy compiler warning
  # -Wno-error=incompatible-pointer-types | https://github.com/uim/uim/issues/231#issuecomment-2849152793
  make CFLAGS+="-Wno-deprecated-declarations -Wno-error=incompatible-pointer-types"
}

# check() {
#   cd "$_archive"
#
#   make check
# }

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir" install -j1

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
