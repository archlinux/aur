# Maintainer: Fernando Ortiz <nandub+arch [at] nandub.info>
# Contributor: Mark Laws <mdl [at] 60hz.org>

_pkgname=gale
pkgname=gale-git
epoch=1
pkgver=1.1.r17.gaa4e000
pkgrel=1
pkgdesc="A distributed, real-time instant messaging system"
arch=('i686' 'x86_64')
url="http://gale.org"
license=('GPL2')
depends=('bash' 'gc' 'openssl' 'adns')
makedepends=('git')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/grawity/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  if [[ ! -f configure ]]; then
    ./bootstrap
  fi
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1 # parallel builds seem to be broken
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  # install fails if sbindir = bindir
  mv -f "$pkgdir/usr/sbin/gksign" "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}

# vim: set ts=2 sw=2 et:
