# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.13.0
pkgrel=3
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz"
        Cargo.toml.patch)
sha256sums=('9528a0dedcb9db559c9973001787f474f87559366a2c7a2ff01148c5ab31eac1'
            '7860347baf642380ce26366c94ecff6e31a6b9ee4521740d130e87350dac148d')

prepare() {
  # Enable LTO
  cd "$pkgname-$pkgname-$pkgver"
  patch -p1 < ../Cargo.toml.patch
}

build() {
  cd "$pkgname-$pkgname-$pkgver"

  # Default features are iterm2 terminology and remote_resources. iterm2 is
  # unecessary on Arch, remote_resources brings in a chain of depenedencies
  # reqwest->native-tls->openssl. The version of the openssl crate that is
  # selected does not recognise the version that Arch is using and results in
  # the build failing so this feature is disabled.
  #
  # We dynamically link against the system libonig so that, that dependency is
  # shared with, and kept up to date with the rest of the system. It means
  # this package will need to have the pkgrel bumped if there is a breaking
  # release to libonig though.
  RUSTONIG_DYNAMIC_LIBONIG=1 RUSTONIG_SYSTEM_LIBONIG=1 cargo build \
    --release --no-default-features --features terminology
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
