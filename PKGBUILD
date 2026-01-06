# Maintainer: Piotr Żarczyński <piotr.zarczynski.06@gmail.com>

pkgname=pdfsharpen-git
pkgver=0.1.0.r2.g41b0705
pkgrel=1
pkgdesc="Sharpen scanned PDFs by rasterizing pages and applying an unsharp mask"
arch=(x86_64)
url="https://github.com/pzarczynski/pdfsharpen"
license=(MIT)
depends=(python python-pymupdf libjpeg-turbo)
makedepends=(git python-build python-installer python-setuptools python-wheel)
provides=(pdfsharpen)
conflicts=(pdfsharpen)
source=("${pkgname}::git+https://github.com/pzarczynski/pdfsharpen.git")
sha256sums=(SKIP)

prepare() {
  cd "${srcdir}/${pkgname}"
  # Ensure C sources are readable for build
  chmod -R +r pdfsharpen/unsharp/
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${pkgname}"
  /usr/bin/python -m build --wheel
}

package() {
  cd "${srcdir}/${pkgname}"
  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
