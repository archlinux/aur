# Maintainer: a821 mail de
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs-git
_pyname=mitmproxy_rs
pkgver=0.12.6.r2.g25a0851
pkgrel=1
pkgdesc="Python bindings for mitmproxy's Rust code"
arch=('x86_64')
url='https://github.com/mitmproxy/mitmproxy_rs'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
makedepends=(
  'bpf-linker'
  'cargo-nightly'
  'git'
  'maturin'
  'python-installer'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=(!lto)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd mitmproxy_rs
  git describe --long --tags --match='v*.*.*' | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=nightly
  rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
}

build() {
  export RUSTUP_TOOLCHAIN=nightly
  cd mitmproxy_rs/mitmproxy-rs
  maturin build --release --strip
  cd ../mitmproxy-linux
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd mitmproxy_rs
  for wheel in target/wheels/*.whl ; do
    python -m installer --destdir=test_dir "$wheel"
  done
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import mitmproxy_rs'
}

package() {
  cd mitmproxy_rs
  for wheel in target/wheels/*.whl ; do
    python -m installer --destdir="${pkgdir}" "$wheel"
  done
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
