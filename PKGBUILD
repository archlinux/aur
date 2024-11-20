# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=codewars-cli-git
_gitpkgname=codewars-cli
pkgver=r10.4e825fb
pkgrel=1
pkgdesc='Unofficial Codewars CLI by kappq'
arch=('any')
url='https://github.com/kappq/codewars-cli'
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-click'
  'python-cloudscraper'
  'python-rich'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
provides=("codewars-cli=${pkgver}")
conflicts=('codewars-cli')
install="${pkgname}.install"

source=(
  "${_gitpkgname}::git+https://github.com/kappq/codewars-cli.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
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

  echo >&2 'Testing the executable'
  TEST_KATA_ID='54d496788776e49e6b00052f'
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    CW_SESSION_ID='' \
    CW_REMEMBER_USER_TOKEN='' \
    tmp_install/usr/bin/codewars train --language python "${TEST_KATA_ID}" \
    > actual.txt
  if ! grep -qF 'Given an array of positive or negative integers' actual.txt; then
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
    LICENSE
}
