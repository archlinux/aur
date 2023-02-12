# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago França<tfsthiagobr98@outlook.com>
_pkgname=poetry
pkgname=python-${_pkgname}-git
pkgver=1.2.0b1.r82.gedabfce1
pkgrel=1
pkgdesc="Python dependency management and packaging made easy"
arch=(any)
url="https://python-${_pkgname}.org"
license=(MIT)
_deps=(cachecontrol
  cleo
  crashtest
  dulwich
  html5lib
  keyring
  lockfile
  packaging
  pexpect
  pkginfo
  platformdirs
  poetry-core-git
  poetry-plugin-export
  requests
  requests-toolbelt
  shellingham
  tomlkit
  urllib3
  trove-classifiers
  virtualenv) # cachy pyprojects-hook
depends=("${_deps[@]/#/python-}")
makedepends=(python-{build,installer} git)
# checkdepends=(python-httpretty python-pytest python-pytest-mock)
provides=(poetry python-poetry)
conflicts=(poetry python-poetry)
source=(git+https://github.com/python-${_pkgname}/${_pkgname}.git
  poetry-completions-generator)
sha512sums=('SKIP'
  'db6169f5a6ab8c22c1b32ac2bdb7403ead806da70cd851f596049320fffeda26c43e4ae4c5407c5105582b163b5a81ae14d4190fcfa1eb9f25d4e5c5a2dd2cf0')

pkgver() {
  cd ${_pkgname}
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgname}
  python -m build -wn
}

# check() {
#   cd ${_pkgname}
#   pytest \
#     -vv \
#     -k 'not test_execute_executes_a_batch_of_operations' \
#     -k 'not test_default_with_excluded_data ' \
#     -k 'not test_builder_should_execute_build_scripts' \
#     -k 'not test_execute_executes_a_batch_of_operations' \
#     --ignore tests/packages/test_locker.py \
#     --ignore tests/console/commands/test_add.py \
#     --ignore tests/console/commands/test_export.py \
#     --ignore tests/console/commands/test_show.py
# }

package() {
  cd ${_pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  # install completions, which for some crazy reason hardcode the filename
  # used to invoke which is __main__.py if we use python -m poetry, and also
  # adds the full directory path???
  ./poetry-completions-generator completions bash |
    sed "#$srcdir#d" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/poetry"
  ./poetry-completions-generator completions zsh |
    sed "#$srcdir#d" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_poetry"
  ./poetry-completions-generator completions fish |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/poetry.fish"
}
