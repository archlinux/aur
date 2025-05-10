# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-oslex
_gitpkgname=oslex
pkgver=0.1.3
pkgrel=1
pkgdesc='OS-independent wrapper for shlex and mslex'
arch=('any')
url='https://github.com/petamas/oslex'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/petamas/oslex/archive/release/v${pkgver}.tar.gz"
)

sha512sums=(
  'c5b463274d5cf0d108fa3592892ba56cccc4d3913726f23db30c744d9001d25c6b7418ab46d6e38000c317ecb4259f142d5019db69f583bc3e6bcb2aa9592e75'
)

build() {
  cd "${_gitpkgname}-release-v${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-release-v${pkgver}"

  eval > actual.txt echo "$(
    python -c 'import oslex; print(oslex.quote("foo; seq 10"))'
  )"
  if ! grep -qF 'foo; seq 10' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}-release-v${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
