# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Chris Billington <chrisjbillington at gmail dot com>
pkgname=git-nautilus-icons-git
pkgver=2.2.0.r0.g92bbecb
pkgrel=1
pkgdesc="A Nautilus, Nemo, and Caja extension to overlay icons on files in git repositories"
arch=('any')
url="https://github.com/chrisjbillington/git-nautilus-icons"
license=('BSD-2-Clause')
depends=('python-gobject')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=(
  'nautilus-python: Nautilus support'
  'nemo-python: Nemo support'
  'python-caja: Caja support'
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  "${pkgname%-git}-common"
  'git-caja-icons'
  'git-nemo-icons'
)
source=("git+https://github.com/chrisjbillington/git-nautilus-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver%.*}
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
