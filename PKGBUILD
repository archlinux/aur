# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.11.0
pkgrel=4
arch=('any')
url="http://github.com/koiuo/randrctl"
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
depends=('python' 'python-argcomplete' 'python-yaml' 'xorg-xrandr')
optdepends=('bash-completion: bash shell prompt auto-completions')
install="randrctl.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koiuo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('733a93997c2592a917afcf91e16e70c41f2ef47c1531d220adbc1fc08c012277')


build() {
  cd "${pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  python -m randrctl setup completion > bash_completion

  install -Dm644 randrctl/setup/config.yaml "${pkgdir}/etc/randrctl/config.yaml"
  install -Dm644 randrctl/setup/99-randrctl.rules "${pkgdir}/usr/lib/udev/rules.d/99-randrctl.rules"
  install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/randrctl"
}

# vim:set ts=2 sw=2 et:
