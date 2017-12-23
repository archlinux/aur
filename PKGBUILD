# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.5
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
sha512sums=('b447bbbe6cbe1e3561c4a4083789baa4503516273273a7ac6a17b1287a3b36f8fa2b0c56e075a7eb98e582cdff5939c1c6436f2d011ed0f61b555da0d7b4a7ba'
            'SKIP')

# Rob Crittenden
validpgpkeys=("B2457A44826F91F11AC8E58D3F73F755B836FFDC")

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
