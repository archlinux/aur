# Maintainer: Manos G. <seventh dot fret at protonmail dot com>
pkgname=meerk40t-git
pkgver=0.9.8920.r19993.dab6ce164
pkgrel=1
pkgdesc="Hackable Laser software for K40 / GRBL / Fibre Lasers"
arch=("any")
url="https://github.com/meerk40t/meerk40t"
license=('MIT')
depends=("python"
     "python-numpy"
     "python-pillow"
     "python-pyusb"
     "python-pyserial"
     "python-wxpython"
     "python-opencv"
     "python-websocket-client")
optdepends=("python-ezdxf")
makedepends=('git' 'gendesk')
source=("$pkgname::git+https://github.com/meerk40t/meerk40t.git"
        "meerk40t-logo.png")
sha256sums=('SKIP'
            'e6fa82a217675a14591a2482c96459b4a0f0fa5bce38206f2a3e373811a2be35')

pkgver() {
  cd "$pkgname"
  VERSION=$(git describe --tags | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+)[^0-9].*/\1/')
  printf "%s.r%s.%s" "$VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}

  gendesk -f -n \
     --pkgname="Meerk40t-Git" \
     --pkgdesc="$pkgdesc" \
     --name="MeerK40t-Git" \
     --comment "Laser software for the K40 Stock-LIHUIYU laser boards" \
     --exec=meerk40t-git \
     --icon=/opt/meerk40t-git/meerk40t-logo.png \
     --terminal=false \
     --startupnotify=true \
     --categories=Graphics
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  echo -e "#!/bin/sh\nexport PYTHONDONTWRITEBYTECODE=1\nexec python3 /opt/${pkgname}/meerk40t.py" > ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}

  mkdir -p ${pkgdir}/opt
  cp -r ${srcdir}/${pkgname} ${pkgdir}/opt/${pkgname}

  install -Dm644 meerk40t-logo.png ${pkgdir}/opt/${pkgname}/meerk40t-logo.png

  mkdir -p ${pkgdir}/usr/share/applications
  install -Dm644 Meerk40t-Git.desktop ${pkgdir}/usr/share/applications/meerk40t-git.desktop

  cd "${pkgdir}/opt/${pkgname}"
  python3 -m compileall -q -o 0 -f meerk40t
}
