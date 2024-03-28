# Maintainer:

## useful links:
# https://salsa.debian.org/debian/debhelper
# https://salsa.debian.org/reproducible-builds/strip-nondeterminism

_pkgname="debhelper"
pkgname="$_pkgname-git"
pkgver=13.15.3.r0.gebfe8e5
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

provides+=("dh-strip-nondeterminism")
conflicts+=("dh-strip-nondeterminism")

# dh_strip_nondeterminism
_dh_strip_nondeterminism_url="https://salsa.debian.org/reproducible-builds/strip-nondeterminism"
_dh_strip_nondeterminism_script="dh_strip_nondeterminism-dh_${pkgver%%.r*}"
source+=("$_dh_strip_nondeterminism_script"::"$_dh_strip_nondeterminism_url/-/raw/master/bin/dh_strip_nondeterminism")
sha256sums+=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # prevent unicode error
  rm "man/po4a/po"/*.po
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

  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/$_dh_strip_nondeterminism_script" "$pkgdir/usr/bin/dh_strip_nondeterminism"
}
