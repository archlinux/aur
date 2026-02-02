# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=onleiharr
_gitname=Onleiharr
pkgver=0.2.0
pkgrel=1
pkgdesc='Onleihe watcher with notifications and auto-rent'
arch=('any')
url='https://github.com/nzb-tuxxx/Onleiharr'
license=('MIT')
depends=(
  'python'
  'apprise'
  'python-requests'
  'python-beautifulsoup4'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
optdepends=(
  'gourou: libgourou tools for ACSM downloads and optional DRM removal'
)
backup=('etc/onleiharr/onleiharr.toml')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nzb-tuxxx/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz"
  'onleiharr.service'
  'onleiharr.sysusers'
  'onleiharr.toml'
)
sha256sums=('237505abd5d4a905afac7885fc44acbb6905a23837af29b4ea99749ef74bd0d6'
            '0c17422722ad64eebd2c20986f60a0c155724070fe1a4e6bab9b119fdba5f0ae'
            '742faee2b1064dbf77b5e2b8e29f6b20a06e83711e5415bafd9dabb1e02ee1e0'
            '1a733196d06a2cf650e36eb84200cb1754901042eab4ffa193e94eb3e7ef195c')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "${srcdir}/onleiharr.service" \
    "${pkgdir}/usr/lib/systemd/system/onleiharr.service"
  install -Dm644 "${srcdir}/onleiharr.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/onleiharr.conf"
  install -Dm644 "${srcdir}/onleiharr.toml" \
    "${pkgdir}/etc/onleiharr/onleiharr.toml"
}
