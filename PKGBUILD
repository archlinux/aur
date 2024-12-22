# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-minerva-amaranth0.4
_gitpkgname=minerva
_commit=5bac31a40b6d8098ba2f4b7c4906ca667b6155f7
pkgver=r128.5bac31a
pkgrel=1
pkgdesc='32-bit RISC-V soft processor'
arch=('any')
url='https://github.com/minerva-cpu/minerva'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth<0.5'
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
  'symbiyosys'
  'yices'
)
provides=("python-minerva=${pkgver}")
conflicts=('python-minerva')

source=(
  "${_gitpkgname}::git+https://github.com/minerva-cpu/minerva.git#commit=${_commit}"
  "pipeline-diagram.png::https://docs.google.com/drawings/d/e/2PACX-1vTMkQc8ZJoiJ2AOeFGMkK0QTNx1hSG5wDrG5seLdJ3i61E4ag7wH7VFey44qhvuXotvOKxOw-mFS-VE/pub?w=850&h=761"
)

sha512sums=(
  '2815e497c0e594ff94e1831e9086bd51f03c87f9e88a9daafcbc7dd6b9cf7e8e095c56aae7a76fab28f86182af70708c751a2d0e9a3d20bb16f022b3cc22ddcc'
  'SKIP'
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
