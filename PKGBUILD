# Maintainer: a821 mail de

pkgname=python-mitmproxy-linux-git
pkgver=0.11.4.r2.g07e4935
pkgrel=1
pkgdesc="Redirects traffic to mitmproxy via eBPF"
arch=('x86_64')
url='https://github.com/mitmproxy/mitmproxy_rs'
license=('MIT')
depends=('gcc-libs' 'glibc' 'python')
makedepends=(
  'bpf-linker'
  'cargo-nightly'
  'git'
  'maturin'
  'python-installer'
)
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
  cd mitmproxy_rs/mitmproxy-linux
  export RUSTUP_TOOLCHAIN=nightly
  maturin build --release --strip
}

package() {
  cd mitmproxy_rs
  python -m installer --destdir="${pkgdir}" target/wheels/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
