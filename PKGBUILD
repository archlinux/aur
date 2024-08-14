# Maintainer:

## links
# https://salsa.debian.org/debian/debhelper
# https://salsa.debian.org/reproducible-builds/strip-nondeterminism

_pkgname="debhelper"
pkgname="$_pkgname-git"
pkgver=13.18.r0.g5b2b08b
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
url="https://salsa.debian.org/debian/debhelper"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'dpkg'
  'perl-pod-parser'
)
makedepends=(
  'git'
  'po4a'
)
optdepends=(
  'dh-make: convert source archives into Debian package source'
)

_source_main() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_dh_strip_nondeterminism() {
  conflicts+=("dh-strip-nondeterminism")

  _pkgsrc_dh_strip_nd="dh_strip_nondeterminism"
  source+=("$_pkgsrc_dh_strip_nd"::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git")
  sha256sums+=('SKIP')
}

_source_main
_source_dh_strip_nondeterminism

prepare() {
  cd "$_pkgsrc"

  # prevent unicode error
  rm "man/po4a/po"/*.po
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='debian/[0-9]*' \
    | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  depends+=(
    'binutils'
    'file'
    'man-db'
    'python-html2text'
    'strip-nondeterminism'

    # AUR
    'po-debconf'
  )

  make -C "$_pkgsrc" DESTDIR="$pkgdir" install
  install -Dm755 "$_pkgsrc_dh_strip_nd/bin/dh_strip_nondeterminism" -t "$pkgdir/usr/bin/"
}
