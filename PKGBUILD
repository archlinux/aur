# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgbase='dust-mail-client'
pkgname=('dust-mail-client-git')

pkgver=v0.1.0.r13.gb8fef31

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=1

arch=('x86_64')

makedepends=('nodejs>=16.0.0' 'yarn' 'rustup' 'git' 'appstream')

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("$pkgname::git+https://github.com/Guusvanmeerveld/Dust-Mail.git")

sha512sums=('SKIP')
md5sums=('SKIP')

_prepare_git() {
  rustup default 1.57
}

_build_git() {
  cd "$pkgname/packages/client"

  yarn install --frozen-lockfile

  unset SOURCE_DATE_EPOCH

  export VITE_DEFAULT_SERVER="https://dust-mail.herokuapp.com"

  yarn run tauri build
}

package_dust-mail-client-git() {
  pkgdesc='A simple and fast mail client (Git version)'

  conflicts=('dust-mail-client')
  provides=('dust-mail-client')


  _prepare_git

  _build_git

  cp "$srcdir/$pkgname/packages/client/src-tauri/target/release/bundle/deb/dust-mail-client_0.1.0_amd64/data/usr" "$pkgdir" -r
}
