# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: i.further
# Contributor: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv-git
pkgver=2022.1.8.r59.g8753ceea
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

  _PIPENV_COMPLETE=bash_source python -m pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pipenv"
  _PIPENV_COMPLETE=zsh_source python -m pipenv  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pipenv"
  /usr/bin/env _PIPENV_COMPLETE=fish_source python -m pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pipenv.fish"

  cd pipenv/vendor
  find -name '*LICENSE' -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/licenses/${pkgname}/vendor/{}" \;
}
