# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

_pkgname="debhelper"
pkgname="$_pkgname"
pkgver=13.26
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

_pkgsrc="$_pkgname"
_pkgsrc_dh_strip_nd="strip-nondeterminism"
source=(
  "$_pkgsrc"::"git+$url.git#tag=debian/$pkgver"
  "$_pkgsrc_dh_strip_nd"::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git"
)
sha256sums=(
  '5ee8275f007862574bff5655902b8faf1bf834a7ffadb1bb19a508500229c737'
  'SKIP'
)

build() {
  cd "$_pkgsrc"
  make
}

package() {
  depends+=(
    'binutils'
    'file'
    'man-db'
    'po-debconf' # AUR
    'python'
    'python-html2text'
    'strip-nondeterminism'
  )

  make -C "$_pkgsrc" DESTDIR="$pkgdir" install
  install -Dm755 "$_pkgsrc_dh_strip_nd/bin/dh_strip_nondeterminism" -t "$pkgdir/usr/bin/"
}
