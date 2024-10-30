# Maintainer: a821 mail de
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs-git
_pyname=mitmproxy_rs
pkgver=0.11.r3.g6028f0b
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
  'cargo'
  'git'
  'maturin'
  'python-installer'
)
conflicts=("${pkgname%-git}")
options=(!lto)
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd mitmproxy_rs/mitmproxy-rs
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd mitmproxy_rs
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/${_site_packages}:${PYTHONPATH}"
  python -c 'import mitmproxy_rs'
}

package() {
  cd mitmproxy_rs
  python -m installer --destdir="${pkgdir}" target/wheels/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd mitmproxy_rs
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

# vim: ts=2 sw=2 et:
