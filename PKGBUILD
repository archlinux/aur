# Maintainer: Mark Wagie <mark at proton dot me>
pkgname=python-libsass
_name=libsass-python
pkgver=0.23.0
pkgrel=7
pkgdesc="Sass/SCSS for Python"
arch=('x86_64')
url="https://sass.github.io/libsass-python"
license=('MIT')
depends=(
  'glibc'
  'libsass'
  'python'
  'python-setuptools'
)
makedepends=(
  'git'
  'help2man'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-werkzeug'
)
source=("git+https://github.com/sass/libsass-python#tag=$pkgver"
        'pkg_resources.patch')
sha256sums=('b7a61dcc37f9412e5b90b2c73b5e3215bf9d3eb7f490b4d05a0e1276bfc4492f'
            '191256c62920e340d47cab5817f4865eed8f5f6358a24ffff77ec2ad4e758ca9')

prepare() {
  cd "$_name"
  git clean -dfx

  # pkg_resources deprecated with Setuptools 82+
  patch -Np1 -i ../pkg_resources.patch

  # Remove useless shebang as it's installed in site-packages without executable permissions
  sed -r -i '1{/^#!/d}' pysassc.py
}

build() {
  cd "$_name"
  export SYSTEM_SASS=1
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python sasstests.py
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Build the man page in package() rather than build() to use
  # the entry point in $pkgdir/usr/bin/
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/man/man1"
  PYTHONPATH="${pkgdir}${site_packages}" \
    help2man --no-info --output="$pkgdir/usr/share/man/man1/pysassc.1" \
      "$pkgdir/usr/bin/pysassc"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
