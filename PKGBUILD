# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

: ${_cksum:=e0ca62b4e30047aa7c31391d9a96d9882beaa63af22a2fe658dda37d95458473}

_pkgname="debhelper"
pkgname="$_pkgname"
pkgver=13.24.2
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
  sha256sums=("${_cksum:?}")
}

_source_dh_strip_nd() {
  conflicts+=("dh-strip-nondeterminism")

  _pkgsrc_dh_strip_nd="strip-nondeterminism"
  source+=("$_pkgsrc_dh_strip_nd"::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git")
  sha256sums+=('SKIP')
}

_source_main
_source_dh_strip_nd

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
    'python-html2text'
    'strip-nondeterminism'
  )

  make -C "$_pkgsrc" DESTDIR="$pkgdir" install
  install -Dm755 "$_pkgsrc_dh_strip_nd/bin/dh_strip_nondeterminism" -t "$pkgdir/usr/bin/"
}
