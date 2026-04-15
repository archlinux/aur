# Maintainer: Gabriel B. Sant'Anna <baiocchi.gabriel@gmail.com>
# Maintainer: ThePuzzlemaker <tpzker@thepuzzlemaker.info>

# overall information
pkgname=akku-git
_pkgname=akku
pkgdesc="Language package manager for Scheme"
url="https://akkuscm.org/"
license=('GPL3')
provides=(akku)
conflicts=(akku)
arch=('any')

# version-specific information
pkgrel=1
pkgver=1.1.0+r345+g5e57de0e1

# dependencies are stated in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
# guile3.0.11 is currently broken for bootstrapping :/
depends=('git' 'curl' 'guile2.2')
makedepends=('pkg-config' 'make' 'autoconf' 'automake' 'xz')

# source URLs for latest versions can be found at https://gitlab.com/akkuscm/akku/-/releases
options=(!strip) # disable stripping
source=('git+https://gitlab.com/akkuscm/akku.git'
	'0001-Use-guile2.2.patch')
md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "$_pkgname"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i ../../0001-Use-guile2.2.patch
}

build() {
  cd "$srcdir/$_pkgname"
  ./bootstrap
  ./configure \
    GUILE=/usr/bin/guile2.2 \
    GUILD=/usr/bin/guild2.2 \
    GUILE_CONFIG=/usr/bin/guile-config2.2 \
    --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
