pkgname=eta-touchdrv-git
pkgver=0.5.2.g3a85f93
pkgrel=1
pkgdesc='Non-HID touchscreen drivers for Fatih IWBs but source code of server daemons are
unavailable. They are provided by Vestel.'
arch=('x86_64' 'aarch64')
url='https://github.com/vrdons/eta-touchdrv'
license=('GPL3')

depends=('dkms' 'usbutils' 'systemd')
optdepends=('touchegg: Touchscreen configuraton'
            'touche: Touchscreen configuraton tool')
makedepends=('git')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -d "${pkgdir}/usr/lib/udev/rules.d"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -a src/Makefile src/OpticalDrv.c src/include \
    "${pkgdir}/usr/src/${pkgname}-${pkgver}/"

  cp -a bin/touch2 "${pkgdir}/usr/bin/"
  cp -a bin/touch4 "${pkgdir}/usr/bin/"

  install -Dm755 package/common/touchdrv_launcher \
    "${pkgdir}/usr/bin/touchdrv_launcher"

  install -Dm644 package/common/eta-touchdrv@.service \
    "${pkgdir}/usr/lib/systemd/system/eta-touchdrv@.service"

  install -Dm644 package/common/60-eta-touchdrv.rules \
    "${pkgdir}/usr/lib/udev/rules.d/60-eta-touchdrv.rules"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 package/common/build.dkms \
    "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"

  sed -i "s/__VERSION__/${pkgver}/g" \
    "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
