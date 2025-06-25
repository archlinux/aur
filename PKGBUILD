# Maintainer: bakatrouble <bakatrouble@gmail.com>

_pkgname=lstr
pkgname=${_pkgname}-git
_gitname=lstr
pkgver=0.2.1.r77.584fc33
pkgrel=1
pkgdesc='A fast, minimalist directory tree viewer, written in Rust.'
url='https://github.com/bgreenwell/lstr'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('lstr::git+https://github.com/bgreenwell/lstr')
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  _version=$(cat Cargo.toml | grep -e "^version = " | sed -E 's/version = "([0-9\.]+)".*/\1/')
  _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_version}.${_revision}"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $_gitname
    cargo build --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $_gitname
    cargo test --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_gitname/target/release/$_pkgname"
    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
