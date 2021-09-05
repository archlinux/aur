# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="deemix-pyweb-git"
_pkgname="deemix-gui-pyweb"
pkgver=r465.2204471b8b
pkgrel=2
pkgdesc="This is a pyqtwebengine wrapper for deemix-webui"
arch=('any')
url="https://gitlab.com/RemixDev/$_pkgname"
license=('gpl3')
depends=('python>=3.7' 'deemix' 'python-flask' 'python-flask-socketio' 'python-pyqt5' 'python-pyqt5-sip' 'python-pyqtwebengine' 'python-eventlet')
makedepends=('git' 'unzip')
provides=('deemix-pyweb')
source=("${_pkgname}::git+https://gitlab.com/RemixDev/$_pkgname"
        "deemix-webui.zip::https://gitlab.com/RemixDev/deemix-webui/-/archive/1.6.0/deemix-webui-1.6.0.zip")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -dr --no-preserve=ownership ${_pkgname}/* "${pkgdir}/usr/lib/${_pkgname}/"
  unzip -o deemix-webui.zip
  cp -dr --no-preserve=ownership deemix-webui-1.6.0/* "${pkgdir}/usr/lib/${_pkgname}/webui"

  chmod +x "${pkgdir}/usr/lib/${_pkgname}/server.py"
  chmod +x "${pkgdir}/usr/lib/${_pkgname}/deemix-pyweb.py"

  sed -i "s/deemix-pyweb/${_pkgname}/" "${pkgdir}/usr/lib/${_pkgname}/deemix-pyweb.desktop"

  install -dm755 "${pkgdir}/usr/share/applications/"
  ln -s "/usr/lib/${_pkgname}/deemix-pyweb.desktop" "${pkgdir}/usr/share/applications/deemix-pyweb.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/server.py" "${pkgdir}/usr/bin/${_pkgname}-server"
  ln -s "/usr/lib/${_pkgname}/deemix-pyweb.py" "${pkgdir}/usr/bin/${_pkgname}"
}
