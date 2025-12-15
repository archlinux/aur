# Maintainer: Rafael Bento <rafael.bentoe.silva@gmail.com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>
pkgname=motioneye
pkgver=0.43.1
pkgrel=3
pkgdesc="A web frontend for the motion daemon"
arch=(any)
url="https://github.com/motioneye-project/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  'python>=3.7'
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
optdepends=('python-pytz: timezone support')
backup=("etc/${pkgname}/${pkgname}.conf")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('73b00ef211533a536f67995c6b38a89c7aa9894aa0df2abfa995c07f28929e6ece9549c6d7a178c9760c59970a352c74ebabace046eed4b85ddb8fce4d62c27c')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  mkdir -p "${pkgdir}/etc/${pkgname}" "${pkgdir}/var/lib/${pkgname}"

  install -Dm664 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  meyectl_path="/usr/bin/meyectl"
  sed -i "s|^ExecStart=/usr/local/bin/meyectl|ExecStart=$meyectl_path|" "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.systemd"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/extra/${pkgname}.systemd" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
