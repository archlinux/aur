# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

## useful links:
# https://salsa.debian.org/debian/debhelper
# https://salsa.debian.org/reproducible-builds/strip-nondeterminism

_pkgname="debhelper"
pkgname="$_pkgname"
pkgver=13.16
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

_pkgsrc="$_pkgname"
source=("git+$url.git#tag=debian/${pkgver%%.r*}")
sha256sums=('SKIP')

pkgver() {
  echo "${pkgver%%.r*}"
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
