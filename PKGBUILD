# Maintainer: dreieck

_pkgname="python-condconfigparser"
pkgname="${_pkgname}"
pkgdesc="Python library designed to help parsing configuration files. Main specificity: Allows to define conditions using boolean operators and specific sections in the configuration file that are only applied when the corresponding condition is fulfilled."
url="https://frougon.net/projects/CondConfigParser/"
license=("BSD-2-Clause")
epoch=0
pkgver=1.0.6
pkgrel=2
arch=(
  'any'
)
depends=(
  'python>=3.4'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=61.0.0'
  'python-wheel'
)
provides=(
  "python3-condconfigparser=${pkgver}"
)
conflicts=(
  "python3-condconfigparser"
)
optdepends=()
source=(
  "python-CondConfigParser-${pkgver}.tar.gz::https://frougon.net/projects/CondConfigParser/dist/${pkgver}/python3-CondConfigParser-${pkgver}.tar.gz"
  "python-CondConfigParser-${pkgver}.tar.gz.sig::https://frougon.net/projects/CondConfigParser/dist/${pkgver}/python3-CondConfigParser-${pkgver}.tar.gz.asc"
  "workaround_license_double_specification.pyproject-toml.patch::https://github.com/user-attachments/files/19757701/workaround_license_double_specification.pyproject-toml.patch.txt"
)
sha256sums=(
  'ed4f2abd99e190c84d12ebb98d9180b2d97d03e78da3363d3143729aa1e1a862'
  '4901bbaf6a0b0b854232732998ba619957c81a7d2e840978055d39eee5cce849'
  '978b615bb7a5a1b5d19bc021cf6e21030a457c78aa5ca2f06f457174ed7b44da'
)
validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)

prepare() {
  cd "${srcdir}/condconfigparser-${pkgver}"

  for _patch in "${srcdir}/workaround_license_double_specification.pyproject-toml.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/condconfigparser-${pkgver}"
  printf '%s\n' "${url}" > "upstream.url"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/condconfigparser-${pkgver}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  for _docfile in AUTHORS PKG-INFO README.rst INSTALL.txt TODO upstream.url; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _license in COPYING COPYING.Sphinx; do
    install -D -m644 -v "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_license}" "${pkgdir}/usr/share/doc/${_pkgname}/${_license}"
  done
}
