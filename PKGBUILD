
pkgname=ripunzip-git
pkgver=2.0.4.7.g89627f0
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Extract zip files in parallel"
url=https://github.com/GoogleChrome/ripunzip
license=('MIT')
arch=('x86_64')
depends=(bzip2 libgcc glibc xz)
makedepends=(git rust pkgconf)
conflicts=(ripunzip)
provides=(ripunzip)
source=("git+${url}")
b2sums=('SKIP')

prepare(){
  cd ${pkgname%-git}
  sed -i "/^rust-version/d" Cargo.toml
  cargo remove reqwest
  cargo add reqwest --no-default-features --features blocking,rustls
}

build(){
  cd ${pkgname%-git}
  export RUSTFLAGS+=" -C force-unwind-tables=no ${RUSTFLAGS}"
  test ${RUSTC_BOOTSTRAP} = 1 && test -e /usr/lib/rustlib/src/rust/library/Cargo.toml && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags
}

package(){
  unset optdepends
  cd ${pkgname%-git}
  install -Dm755 target/release/${pkgname%-git} -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
