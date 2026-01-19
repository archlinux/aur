# Maintainer: Manos G. <seventh dot fret at protonmail dot com>
pkgname="meerk40t"
pkgver="0.9.9000"
pkgrel="1"
pkgdesc="Hackable Laser software for K40 / GRBL / Fibre Lasers"
arch=("any")
url="https://github.com/meerk40t/meerk40t"
license=("MIT")
depends=("python"
     "python-numpy"
     "python-pillow"
     "python-pyusb"
     "python-pyserial"
     "python-wxpython"
     "python-opencv"
     "python-websocket-client")
optdepends=("python-ezdxf")
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meerk40t/meerk40t/archive/refs/tags/${pkgver}.tar.gz"
        "meerk40t-logo.png"
)
sha256sums=('7893f92af5566ddbf64ec88bfe684a98bd75a064c272e24616227d48dfb125c1'
            'e6fa82a217675a14591a2482c96459b4a0f0fa5bce38206f2a3e373811a2be35')

build() {
  cd ${srcdir}

  gendesk -f -n \
     --pkgname="${pkgname}" \
     --pkgdesc="$pkgdesc" \
     --name="${pkgname}" \
     --comment "$pkgdesc" \
     --exec=${pkgname} \
     --icon=/opt/${pkgname}/meerk40t-logo.png \
     --terminal=false \
     --startupnotify=true \
     --categories=Graphics
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  echo -e "#!/bin/sh\nexport PYTHONDONTWRITEBYTECODE=1\nexec python3 /opt/${pkgname}/meerk40t.py" > ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}

  mkdir -p ${pkgdir}/opt
  cp -r ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}

  install -Dm644 meerk40t-logo.png ${pkgdir}/opt/${pkgname}/meerk40t-logo.png

  mkdir -p ${pkgdir}/usr/share/applications
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  cd "${pkgdir}/opt/${pkgname}/${pkgname}"
  python3 -m compileall -q -o 0 .
}
