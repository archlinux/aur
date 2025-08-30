# Maintainer: kj_sh604
# Maintainer: oech3

pkgname=coreutils-uutils
pkgver=0.1.0
pkgrel=5
pkgdesc='Cross-platform Rust rewrite of the GNU coreutils symlinked as system
core utilities (WARNING: use at own risk).'
arch=('x86_64')
license=('MIT')
url=https://github.com/uutils/coreutils
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils b3sum sha3sum)
depends=(uutils-coreutils=${pkgver}) # avoid random version bump
makedepends=(rust-musl make)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')

build() {
  cd coreutils-${pkgver}
  cargo build -p uu_stty --release --target=x86_64-unknown-linux-musl # temporary stty workaround
}

package() {
  cd coreutils-$pkgver
  install -Dm755 target/x86_64-unknown-linux-musl/release/stty "$pkgdir"/usr/bin/stty
  # fail if uu-coreutils binary is renamed in the uutils-coreutils package
  /usr/bin/uu-coreutils install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  cp -sf /usr/bin/uu-coreutils bin/\[ # avoid completion err
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname|\[)$')  chcon runcon ; do
    ln -sf /usr/bin/uu-coreutils bin/"$f"
    ln -sf /usr/share/man/man1/uu-"$f".1.gz share/man/man1/"$f".1.gz
    echo -e "#compdef ${f}=uu-${f}\n_uu-${f}" > share/zsh/site-functions/_$f
    echo "complete -c ${f} -w uu-${f}" > share/fish/vendor_completions.d/${f}.fish
  done
}

# vim: ts=2 sw=2 et:
