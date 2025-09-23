# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.2.2.r126.g5287738
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(gcc-libs glibc oniguruma)
makedepends=(git rust)
options=(zipman)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git"
"glibc-2.42.patch::https://git.launchpad.net/~juliank/ubuntu/+source/rust-coreutils/plain/debian/patches/glibc-2.42.patch?h=ubuntu/devel&id=a16e77bec0546ee51770a891a24468e8048242e3"
nix-rust0.30.1.tar.gz::https://github.com/nix-rust/nix/archive/refs/tags/v0.30.1.tar.gz
)
sha256sums=('SKIP'
            '3516ae0e2a4fe5fc4996e0f7c9952213f5b7394c739c79f31bafd2ba2a9e2ebb'
            '31742bef74cad04c8bd8c9a7301323e3df35847f5b776024221cbd2060cd5ed7')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}
export RUSTONIG_DYNAMIC_LIBONIG=1
# release-fast has panic=abort
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) -C panic=abort ${RUSTFLAGS}"

prepare(){
  cd ${pkgname%-git}
  rm -rf rust-vendor; mkdir -p rust-vendor
  mv "${srcdir}/nix-0.30.1" rust-vendor/nix
  patch -Np1 -i "${srcdir}/glibc-2.42.patch"
  echo -e "[patch.crates-io]\nnix = { path = \"rust-vendor/nix\" }" >> Cargo.toml
}
# Difficult to land on packaging guideline to avoid double build.
package(){
  cd ${pkgname%-git}
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y \
    PROG_PREFIX=uu- LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="runcon chcon" #arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
}
