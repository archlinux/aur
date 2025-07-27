# Maintainer: Rafael Bento <rafael.bentoe.silva@gmail.com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>
pkgname=motioneye
pkgver=0.43.1b4
pkgrel=1
pkgdesc="A web frontend for the motion daemon"
arch=(any)
url="https://github.com/motioneye-project/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  motion
  ffmpeg
  v4l-utils
  python-tornado
  python-jinja
  python-pillow
  python-pycurl
  python-babel
  python-boto3
)
makedepends=(
  python-setuptools
  python-build
  python-wheel
  python-installer
)
install=${pkgname}.install
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('492aa342d26485cae46eb9d87affba2b4d32153445d43cf85f6184ac8352ec040b30ee4620edb62fdcfdb03800866cc8ec9482de12bf6fed584705d7e86b229c')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname} ${pkgdir}/etc/${pkgname} ${pkgdir}/var/lib/${pkgname}

  install -Dm664 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.systemd" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
