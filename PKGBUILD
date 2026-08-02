# Maintainer: Rafael Bento <rafael.bentoe.silva@gmail.com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>
pkgname=motioneye
pkgver=0.44.0
pkgrel=1
pkgdesc="A web frontend for the motion daemon"
arch=(any)
url="https://github.com/motioneye-project/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  'python>=3.7'
  motion
  ffmpeg
  v4l-utils
  'python-tornado>=6.5.7'
  python-jinja
  python-pillow
  python-pycurl
  python-babel
  python-boto3
  python-argon2-cffi
)
makedepends=(
  python-setuptools
  python-build
  python-wheel
  python-installer
)
optdepends=('python-pytz: timezone support')
backup=("etc/${pkgname}/${pkgname}.conf")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('d083ebc475940437627e7bd92bc8ba99d9ae3cba8714e74cc30b5f6e071c28105a36698a7b6574ba3e20776ebe72e26ba2d81e5303220b910d0fbd45099d4ec0')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  install -d -m 0775 "${pkgdir}/etc/${pkgname}"

  install -Dm664 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  meyectl_path="/usr/bin/meyectl"
  sed -i "s|^ExecStart=/usr/local/bin/meyectl|ExecStart=$meyectl_path|" "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.systemd"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.systemd" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
