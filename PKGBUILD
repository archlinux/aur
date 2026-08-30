# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-fermi-reclock-dkms
_pkgname=nouveau-fermi-reclock
pkgver=1.0.2
pkgrel=1
pkgdesc="Unified Nouveau out-of-tree module with Fermi core/shader reclocking (DKMS)"
arch=('x86_64')
url="https://github.com/Twilight0/nouveau-fermi-reclock-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'python')
source=(
  "https://github.com/Twilight0/nouveau-fermi-reclock-dkms/releases/download/v${pkgver}/nouveau-source.tar.gz"
  "nouveau-fermi-reclock.patch"
  "dkms.conf"
  "nouveau-fermi-reclock.conf"
  "nouveau-dynclockd.py"
  "nouveau-dynclockd.service"
)
sha256sums=('1426cea7f5c4959cfcaec78b4974cde3071f51eb9fdf9beedf38efae0bc6b9ad'
            '0db9f2f1bb611c0ba54122c2ee06164d9457c53a8dce69c9a5be2539d1810da7'
            'e18bc5f217f6562d270f5ad5c0ae10f40ed83a2a52ab52724583e253a2a2f9ce'
            'b4aa1f2d25fc8bdf9ed5e13c68edaab09746a2bbf818278d2fae3bc5f0fa134d'
            '45f2dce5fed26507b4d5ca8d554bbf47026aa2baac6831bc867107334c768ff0'
            '92911764e6fe601af3599a9e0fb95b48fe6109be6208d4150fa762f17c32c7fa')

prepare() {
  msg2 "Applying Fermi reclocking and backlight patches..."
  patch -Np1 -d "${srcdir}/nouveau-source" < "${srcdir}/nouveau-fermi-reclock.patch"

  # Replace @PKGVER@ in dkms.conf
  sed "s/@PKGVER@/${pkgver}/g" -i "${srcdir}/dkms.conf"
}

package() {
  local destdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -d "${destdir}"
  
  # Copy pre-patched sources directly to the DKMS build directory
  cp -r "${srcdir}/nouveau-source/"* "${destdir}/"
  
  # Install dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${destdir}/dkms.conf"

  # Install default modprobe configuration
  install -Dm644 "${srcdir}/nouveau-fermi-reclock.conf" "${pkgdir}/usr/lib/modprobe.d/nouveau-fermi-reclock.conf"
  
  # Install the dynamic clock daemon
  install -Dm755 "${srcdir}/nouveau-dynclockd.py" "${pkgdir}/usr/bin/nouveau-dynclockd.py"
  
  # Install systemd service
  install -Dm644 "${srcdir}/nouveau-dynclockd.service" "${pkgdir}/usr/lib/systemd/system/nouveau-dynclockd.service"
}
