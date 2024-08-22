# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

_pkgname="debhelper"
pkgname="$_pkgname"
pkgver=13.19
pkgrel=1
pkgdesc="Programs to automate common tasks in debian/rules when building Debian packages"
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
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#tag=debian/$pkgver")
  sha256sums=('ab8889bc8dc098bad145d4d7e46f7b0a4b4570fc2ab3ecb1917e69fd3cb71b3a')
}

_source_dh_strip_nd() {
  conflicts+=("dh-strip-nondeterminism")

  _pkgsrc_dh_strip_nd="strip-nondeterminism"
  source+=("$_pkgsrc_dh_strip_nd"::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git")
  sha256sums+=('SKIP')
}

_source_main
_source_dh_strip_nd

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

  make -C "$_pkgsrc" DESTDIR="$pkgdir" install
  install -Dm755 "$_pkgsrc_dh_strip_nd/bin/dh_strip_nondeterminism" -t "$pkgdir/usr/bin/"
}
