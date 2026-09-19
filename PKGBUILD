# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-fermi-reclock-dkms
_pkgname=nouveau-fermi-reclock
pkgver=2.0.1
pkgrel=1
pkgdesc="Unified Nouveau out-of-tree module with Fermi core, shader, and DDR3 memory reclocking (DKMS)"
arch=('x86_64')
url="https://github.com/Twilight0/nouveau-fermi-reclock-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'python')
backup=('etc/nouveau-dynclockd.conf')
source=(
  "https://github.com/Twilight0/nouveau-fermi-reclock-dkms/releases/download/v${pkgver}/nouveau-source.tar.gz"
  "nouveau-fermi-reclock.patch"
  "dkms.conf"
  "nouveau-fermi-reclock.conf"
  "nouveau-dynclockd.conf"
  "nouveau-dynclockd.py"
  "nouveau-dynclockd.service"
  "nouveau-ctrl"
  "nouveau-tui"
)
sha256sums=('1426cea7f5c4959cfcaec78b4974cde3071f51eb9fdf9beedf38efae0bc6b9ad'
            '5c2a923071b1803a393411c9cc57256114fd8833d9cba52568e80e8acebe144a'
            'f2876f7cc04ca907063832488f5f8488bd61d49e18886001bd87e545e53381a0'
            '80fd6268f03730c053c56ac67d9dfea450ac88e93b83aa60914d47dc218e4b97'
            '540d34a1aa71d71cebc1db4ecce8a1b40053a10c6173d17dd314170fa51b9ade'
            'c81b76976422580315f805dbc83f428cba9186e86493e5757c78a1c717a1f6c3'
            '87f698b1de37689cb3889bfae916ceaba1caca634ab6a653b1602bda613b20e4'
            '2e8638c242688c236ca90060f4cc57839b32c61cd88f6ccfa069df4f43ed5313'
            '5daf9ec796ad8189e38bb9b0016fb9727d0443c4a0c6dee5edb6fdc28bf3e700')

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

  # Install daemon configuration
  install -Dm644 "${srcdir}/nouveau-dynclockd.conf" "${pkgdir}/etc/nouveau-dynclockd.conf"

  # Install the dynamic clock daemon
  install -Dm755 "${srcdir}/nouveau-dynclockd.py" "${pkgdir}/usr/bin/nouveau-dynclockd.py"

  # Install systemd service
  install -Dm644 "${srcdir}/nouveau-dynclockd.service" "${pkgdir}/usr/lib/systemd/system/nouveau-dynclockd.service"

  # Install CLI management utility
  install -Dm755 "${srcdir}/nouveau-ctrl" "${pkgdir}/usr/bin/nouveau-ctrl"

  # Install interactive TUI reclocking & telemetry manager
  install -Dm755 "${srcdir}/nouveau-tui" "${pkgdir}/usr/bin/nouveau-tui"
}
