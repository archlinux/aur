pkgname=eta-touchdrv-git
pkgver=0.4.2.rc5.r89.g3a85f93
pkgrel=1
pkgdesc='Non-HID touchscreen drivers for Fatih IWBs but source code of server daemons are
unavailable. They are provided by Vestel.'
arch=('x86_64')
url='https://github.com/vrdons/eta-touchdrv'
license=('GPL3')

depends=('dkms' 'systemd')
makedepends=('git')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  local tag rev hash

  tag="$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')"
  tag="$(echo "${tag}" | sed 's/[^[:alnum:]._]/./g')"
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"

  if [[ -n "${tag}" ]]; then
    echo "${tag}.r${rev}.g${hash}"
  else
    echo "0.0.0.r${rev}.g${hash}"
  fi
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
