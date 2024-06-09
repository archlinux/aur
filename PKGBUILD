# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-minerva-git
_gitpkgname=minerva
pkgver=r128.5bac31a
pkgrel=1
pkgdesc='32-bit RISC-V soft processor'
arch=('any')
url='https://github.com/minerva-cpu/minerva'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth'
  'python-jtagtap-git'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pdm-backend'
  'python-wheel'
)
checkdepends=(
  'yices'
  'symbiyosys'
)
provides=("python-minerva=${pkgver}")
conflicts=('python-minerva')

source=(
  "${_gitpkgname}::git+https://github.com/minerva-cpu/minerva.git"
  "pipeline-diagram.png::https://docs.google.com/drawings/d/e/2PACX-1vTMkQc8ZJoiJ2AOeFGMkK0QTNx1hSG5wDrG5seLdJ3i61E4ag7wH7VFey44qhvuXotvOKxOw-mFS-VE/pub?w=850&h=761"
)

sha512sums=(
  'SKIP'
  '5a6c9f6e1e543b1bbdb2dca8479b948b6bc1e9139c7767e7dfd9d894b388cb3507604b58d08e91b1e82296729ee924b98cc9579440c06b02f474f27ea9b4c11a'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitpkgname}"

  echo >&2 'Adjusting image links'
  sed -i -e 's/\(!\[Pipeline Diagram Image\]\)([^)]*)/\1(.\/pipeline-diagram.png)/' \
    README.md
}

build() {
  cd "${_gitpkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}"
  python -m unittest discover -v
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md ../pipeline-diagram.png

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
