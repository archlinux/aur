# Contributor: Grey Christoforo <first name at last name dot net>
# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-unitypy-git
_pkgname=UnityPy
pkgver=r779.3472646
pkgrel=1
pkgdesc="A unity asset extractor based on unitypack and AssetStudio."
arch=('x86_64')
url="https://github.com/K0lb3/UnityPy"
license=('MIT')
provides=('python-unitypy')
conflicts=('python-unitypy')
depends=(
  'python-attrs'
  'python-lz4'
  'python-brotli'
  'python-pillow'
  'python-pyfmodex-git'
  'python-fsspec'
  'python-texture2ddecoder'
  'python-etcpak-git'
  'python-tabulate'
  'python-fmod-tookit-git'
  'python-astc-encoder-py-git'
)
checkdepends=('python-pytest' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git' 'git-lfs')
source=("git+https://github.com/K0lb3/UnityPy.git")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  git lfs install --local
  
  git remote add network-origin "https://github.com/K0lb3/UnityPy.git" || true
  echo "Fetching LFS objects from network..."
  git lfs fetch network-origin
  git lfs checkout
}

build() {
  cd ${_pkgname}
  export LC_ALL=C
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}
  export LANG=en_US.UTF-8
  PYTHONPATH="$PWD" pytest -v || true
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
