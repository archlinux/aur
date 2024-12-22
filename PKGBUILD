# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-jtagtap-git
_gitpkgname=jtagtap
pkgver=r4.851b71b
pkgrel=2
pkgdesc='Simple JTAG TAP described in plain Python using the nMigen/Amaranth toolbox'
arch=('any')
url='https://github.com/lambdaconcept/jtagtap'
license=('BSD-2-Clause')
depends=(
  'python'
  'python-amaranth<0.5'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("python-jtagtap=${pkgver}")
conflicts=('python-jtagtap')

source=(
  "${_gitpkgname}::git+https://github.com/lambdaconcept/jtagtap.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitpkgname}"

  echo >&2 'Applying compatibility fixes for python-amaranth'
  sed -i -e 's/nmigen/amaranth/' jtagtap/tap.py
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}"
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl

  echo >&2 'Testing the package'
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" python -c \
    'from jtagtap import tap; print("\n".join(tap.__all__))' \
    > actual.txt
  if ! grep -qF 'JTAGTap' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
