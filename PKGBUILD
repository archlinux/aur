# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client-git'

arch=('x86_64')

pkgver=0.1.4.r66.g5a9fe21
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=1

makedepends=('pnpm-bin' 'nvm' 'cargo' 'git' 'appstream' 'wget' 'webkit2gtk' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')

pkgdesc='A simple and fast mail client (Git version)'

conflicts=('dust-mail-client')
provides=('dust-mail-client')

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("$pkgname::git+https://github.com/Guusvanmeerveld/Dust-Mail.git")

md5sums=('SKIP')
sha256sums=('SKIP')

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

  cd "$srcdir/$pkgname/apps/web/src-tauri"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  pnpm fetch
}

build() {
  _ensure_local_nvm

  cd "$pkgname"

  pnpm install --frozen-lockfile --offline

  cd "apps/web"

  unset SOURCE_DATE_EPOCH

  export RUSTUP_TOOLCHAIN=1.61

  export VITE_UNSTABLE=true

  pnpm run tauri build --verbose
}

package() {
  install -Dm644 "$srcdir/$pkgname/dust-mail.desktop" "$pkgdir/usr/share/applications/dust-mail-client.desktop"
  install -Dm644 "$srcdir/$pkgname/icons/logo-512x512.png" "$pkgdir/usr/share/dust-mail.png"
  install -Dm755 "$srcdir/$pkgname/target/release/dust-mail" "$pkgdir/usr/bin/dust-mail"
}
