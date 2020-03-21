# Maintainer: Fernando Ortiz <nandub+arch [at] nandub.info>
# Contributor: Mark Laws <mdl [at] 60hz.org>

_pkgname=gale
pkgname=gale-git
epoch=1
pkgver=1.1.r18.ga576a1e
pkgrel=1
pkgdesc="A distributed, real-time instant messaging system"
arch=('i686' 'x86_64')
url="http://gale.org"
license=('GPL2')
depends=('bash' 'gc' 'openssl' 'adns' 'glib2' 'tcl')
makedepends=('git')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/grawity/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  cd ${_pkgname}

  if [[ ! -f configure ]]; then
    ./bootstrap
  fi
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr --sysconfdir=/etc
  make -C liboop liboop-tcl.la liboop-glib2.la liboop-rl.la liboop-adns.la #without this line build fails
  make -C libgale libgale.la # without this line build fails
  make # parallel builds seem to be broken
}

package() {
  cd ${_pkgname}

  make DESTDIR="$pkgdir" install
  # install fails if sbindir = bindir
  mv -f "$pkgdir/usr/sbin/gksign" "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}

# vim: set ts=2 sw=2 et:
