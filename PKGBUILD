# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=moz-phab
_gitpkgname=review
pkgver=2.5.0
pkgrel=1
pkgdesc='Phabricator review submission/management tool'
arch=('any')
url='https://github.com/mozilla-conduit/review'
license=('MPL-2.0')
depends=(
  'python'
  'python-colorama'
  'python-distro'
  'python-hglib'
  'python-sentry_sdk'
  'python-setuptools'
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'git'
  'hg-evolve'
  'jujutsu'
  'mercurial'
  'python-callee'
  'python-immutabledict'
  'python-pytest'
)
optdepends=(
  'git: support for Git repositories'
  'hg-evolve: support for evolve, a Mercurial extension'
  'jujutsu: support for Jujutsu repositories'
  'mercurial: support for Mercurial repositories'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/mozilla-conduit/review/archive/${pkgver}.tar.gz"
  'disable-auto-update.patch'
  'disable-exception-reporting.patch'
  'disable-telemetry.patch'
)

sha512sums=('4f05960333fe96d9595d7ef4a4b255d3403129ea81608af3078e11399ead7e6a018492b7e2f497ffdca63b843c928e722e6c5d2c6f3b5642d4860ce485d266f4'
            'dd5fd9467261866549596836f72dd7d28519f71bce6e838bb1a0de8f607fa7dd7407abd5ac3a02fd8ab139e8a53affef05a73f8597ba0367be15a4e78811ca54'
            '35087a5d373f7ec1c726204b272454e08b8e43469000eb415f218adeb5606e7f48d603191571f88f23295c15b97275866ac117a5d87d0ea9e7ffefc837fefe43'
            'd8ca129d5441282124599a74e5f0c898d28f4bde574ce0e6c792d492fdcd262c0bb40e3ed79611f603a3dde74fc18659b9b6303abd1022644ebe57031f993ef6')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Do not let the package upgrade itself
  patch -p1 < ../disable-auto-update.patch
  # Do not report exceptions to upstream project by default
  patch -p1 < ../disable-exception-reporting.patch
  # Do not send telemetry
  patch -p1 < ../disable-telemetry.patch
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Running unit tests'
  # Exclude from pytest’s collection all Git/Mercurial integration
  # tests and submission tests, which rely on an unpackaged,
  # unmaintained dependency
  test-env/bin/python -m pytest \
    --ignore=tests/test_integration_git.py \
    --ignore=tests/test_integration_hg.py \
    --ignore=tests/test_submit.py \
    -k 'not test_style and not test_telemetry'

  echo >&2 'Testing the executable'
  test-env/bin/${pkgname} --version > actual.txt
  if ! grep -qF "MozPhab ${pkgver}" actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
