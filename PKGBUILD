# Maintainer: arielzn <arielzn at riseup.net>

_name=zensical
pkgname=${_name}
pkgver=0.0.20
pkgrel=1
pkgdesc="A modern static site generator designed to simplify building and maintaining project documentation"
url="https://github.com/zensical/zensical"
arch=('x86_64' 'aarch64')
license=("MIT")
options=('!strip')
makedepends=('python-setuptools' 'maturin' 'python-build' 'python-installer' 'cargo' 'python-pymdown-extensions')
depends=('python' 'python-deepmerge')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
noextract=()
sha256sums=(95e9e974a68b4eea96a365b3547f399ad22f6906848796e5667288c14bb62549)

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "Cargo.toml"
}

build() {
    local machine="$(rustc -vV | sed -n 's/host: //p')"
    cd "${srcdir}/${_name}-${pkgver}"
    maturin build --locked --release --target "$machine" --strip --compatibility linux
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_name}-${pkgver}"
  for wheel in target/wheels/*.whl; do
    python -m installer --destdir=test_dir "${wheel}"
  done
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import zensical'
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    for wheel in target/wheels/*.whl; do
      python -m installer --destdir="${pkgdir}" "${wheel}"
    done
    install -Dm644  LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
