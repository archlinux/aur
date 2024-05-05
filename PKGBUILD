# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-rss-git
_pkgname=mdbook-rss
pkgver=8.dc948c6
pkgrel=3
pkgdesc="A preprocessor for mdbook to generate an RSS feed from your chapters"
url="https://gitlab.com/albalitz/mdbook-rss"
arch=('x86_64')
license=('MPL-2.0')
makedepends=(
  'cargo'
  'git'
)
depends=(
  'mdbook'
)
source=(
  "git+${url}.git"
  'mdbook-rss.patch'
)
sha256sums=(
  'SKIP'
  'b644bfb8e6b1efb5f0f2bb314b629d7c2079503b2677a9130ee1a116134077a2'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
pkgver() {
  cd "${srcdir}/${_pkgname}"
  version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
  echo "${version:1}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  patch --forward --strip=1 --input="${srcdir}/mdbook-rss.patch"
}

check() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  #cargo test --frozen --all-features
  cargo test --all-features
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  #cargo build --frozen --release --all-features
  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

