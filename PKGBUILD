# Maintainer: Simpson474

pkgname=evcc-git
pkgver=0.314.0.dev+fc6fe3dce
pkgrel=1
pkgdesc="evcc is an extensible EV Charge Controller and home energy management system"
arch=(any)
url="https://evcc.io/"
license=('MIT')
conflicts=('evcc-bin')
provides=("evcc=${pkgver}")
makedepends=('git' 'go' 'npm' 'vite-plus')
source=("git+https://github.com/evcc-io/evcc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/evcc"
  VERSION=$(make --just-print)
  if [[ $VERSION =~ Version:\ ([^ ]*) ]] ; then
    echo ${BASH_REMATCH[1]} | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}

build() {
  cd "$srcdir/evcc"
  make install-ui
  make install
  make
}

package() {
  cd "$srcdir/evcc"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 evcc "${pkgdir}/usr/bin/evcc"
  install -D -m644 packaging/init/evcc.service "${pkgdir}/usr/lib/systemd/system/evcc.service"

  printf "g     evcc    -\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
