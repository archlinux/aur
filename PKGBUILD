# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="openrecall-git"
pkgver=r79.140695f
pkgrel=1
pkgdesc="A fully open-source, privacy-first alternative to proprietary solutions like Microsoft's Windows Recall. You can easily access your digital history, enhancing your memory and productivity without compromising your privacy."
arch=('any')
url="https://github.com/openrecall/openrecall"
license=('AGPL3')
provides=(python-openrecall)
conflicts=(python-openrecall)
depends=(
  python
  python-flask
  python-numpy
  python-mss
  python-pytorch
  python-torchvision
  python-shapely
  python-h5py
  python-rapidfuzz
  python-pillow
  #AUR
  python-sentence-transformers
  python-doctr
)
optdepends=(python-pytorch-cuda python-pytorch-rocm)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
source=("git+https://github.com/openrecall/openrecall.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/openrecall"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/openrecall"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/openrecall"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/openrecall" <<EOF
#!/bin/bash
exec python3 -m openrecall.app "\$@"
EOF
}
