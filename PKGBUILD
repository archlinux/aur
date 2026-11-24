# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=qslib
_pkgname=qslib
pkgver=0.15.1
pkgrel=1
pkgdesc="Library for communicating with and using the QuantStudio qPCR machine"
arch=('x86_64')
url="https://github.com/cgevans/qslib"
license=('EUPL-1.2')
depends=(
    'gcc-libs'
    'glibc'
    'python'
    'python-attrs'
    'python-click'
    'python-click-aliases'
    'python-dacite'
    'python-markdown'
    'python-matplotlib'
    'python-nest-asyncio'
    'python-numpy'
    'python-pandas'
    'python-pint'
    'python-polars'
    'python-pyarrow'
    'python-tabulate'
    'python-toml'
    'python-typeguard'
    'python-typing_extensions'
)
makedepends=(
    'cargo'
    'mold'
    'python-build'
    'python-installer'
    'python-maturin'
    'python-wheel'
)
checkdepends=(
    'python-hypothesis'
    'python-pytest'
    'python-pytest-asyncio'
)
optdepends=(
    'python-aiohttp: for monitor support'
    'python-matrix-nio: for monitor support'
    'python-influxdb-client: for monitor support'
    'python-lxml: for monitor support'
    'python-altair: for altair plotting support'
    'python-vegafusion: for altair plotting support'
    'python-vl-convert-python: for altair plotting support'
)
options=('!lto' '!debug')
provides=("python-${pkgname}=${pkgver}")
conflicts=("python-${pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/cgevans/qslib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eca7cb5dc9a4ef8e32c1960070363b6f334195673b8b1b761e561faa8af91eb2')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # Fix compatibility with polars >= 2.0 
    sed -i 's/min_periods=self\.min_periods/min_samples=self.min_periods/' python/qslib/processors.py

    local target
    target="$(rustc -vV 2>/dev/null | sed -n 's/host: //p')"
    if [[ -n "$target" ]]; then
        cargo fetch --target "$target"
    else
        cargo fetch
    fi
}

build() {
    cd "${_pkgname}-${pkgver}"
    export CARGO_PROFILE_RELEASE_DEBUG=false
    export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C link-arg=-fuse-ld=mold"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C link-arg=-fuse-ld=mold"
    cargo test --frozen
    python -m venv --system-site-packages --without-pip test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest -k 'not test_real'
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
