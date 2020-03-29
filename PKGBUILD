# Maintainer: Ilaï Deutel
# Contributor: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv-git
pkgver=2018.11.26.r690.ga883ef51
pkgrel=1
pkgdesc="Python Development Workflow for Humans."
url="https://pipenv.pypa.io"
arch=('any')
license=('MIT')
depends=('python' 'python-pip' 'python-virtualenv' 'python-setuptools'
         'python-virtualenv-clone' 'python-certifi')
makedepends=('git')
conflicts=('python-pipenv')
provides=('python-pipenv')
# checkdepends=('python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-mock')
source=(
  "$pkgname::git+https://github.com/pypa/pipenv.git"
  # The following sources are used for check()
  # "test-submodules/dateutil::git+https://github.com/dateutil/dateutil.git"
  # "test-submodules/flask::git+https://github.com/pallets/flask.git"
  # "test-submodules/jinja2::git+https://github.com/pallets/jinja.git"
  # "test-submodules/pinax::git+https://github.com/pinax/pinax.git"
  # "test-submodules/pyinstaller::git+https://github.com/pyinstaller/pyinstaller.git"
  # "test-submodules/pypi::git+https://github.com/sarugaku/pipenv-test-artifacts.git"
  # "test-submodules/requests::git+https://github.com/psf/requests.git"
  # "test-submodules/six::git+https://github.com/benjaminp/six.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # The setuptools package removes pkg_resources.extern because "Upstream
  # devendoring logic is badly broken". We use the canonical location instead.
  # Relevant links:
  # https://bugs.archlinux.org/task/58670
  # https://github.com/pypa/pip/issues/5429
  # https://github.com/pypa/setuptools/issues/1383
  # https://github.com/sarugaku/requirementslib/issues/185
  find "$srcdir/$pkgname/pipenv/vendor/requirementslib" -name \*.py \
    -exec sed -i 's/pkg_resources.extern.packaging/packaging/' {} \;
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

# check(){
#   cd "$srcdir/$pkgname/tests"
#
#   git submodule init pypi
#   git config submodule.tests/pypi.url "$srcdir/pypi"
#
#   for artifact in dateutil flask jinja2 pinax pyinstaller requests requests-2.18.4 six six-1.9.0; do
#     git submodule init "test_artifacts/git/$artifact"
#     git config "submodule.tests/test_artifacts/git/$artifact.url" "$srcdir/${artifact%-*}"
#   done
#
#   git submodule update
#
#   python -m venv --system-site-packages --without-pip env
#   env/bin/python ../setup.py install --skip-build
#   (cd pytest-pypi; ../env/bin/python setup.py develop)
#
#   env/bin/python -m pytest -k 'not needs_internet and not system'
# }

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  PIPENV_SHELL=bash python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pipenv"
  PIPENV_SHELL=zsh  python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pipenv"
  PIPENV_SHELL=fish python -m pipenv --completion | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pipenv.fish"

  cd pipenv/vendor
  find -name '*LICENSE' -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/licenses/${pkgname}/vendor/{}" \;
}
