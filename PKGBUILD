# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=259.250108.1
pkgrel=1
pkgdesc="The desktop client for Tutanota, the secure e-mail service."
arch=('x86_64')
url="https://tuta.com/secure-email"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libsecret'
  'nss'
)
makedepends=(
  'cargo'
  'emscripten'
  'git'
  'nvm'
  'python'
)
source=("git+https://github.com/tutao/tutanota.git#tag=$pkgname-release-$pkgver"
        'git+https://github.com/P-H-C/phc-winner-argon2.git'
        'git+https://github.com/open-quantum-safe/liboqs.git'
        "$pkgname.desktop")
sha256sums=('be71c1f1bf66505037d57753be233917d8a80375c4592896f7010d9c95b2aa6a'
            'SKIP'
            'SKIP'
            'd6fef99f41fe18008e44b5930aee26dc2f79ef753d770cbdb946d9e17ac9b7d7')

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
  cd "${pkgname%-*}"
  git submodule init
  git config submodule.libs/webassembly/phc-winner-argon2.url "$srcdir/phc-winner-argon2"
  git config submodule.libs/webassembly/liboqs.url "$srcdir/liboqs"
  git -c protocol.file.allow=always submodule update

  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install
  npm ci

  export RUSTUP_TOOLCHAIN=stable
  for dir in packages/node-mimimi tuta-sdk/rust tuta-sdk/rust/sdk tuta-sdk/rust/uniffi-bindgen; do
    pushd "${dir}"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
    popd
  done
}

build() {
  cd "${pkgname%-*}"
  CFLAGS+=" -ffat-lto-objects"
  export npm_config_cache="$srcdir/npm_cache"
  export RUSTUP_TOOLCHAIN=stable
  _ensure_local_nvm
  npm run build-packages
  node desktop --custom-desktop-release --unpacked
}

package() {
  cd "${pkgname%-*}"
  install -d "$pkgdir/opt/$pkgname/"
  cp -av artifacts/desktop/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 resources/desktop-icons/logo-solo-red.png.iconset/icon_${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
    install -Dm644 resources/desktop-icons/logo-solo-red.png.iconset/icon_${i}x${i}@2x.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}@2x/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
