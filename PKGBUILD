# Maintainer: a821 mail de
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-mitmproxy-rs-git
_pyname=mitmproxy_rs
pkgver=0.11.4.r3.g8e09914
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
  'cargo'
  'git'
  'maturin'
  'python-installer'
  'rust-src'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=(!lto)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd mitmproxy_rs
  # git-describe does not work :(
  local _tag=$(git tag -l --sort=-v:refname --merged | head -1)
  local _rev=$(git rev-list --count ${_tag}..HEAD)
  printf "%s.r%s.g%s" ${_tag#v} ${_rev} $(git rev-parse --short HEAD)
}

build() {
  cd mitmproxy_rs/mitmproxy-rs
  maturin build --release --strip
  cd ../mitmproxy-linux
  RUSTC_BOOTSTRAP=1 maturin build --release --strip
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
