# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname=('dust-mail-client-git')

arch=('x86_64')

pkgver=0.1.4.r2.gef28602
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=1

makedepends=('yarn' 'nvm' 'cargo' 'git' 'appstream')

pkgdesc='A simple and fast mail client (Git version)'

conflicts=('dust-mail-client')
provides=('dust-mail-client')

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("$pkgname::git+https://github.com/Guusvanmeerveld/Dust-Mail.git" "dust-mail.desktop" "dust-mail.png")

md5sums=('SKIP' '225f3614b306b30c1bf515ee42c68109' '1c7baa069d5b6aea65b43e37728abbcd')
sha256sums=('SKIP' 'SKIP' 'SKIP')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  nvm install 16

  cd "$srcdir/$pkgname/packages/client/src-tauri"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  _ensure_local_nvm

  cd "$pkgname/packages/client"

  yarn install --frozen-lockfile

  unset SOURCE_DATE_EPOCH

  export RUSTUP_TOOLCHAIN=1.61

  export VITE_UNSTABLE=true

  yarn run tauri build --verbose
}

package() {
  install -Dm644 "$srcdir/dust-mail.desktop" "$pkgdir/usr/share/applications/dust-mail-client.desktop"
  install -Dm644 "$srcdir/dust-mail.png" "$pkgdir/usr/share/dust-mail.png"
  install -Dm755 "$srcdir/$pkgname/packages/client/src-tauri/target/release/dust-mail" "$pkgdir/usr/bin/dust-mail"
}
