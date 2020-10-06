# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=noisy-py3-git
_pkgname=noisy
pkgver=20180908.r54_c21e768
pkgrel=1
pkgdesc="Simple random DNS, HTTP/S internet traffic noise generator "
arch=('i686' 'x86_64')
url="https://github.com/1tayH/noisy"
license=('GPL3')
depends=('python>=3.6.0' 'python-requests>=2.9.1')
makedepends=('python-setuptools')
source=(https://github.com/1tayH/noisy)
options=(emptydirs)
sha256sums=('SKIP')
source=(
	"${pkgname}::git://github.com/1tayH/noisy#branch=${BRANCH:-master}"
)


pkgver() {

  cd "${srcdir}/${pkgname}"
  local DATE=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  local COUNT=$(git rev-list --count HEAD)
  local COMMIT=$(git rev-parse --short HEAD)
  printf "%s.%s_%s" "$DATE" "r${COUNT}" "${COMMIT}"

}

prepare () {

  mkdir -p ${pkgdir}/usr/share/${_pkgname}

  sed -i -e "s|User=noisy|DynamicUser=yes|g" ${srcdir}/${pkgname}/examples/systemd/noisy.service
  sed -i -e "s|WorkingDirectory=/opt/noisy|WorkingDirectory=/usr/share/${_pkgname}|g" ${srcdir}/${pkgname}/examples/systemd/noisy.service
  sed -i -e "s|ExecStart=/usr/bin/python /opt/noisy/noisy.py --config /opt/noisy/config.json|ExecStart=/usr/bin/python /usr/bin/noisy.py --config /usr/share/noisy/config.json|g" ${srcdir}/${pkgname}/examples/systemd/noisy.service

}

package() {

    cd "${srcdir}/${pkgname}"
    install -D -m755 "${srcdir}"/${pkgname}/noisy.py "${pkgdir}/usr/bin/noisy.py"
    install -D -m644 "${srcdir}"/${pkgname}/config.json "${pkgdir}/usr/share/${_pkgname}/config.json"
    install -D -m644 "${srcdir}"/${pkgname}/examples/systemd/noisy.service "${pkgdir}/etc/systemd/system/noisy.service"
    install -D -m644 "${srcdir}"/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cp -r ${srcdir}/${pkgname}/* ${pkgdir}/usr/share/${_pkgname}/

}
