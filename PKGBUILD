# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=release-tag
_pkgname=tag
pkgver=0.6.1
pkgrel=1
pkgdesc='Automatically create semantic version git tags.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/tag'
license=('MIT')
makedepends=('rust' 'git')
_commit='05c7b0f4da54388f7d31fe43f2ebe8458bbff3f5'
source=("${_pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "${_pkgname}" || exit

  cargo fetch --locked
}

build() {
  cd "${_pkgname}" || exit

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export TAG_VERSION=$pkgver
  export TAG_COMMIT=$_commit
  cargo build --frozen --release --all-features
}

package() {
  cd "${_pkgname}" || exit

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/${_pkgname}"

  # shell completion
  install -Dm644 <(env PATH="$pkgdir/usr/bin" "${_pkgname}" completion bash) \
    "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 <(env PATH="$pkgdir/usr/bin" "${_pkgname}" completion zsh) \
    "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 <(env PATH="$pkgdir/usr/bin" "${_pkgname}" completion fish) \
    "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
}
