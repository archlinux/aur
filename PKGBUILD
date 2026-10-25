# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-dkms
pkgver=2.2.0
pkgrel=1
pkgdesc="Unified Nouveau out-of-tree module with Fermi core, shader, and DDR3 memory reclocking (DKMS)"
arch=('x86_64')
url="https://github.com/Twilight0/nouveau-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'python')
provides=('nouveau-dkms')
conflicts=('nouveau-fermi-reclock-dkms' 'nouveau-fermi-reclock-cachyos-lts-v2')
replaces=('nouveau-fermi-reclock-dkms')
backup=('etc/nouveau-dynclockd.conf')
source=(
  "nouveau-source.tar.gz::https://github.com/Twilight0/nouveau-dkms/releases/download/v2.1.0/nouveau-source.tar.gz"
  "nouveau.patch"
  "dkms.conf"
  "nouveau.conf"
  "nouveau-dynclockd.conf"
  "nouveau-dynclockd.py"
  "nouveau-dynclockd.service"
  "nouveau-ctrl"
  "nouveau-tui"
  "apps.conf.sample"
)
sha256sums=('1426cea7f5c4959cfcaec78b4974cde3071f51eb9fdf9beedf38efae0bc6b9ad'
            '11edd475544e3be80ce758e150ebc22ff21a72ccfd46fc23eac14a9664ff7e3d'
            '7f0d3d86a1551d4f1775d6dea33568f04d59dbf38faa7e9d50c0b327cfc327a6'
            '326efac21bf858f7be0e41b21f2c585bfd1ef5b18dad9cce022685a4623bb090'
            '0bd9da376f1df0c1b4015de533bb71da6e2ba9ea333a1778ef590337e3d90492'
            'c629b0594b1b0145de6140ff82b91e638587f45152a52677792f6cdee02bc77f'
            '87f698b1de37689cb3889bfae916ceaba1caca634ab6a653b1602bda613b20e4'
            'd46e9f4796ffd5386fe1376a6f38205f6098f550636b9bc693d6bf6fc4496f9c'
            'a58f3aea24b5ed07bbebb744807b53585d0498c1e24f457b31127cb43459a158'
            '86e52aafa4e1edfc3792226d4519584f2ba88d6303277eff77d6c735d2f2fcb9')

prepare() {
  msg2 "Applying Fermi reclocking and 120Hz display patches..."
  patch -Np1 -d "${srcdir}/nouveau-source" < "${srcdir}/nouveau.patch"

  # Replace @PKGVER@ in dkms.conf
  sed "s/@PKGVER@/${pkgver}/g" -i "${srcdir}/dkms.conf"
}

package() {
  local destdir="${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -d "${destdir}"
  
  # Copy pre-patched sources directly to the DKMS build directory
  cp -r "${srcdir}/nouveau-source/"* "${destdir}/"
  
  # Install dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${destdir}/dkms.conf"

  # Install default modprobe configuration
  install -Dm644 "${srcdir}/nouveau.conf" "${pkgdir}/usr/lib/modprobe.d/nouveau.conf"

  # Install daemon configuration
  install -Dm644 "${srcdir}/nouveau-dynclockd.conf" "${pkgdir}/etc/nouveau-dynclockd.conf"

  # Install per-app profile drop-in directory and sample
  install -d "${pkgdir}/etc/nouveau-dynclockd.d"
  install -Dm644 "${srcdir}/apps.conf.sample" "${pkgdir}/etc/nouveau-dynclockd.d/apps.conf.sample"

  # Install the dynamic clock daemon
  install -Dm755 "${srcdir}/nouveau-dynclockd.py" "${pkgdir}/usr/bin/nouveau-dynclockd.py"

  # Install systemd service
  install -Dm644 "${srcdir}/nouveau-dynclockd.service" "${pkgdir}/usr/lib/systemd/system/nouveau-dynclockd.service"

  # Install CLI management utility
  install -Dm755 "${srcdir}/nouveau-ctrl" "${pkgdir}/usr/bin/nouveau-ctrl"

  # Install interactive TUI reclocking & telemetry manager
  install -Dm755 "${srcdir}/nouveau-tui" "${pkgdir}/usr/bin/nouveau-tui"
}
