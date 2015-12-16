pkgname=douane-dkms-git
pkgver=1
pkgrel=1
pkgdesc="Douane Firewall Kernel Module (DKMS)"
arch=('i686' 'x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
install=${pkgname}.install
source=('git+https://github.com/Douane/douane-dkms.git'
        "${pkgname}.install")
md5sums=('SKIP'
         'ab6d49e4449e5647ca5c58021674ae82')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
  # Install
  cd "$srcdir/$pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

for i in "${srcdir}/${pkgname}/"{Makefile,douane.c,network_activity_message.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
  done
}
