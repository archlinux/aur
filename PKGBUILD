# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgbase='dust-mail-client'
pkgname=('dust-mail-client-git')

arch=('x86_64')

pkgver=v0.1.0.r15.gcb372f5
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=1

makedepends=('nodejs>=16.0.0' 'yarn' 'cargo' 'git' 'appstream')

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("$pkgname::git+https://github.com/Guusvanmeerveld/Dust-Mail.git")

sha512sums=('SKIP')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname/packages/client/src-tauri"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname/packages/client"

  yarn install --frozen-lockfile

  unset SOURCE_DATE_EPOCH

  export VITE_DEFAULT_SERVER="https://dust-mail.herokuapp.com"

  export RUSTUP_TOOLCHAIN=1.61

  yarn run tauri build
}

package_dust-mail-client-git() {
  pkgdesc='A simple and fast mail client (Git version)'

  conflicts=('dust-mail-client')
  provides=('dust-mail-client')

  cp "$srcdir/$pkgname/packages/client/src-tauri/target/release/bundle/deb/${pkgbase}_0.1.0_amd64/data/usr" "$pkgdir" -r
}
