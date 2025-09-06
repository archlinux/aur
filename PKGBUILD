# Maintainer: oech3
# Contributor: kj_sh604
pkgname=coreutils-uutils
pkgver=0.2.0
pkgrel=1
pkgdesc='(Experimental) Use uutils as system core utilities'
arch=('x86_64')
license=('MIT')
url=https://github.com/uutils/coreutils
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils b3sum) # missing sha3sum binaries
depends=(uutils-coreutils)
#depends=(uutils-coreutils=$pkgver) is useless. Should be managed by maintainer.
makedepends=(rust patch)
source=("${url}/archive/${pkgver}.tar.gz" Cargo.toml
"glibc.patch::https://git.launchpad.net/~juliank/ubuntu/+source/rust-coreutils/plain/debian/patches/glibc-2.42.patch?h=ubuntu/devel&id=a16e77bec0546ee51770a891a24468e8048242e3"
"nix-rust0.30.1.tar.gz::https://github.com/nix-rust/nix/archive/refs/tags/v0.30.1.tar.gz")
sha256sums=('185be1670bb5091f48d29524c6f81326f12aef5e599fcdb122967a95d017f32a'
            '4b8fb5837b66a180e8d6eeef6498539bd426378a94ed068eea597fae63bc2e13'
            '3516ae0e2a4fe5fc4996e0f7c9952213f5b7394c739c79f31bafd2ba2a9e2ebb'
            '31742bef74cad04c8bd8c9a7301323e3df35847f5b776024221cbd2060cd5ed7')

build() {
  cd coreutils-$pkgver
  cat "${srcdir}"/Cargo.toml >> Cargo.toml
  mkdir -p rust-vendor
  rm -rf rust-vendor/nix
  mv "${srcdir}"/nix-0.30.1 rust-vendor/nix
  patch -p1 -i "${srcdir}"/glibc.patch
  cargo build -p uu_stty --release
  #cd src/uu/stdbuf/src/libstdbuf
  #cargo build --release
}

package() {
  cd coreutils-$pkgver
  install -Dm755 target/release/stty "$pkgdir"/usr/bin/stty
  # fail if uu-coreutils binary is renamed in the uutils-coreutils
  /usr/bin/uu-coreutils install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  ln -sf /usr/bin/uu-coreutils bin/\[ # avoid completion err
  # support also -selinux
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname|\[)$') chcon runcon ; do
    ln -sf /usr/bin/uu-coreutils bin/"$f"
    ln -sf /usr/share/man/man1/uu-"$f".1.gz share/man/man1/"$f".1.gz
    echo -e "#compdef ${f}=uu-${f}\n_uu-${f}" > share/zsh/site-functions/_$f
    echo "complete -c ${f} -w uu-${f}" > share/fish/vendor_completions.d/${f}.fish
  done
}
