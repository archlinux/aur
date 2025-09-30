

pkgname=uutils-tar-git
pkgver=0.0.1.g
#pkgver() {
  # echo $pkgver
#}
pkgrel=1
pkgdesc="Rust implementation of tar"
arch=('x86_64')
url="https://github.com/uutils/tar"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust git)
conflicts=(tar)
provides=(tar)
source=("uutils-tar::git+${url}.git"
"tar-script.tar.zst::https://archlinux.org/packages/core/x86_64/tar/download/")
sha256sums=('SKIP' 'SKIP')

#prepare(){
#  cd utils-tar
#  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
#}

build(){
  cd uutils-tar
  export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) ${RUSTFLAGS}"
  cargo build --profile=release-fast
}

package() {
  rm -rf usr/{bin/tar,lib/tar/rmt,share}
  cp -r usr "$pkgdir"/usr
  cd uutils-tar
  install -Dvm755 target/release-fast/tarapp "$pkgdir"/usr/bin/tar
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-tar
}
