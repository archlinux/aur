# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-fermi-reclock-dkms
_pkgname=nouveau-fermi-reclock
pkgver=1.2.0
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
  "nouveau-ctrl"
  "nouveau-tui"
)
sha256sums=('1426cea7f5c4959cfcaec78b4974cde3071f51eb9fdf9beedf38efae0bc6b9ad'
            '05b27acf5015a17b34b24bcffe4dddf55016d4652a63f344c9a9fc591622824a'
            'e18bc5f217f6562d270f5ad5c0ae10f40ed83a2a52ab52724583e253a2a2f9ce'
            '6071288d33dc5d9892a39cd1030c6af919bab437a3bd579be21350f3cc192737'
            '98309d5c7bf9aeb6b3485504028c5e21aa83c9df83b4fe087fbe694fe0fc114d'
            '92911764e6fe601af3599a9e0fb95b48fe6109be6208d4150fa762f17c32c7fa'
            'a956b3de4e0eac70a64b743415038f84ebce615be5edddfb9fc3c06ddba58d9c'
            '78067cc1e5e742c66133cfda03a990827dddccf77c98cd0e544e11758b33ca7d')

prepare() {
  msg2 "Applying Fermi reclocking and 120Hz display patches..."
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

  # Install CLI management utility
  install -Dm755 "${srcdir}/nouveau-ctrl" "${pkgdir}/usr/bin/nouveau-ctrl"

  # Install interactive TUI reclocking & telemetry manager
  install -Dm755 "${srcdir}/nouveau-tui" "${pkgdir}/usr/bin/nouveau-tui"
}
