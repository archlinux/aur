# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client-git'

arch=('x86_64')

pkgver=0.1.4.r25.ge1b9dfc
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=1

makedepends=('pnpm-bin' 'nvm' 'cargo' 'git' 'appstream' 'wget')

pkgdesc='A simple and fast mail client (Git version)'

conflicts=('dust-mail-client')
provides=('dust-mail-client')

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("$pkgname::git+https://github.com/Guusvanmeerveld/Dust-Mail.git" "dust-mail.desktop" "dust-mail.png")

md5sums=('SKIP' 'c0038e61dc8df198e6783b26ff966e6c' '1c7baa069d5b6aea65b43e37728abbcd')
sha256sums=('SKIP' '7b7134228e2a4e7451c5615c7dec0f1babd0adfe11d22bde46ea883f5bd9ef44' 'c1ccc31852531ea642e17daa1481cfa65463602f9fd735eabb7abb5ea2674579')

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

  cd "$srcdir/$pkgname/apps/client/src-tauri"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  pnpm fetch
}

build() {
  _ensure_local_nvm

  cd "$pkgname"

  pnpm install --frozen-lockfile --offline

  cd "apps/client"

  unset SOURCE_DATE_EPOCH

  export RUSTUP_TOOLCHAIN=1.61

  export VITE_UNSTABLE=true

  pnpm run tauri build --verbose
}

package() {
  install -Dm644 "$srcdir/dust-mail.desktop" "$pkgdir/usr/share/applications/dust-mail-client.desktop"
  install -Dm644 "$srcdir/dust-mail.png" "$pkgdir/usr/share/dust-mail.png"
  install -Dm755 "$srcdir/$pkgname/apps/client/src-tauri/target/release/dust-mail" "$pkgdir/usr/bin/dust-mail"
}
