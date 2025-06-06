# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: i.further
# Contributor: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

# Checks require additional sources, so they are disabled by default.
_enable_checks=false

pkgname=python-pipenv-git
pkgver=2025.0.3.r0.g218f1a897
pkgrel=1
pkgdesc="Python Development Workflow for Humans."
url="https://pipenv.pypa.io"
arch=('any')
license=('MIT')
depends=('python'
         'python-pip'
         'python-certifi'
         'python-virtualenv')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
conflicts=('python-pipenv')
provides=('python-pipenv')
source=(
  "$pkgname::git+https://github.com/pypa/pipenv.git"
)
sha256sums=('SKIP')

# Checks require additional sources, so they are disabled by default.
if $_enable_checks; then
  checkdepends=('pypiserver'
                'python-click'
                'python-flaky'
                'python-pytest'
                'python-pytest-timeout'
                'python-pytest-xdist')
  source+=("test-submodules/dateutil::git+https://github.com/dateutil/dateutil.git#commit=6618dee970ec1e5f92e0f48ec74584caf13075aa"
           "test-submodules/flask::git+https://github.com/pallets/flask.git#commit=1b4ace9ba5e77679bf9d8e409283654f7589907e"
           "test-submodules/jinja2::git+https://github.com/pallets/jinja.git#commit=a7f1f528f5e77d5401a96aa326885508245f7c6f"
           "test-submodules/pinax::git+https://github.com/pinax/pinax.git#commit=147d854322cc2ab8246b9f52fa3189dfca3cddec"
           "test-submodules/pyinstaller::git+https://github.com/pyinstaller/pyinstaller.git#commit=19d8a378987d6115c0acb72ef954bbf3bca3c61b"
           "test-submodules/pypi::git+https://github.com/sarugaku/pipenv-test-artifacts.git#commit=4ee34a262c487cce1ea5b75f8db25712de02da9f"
           "test-submodules/requests::git+https://github.com/psf/requests.git#commit=4983a9bde39c6320aa4f3e34e50dac6e263dab6f"
           "test-submodules/six::git+https://github.com/benjaminp/six.git#commit=aa4e90bcd7b7bc13a71dfaebcb2021f4caaa8432")
  sha256sums+=('ec81cc8973725ab0605e416d50a6d0dba32d4298253ecdf72f1405677a794f47'
               'f1c1f0a482f23575c9a005321846df8e41b1754ca7386f2cbf14a7735733791f'
               'b4a3889b8cb00cad4f309c243da68f6b4756ff557347048141937a9e996e1439'
               '50d2170ee7adcd7f633ef68453b014ab6bfd80aa7dac9535ed3e4c84c6933836'
               '592a917614e1ae87a204efb9fcb7cc0e2228be27b892e52bbb9de48d0c513804'
               '1a11684307ed4834192bf4d45cfd8f58e1d3e0dc630c716ffbf8ffc8ac4f6de5'
               '812c8af4d8bdc5187a3f56aa1c4b0fc059e790ee7cde53314f95946aa6c1317e'
               '92e9b07175c168a42b1e2195035c5d26a36c295430b57af1f756dfcc26ce8bc2')
fi

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

if $_enable_checks; then
  check(){
    cd "$srcdir/$pkgname"

    git submodule init tests/pypi
    git config submodule.tests/pypi.url "$srcdir/pypi"

    for artifact in dateutil flask jinja2 pinax pyinstaller requests six; do
      git submodule init "tests/test_artifacts/git/$artifact"
      git config "submodule.tests/test_artifacts/git/$artifact.url" "$srcdir/${artifact%-*}"
    done

    git -c protocol.file.allow=always submodule update

    # Find an unused port to run the PyPi server
    PYPI_SERVER_PORT=$(python -c "import socket
with socket.socket() as s:
  s.bind(('', 0))
  print(s.getsockname()[1])")
    pypi-server run --host=0.0.0.0 --port="${PYPI_SERVER_PORT}" --hash-algo=sha256 --disable-fallback tests/pypi tests/fixtures --welcome /dev/null &
    trap "kill $!" INT TERM EXIT

    TMP_DIR=$(mktemp -d)
    trap "rm -r ${TMP_DIR}" INT TERM EXIT

    python -m venv --system-site-packages "${TMP_DIR}/test-env"
    source "${TMP_DIR}/test-env/bin/activate"

    python -m installer dist/*.whl

    export PIPENV_IGNORE_VIRTUALENVS=1
    export PIPENV_PYPI_SERVER="http://localhost:${PYPI_SERVER_PORT}/simple"
    export PIPENV_CACHE_DIR="${TMP_DIR}/cache"
    export WORKON_HOME="${TMP_DIR}/virtualenvs"

    python -m pytest \
      -k 'not needs_internet and not system' \
      --exitfirst \
      --numprocesses auto \
      --override-ini addopts=''
    deactivate
  }
fi

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  _PIPENV_COMPLETE=bash_source python -m pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pipenv"
  _PIPENV_COMPLETE=zsh_source python -m pipenv  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pipenv"
  /usr/bin/env _PIPENV_COMPLETE=fish_source python -m pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pipenv.fish"

  find pipenv -name '*LICENSE*' -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/licenses/${pkgname}" \;
}
