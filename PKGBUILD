# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgbase=uutils-coreutils-git
pkgname=($pkgbase coreutils-uutils)
pkgver=0.4.0.r191.gb9f97d4
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(gcc-libs glibc oniguruma)
makedepends=(git rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
options=(zipman)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git"
nix-no-unwrap.patch::https://github.com/nix-rust/nix/commit/172e1d94cae6f6a5c5815917b4d0ff5151f71527.patch
nix-rust0.30.1.tar.gz::https://github.com/nix-rust/nix/archive/refs/tags/v0.30.1.tar.gz
)
sha256sums=('SKIP'
            '1ee6ca44c4c4f4f8a0874c6ff09351d48de554b5c29791fd903626523ab31c5c'
            '31742bef74cad04c8bd8c9a7301323e3df35847f5b776024221cbd2060cd5ed7')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  echo -e "[patch.crates-io]\nnix = { path = \"../nix-0.30.1\" }" >> ${pkgname%-git}/Cargo.toml
  cd nix-0.30.1
  git apply -v -p1 ../nix-no-unwrap.patch
}
# Packaging guideline cause double build.
export RUSTONIG_DYNAMIC_LIBONIG=1
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
package_uutils-coreutils-git(){
  cd ${pkgbase%-git}
  unset optdepends
  make install DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release-fast MULTICALL=y LN="ln -f" \
    PROG_PREFIX=uu- LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} LOCALES=n SKIP_UTILS="arch shred shuf factor kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgbase%-git}
}

package_coreutils-uutils(){
  pkgdesc='Use uutils as system coreutils'
  provides=(coreutils)
  conflicts=(coreutils)
  cd ${pkgbase%-git}
  unset optdepends
  # Remove this hack after patch was removed
  depends=(uutils-coreutils)
  install -d "$pkgdir"/usr/{bin,share/{licenses/${pkgname},man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  ln -sf uu-\[ bin/\[ # zsh completion err
  for _f in $("$srcdir"/uutils-coreutils/target/release-fast/coreutils --list | grep -v -E '^(kill|more|uptime|hostname|hashsum|\[)$') ; do
    ln -sf uu-$_f bin/$_f
    ln -sf uu-${_f}.1.gz share/man/man1/${_f}.1.gz
    echo -e "#compdef ${_f}=uu-${_f}\n_uu-${_f}" > share/zsh/site-functions/_$_f
    echo "complete -c ${_f} -w uu-${_f}" > share/fish/vendor_completions.d/${_f}.fish
  done
  ln -sf /usr/share/licenses/uutils-coreutils/LICENSE -t share/licenses/$pkgname
}
