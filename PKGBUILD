# Maintainer: arielzn <arielzn at riseup.net>

_name=zensical
pkgname=${_name}
pkgver=0.0.73
pkgrel=1
pkgdesc="A modern static site generator designed to simplify building and maintaining project documentation"
url="https://github.com/zensical/zensical"
arch=('x86_64' 'aarch64')
license=("MIT")
options=('!lto' '!debug')
makedepends=('maturin' 'python-installer' 'cargo')
depends=('python'
         'python-click'
         'python-deepmerge'
         'python-markdown'
	 'python-pandas'
         'python-pygments'
         'python-pymdown-extensions'
	 'python-tabulate'
	 'python-tomli'
         'python-yaml')
optdepends=('mkdocstrings-python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ddeca0695e1015a4fbd09b9a9e50e77a2bb43753bf7479dfb23255f35fd14450')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    # drop the pinned abi3-py311 build ; do it for system python
    sed -i '/features = \["abi3-py311"\]/d' Cargo.toml
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "Cargo.toml"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    maturin build --locked --release --interpreter python3
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  local _test_dir="${srcdir}/test_install"
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  mkdir -p "${_test_dir}"

  for wheel in target/wheels/*.whl; do
    python -m installer --destdir="${_test_dir}" "${wheel}"
  done
  export PYTHONPATH="${_test_dir}${_site_packages}:${PYTHONPATH}"

  python -c 'import zensical'

  rm -rf "$_test_dir"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    for wheel in target/wheels/*.whl; do
      python -m installer --destdir="${pkgdir}" "${wheel}"
    done
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/zensical-*.dist-info/sboms
    sed -i '/sboms\//d' "$pkgdir"/usr/lib/python*/site-packages/zensical-*.dist-info/RECORD
    install -Dm644  LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
