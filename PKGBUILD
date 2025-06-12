# Maintainer: Ladas552 <l.tokshalov@gmail.com>
pkgbase="norgolith-git"
pkgname=('norgolith-git')
_pkgname=norgolith
pkgver=r295.ca23762
pkgrel=1
pkgdesc="The monolithic Norg static site generator built with Rust"
arch=(x86_64 aarch64)
url="https://github.com/NTBBloodbath/norgolith"
license=('GPL-2.0-only')
makedepends=(git cargo openssl libgit2 libssh2 zlib pkg-config)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

_depends=(glibc gcc-libs openssl libgit2 libssh2 zlib)
options=(!debug !lto)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --manifest-path=$_pkgname/Cargo.toml --target-dir=$_pkgname/target
}

_package() {
  install -Dm755 "$_pkgname/target/release/lith" -t "$pkgdir/usr/bin"
}

package_norgolith-git() {
  depends=("${_depends[@]}")
  provides=("norgolith")

  _package
  install -Dm644 "$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/norgolith/LICENSE"
}
