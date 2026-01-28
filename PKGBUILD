# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vmlinux-to-elf"
pkgver=1.0.0
pkgrel=1
pkgdesc="Recover a fully analyzable .ELF from a raw kernel, through extracting the kernel symbol table (kallsyms)"
arch=(
  'any'
)
url="https://github.com/marin-m/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'python>=3.9'
  'python-lz4>=4.4.5'
  'python-minilzo>=1.2'
  'python-zstandard>=0.25.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
options=(
  '!strip'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('40a73f683a3f45b6b617716e1d2bffd26fc60c0e654bf458b3c057633cb673d0')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-1.0.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
