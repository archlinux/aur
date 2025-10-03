

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
makedepends=(rust tar git)
source=("uutils-tar::git+${url}.git")
sha256sums=('SKIP')

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
  install -Dm755 /usr/bin/{backup,restore} -t "$pkgdir"/usr/bin
  install -Dm755 /usr/lib/tar/{backup.sh,dump-remind} -t "$pkgdir"/usr/lib/tar
  conflicts=(tar)
  provides=(tar)
  cd uutils-tar
  install -Dm755 target/release-fast/tarapp "$pkgdir"/usr/bin/tar
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-tar
}
