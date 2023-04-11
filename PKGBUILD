# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=keyringctl-git
pkgver=r170.da6c4af
pkgrel=1
pkgdesc="Tool to build, manage and inspect Web-of-Trust keyrings"
url="https://gitlab.archlinux.org/archlinux/keyringctl.git"
license=('GPL3')
arch=('any')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-pdm'
  'python-pdm-pep517'
)

checkdepends=(
  # For make lint
  'python-black'
  'flake8'
  'python-isort'
  'mypy'
  # For make test
  'python-coverage'
  'python-pytest'
  'python-tomli'
)

depends=('python' 'sequoia-sq')
optdepends=(
  'hopenpgp-tools: for verify command'
  'sequoia-keyring-linter: for verify command'
  'git: for ci command'
)
# The original code in the upstream repo is badly borken. Use my fork for now.
#source=("${pkgname%-git}::git+$url")
source=("${pkgname%-git}::git+https://gitlab.archlinux.org/xexaxo/keyringctl.git#branch=en-route-to-archpkg")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgbase%-git}"

  make build
}

check() {
  cd "${pkgbase%-git}"

  make lint
  make test
}

package() {
  cd "${pkgbase%-git}"

  DESTDIR="$pkgdir" make install
}
