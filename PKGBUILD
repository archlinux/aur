# Maintainer: ozraru <ozraru@raru.work>

pkgname=isc-stork
_pkgname=stork
pkgver=1.6.0
pkgrel=1
pkgdesc="Stork is a dashboard for BIND 9 and Kea DHCP."
arch=('x86_64')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=('rake' 'java-runtime')
backup=('etc/stork')
source=("git+https://gitlab.isc.org/isc-projects/${_pkgname}.git#tag=v${pkgver}")
sha512sums=('SKIP')

# prepare() {
#   cd $_pkgname

#   sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgname.desktop
#   echo 'Path=/usr/bin' >> $pkgname.desktop
# }

build() {
  cd $_pkgname
  rake build
}

package() {
  cd $_pkgname
  rake install:server DEST="$pkgdir"
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/man" "$pkgdir/usr/share"
  mv "$pkgdir/lib/systemd" "$pkgdir/etc"
  rm -r "$pkgdir/lib"
  mkdir -p "$pkgdir/etc/"
  install -Dm644 "${srcdir}/isc-stork.sysuser" "${pkgdir}/usr/lib/sysusers.d/isc-stork.conf"
}

