_pkgbase=rtl8189ES_linux
_pkgname=8189fs
pkgname=8189fs-dkms
pkgver=r48.54bd680
pkgrel=2
pkgdesc="Kernel module for Realtek RTL8189FS and RTL8189FTV SDIO wireless devices."
arch=('armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux/tree/rtl8189fs"
license=('GPL')
conflicts=("8189fs-git")
install=${pkgname}.install
depends=('linux' 'dkms')
makedepends=('linux-headers' 'git')
source=("git://github.com/jwrdegoede/$_pkgbase.git#branch=rtl8189fs"
	"dkms.conf"
	"0001-Disable-debug-messages.patch")
sha256sums=('SKIP'
            '6d44b152b1482c2d912736d115b99b1511d11649974da624267bfcaa03839bfa'
            '0ffeea04836aa157e87af921596f4c1b8c6b3cb4acf1dc2cd464ff95626bee7c')
pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgbase"
  local i; for i in "${source[@]}"; do
    case $i in
      *.patch)
        msg2 "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
    esac
  done
}

package() {
  # Make


  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
	  -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
