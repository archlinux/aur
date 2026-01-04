# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-fmod-tookit-git
_pkgname=fmod_toolkit
pkgver=r2.c471d3b
pkgrel=1
pkgdesc="A lightweight Python package designed to extract and export audio."
arch=('x86_64')
url="https://github.com/K0lb3/fmod_toolkit.git"
license=('MIT')
provides=('python-fmod-tookit')
conflicts=('python-fmod-tookit')
depends=(
  'python'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools' 
  'python-wheel' 
  'git' 
  'git-lfs'
)
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  git lfs install --local
  
  git remote add network-origin "${url}" || true
  echo "Fetching LFS objects from network..."
  git lfs fetch network-origin
  git lfs checkout
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  pytest -v --cov || true
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}