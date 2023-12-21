# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

_pkgname="debhelper"
pkgname="$_pkgname"
pkgver=13.11.9
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
url="https://salsa.debian.org/debian/debhelper"
license=('GPL2' 'GPL3')
arch=('any')

_url_dh_strip_nondeterminism="https://salsa.debian.org/reproducible-builds/strip-nondeterminism"

depends=(
  'perl-pod-parser'
)
makedepends=(
  'git'
  'po4a'
)
optdepends=(
  'dh-make: convert source archives into Debian package source'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source=("git+$url.git#tag=debian/${pkgver%%.r*}")
  sha256sums=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

provides+=("dh-strip-nondeterminism")
conflicts+=("dh-strip-nondeterminism")

source+=("dh_strip_nondeterminism"::"$_url_dh_strip_nondeterminism/-/raw/master/bin/dh_strip_nondeterminism?inline=false")
sha256sums+=('SKIP')

build() {
  cd "$_pkgsrc"
  make
}

package() {
  depends+=(
    'binutils'
    'dpkg'
    'file'
    'html2text'
    'man-db'
    'strip-nondeterminism'

    # AUR
    'po-debconf'
  )

  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
  install -Dm755 "${srcdir:?}/dh_strip_nondeterminism" -t "${pkgdir:?}/usr/bin"
}

# vim:set ts=2 sw=2 et:
