# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.3
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://fedorahosted.org/certmonger/"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf
        etc/tmpfiles.d/certmonger.conf)
install=${pkgname}.install
source=("https://releases.pagure.org/certmonger/certmonger-${pkgver}.tar.gz"{,.sig})
sha512sums=('9e59fb289b006cd787e06eb1b624cef1051adfed20f31c6cffb818ae49fccd6c5d5f1b3835590b962990b2376963717a5e9e71d1ff25939afba60cb4b3cfeeed'
            'SKIP')

# Nalin Dahyabhai
validpgpkeys=("1AD3D57B7B070952A0405FDA020B9DB9E54F6897")

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --localstatedir=/var \
    --enable-systemd \
    --enable-tmpfiles \
    --with-tmpdir=/run/certmonger

  make
}

check() {
  cd "${pkgname}-${pkgver}"
  if [[ "${run_tests}" == "true" ]]; then
    make check
  fi
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
