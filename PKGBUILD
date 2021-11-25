# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.10.3
pkgrel=1
pkgdesc="A tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs')
makedepends=('rust' 'ruby-ronn-ng')
checkdepends=('bash-bats' 'python') # if you hate yourself, add procps-ng + bubblewrap
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5968e063fd7c97bb85cdcdf6fa95146030f6149e6919722f26642187fa6fced52de68615e91a5202d2880357527c517f2711a5e04d00a1908b6081ccf886e47b')
b2sums=('071887a598f0767fdf6b0224800286d75be3ad48b5df57575138c4ff24f05bb68089f7e65c531892589c307c4cb612cc716f6769105793e20b0c92228f3da006')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd "$pkgname-$pkgver"

  cargo build --release --frozen --all-features
}

check() {
  cd "$pkgname-$pkgver"

  # run cargo tests
  cargo test

  # run cli tests
  # ensure recently-built binary is first in $PATH
  PATH="$(pwd)/target/release:$PATH"
  bats ./cli-tests
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  cp -vr doc/* "$pkgdir/usr/share/doc/$pkgname"
  rm -vrf "$pkgdir/usr/share/doc/$pkgname/man"

  # man pages
  OLDIFS="$IFS"
  IFS="."
  cd doc/man
  for filename in *; do
    read -ra PART <<< "$filename"

    title="${PART[0]}"
    section="${PART[1]}"

    # generate man directory if required
    if [ ! -d "$pkgdir/usr/share/man/man${section}" ]; then
      install -vd "$pkgdir/usr/share/man/man${section}"
    fi

    # generate man page
    ronn --roff \
      <"$filename" \
      >"$pkgdir/usr/share/man/man${section}/${title}.${section}"
  done
  IFS="$OLDIFS"
  unset OLDIFS
}
