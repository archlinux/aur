# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=287.250602.0
pkgrel=1
_emsdk_ver=3.1.59  ## Check ci/containers/linux-build.dockerfile for version
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
#  'emscripten'  ## Fails to build with >=4.0.3
  'git'
  'nvm'
  'python'
)
source=("git+https://github.com/tutao/tutanota.git#tag=$pkgname-release-$pkgver"
        'git+https://github.com/P-H-C/phc-winner-argon2.git'
        'git+https://github.com/open-quantum-safe/liboqs.git'
        'git+https://github.com/emscripten-core/emsdk.git'
        "$pkgname.desktop")
sha256sums=('77e187e4a382a9215d6fccf36355011a01f9e4a7b4105edccd23e0430bd1aa24'
            'SKIP'
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

  "$srcdir/emsdk/emsdk" install "${_emsdk_ver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-*}"
  CFLAGS+=" -ffat-lto-objects"
  export npm_config_cache="$srcdir/npm_cache"
  export RUSTUP_TOOLCHAIN=stable
  _ensure_local_nvm
  "$srcdir/emsdk/emsdk" activate "${_emsdk_ver}"
  source "$srcdir/emsdk/emsdk_env.sh"
  export PATH="${PATH}:$srcdir/emsdk/upstream/bin:/emsdk/upstream/emscripten"
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

  for i in 64 512; do
    install -Dm644 resources/desktop-icons/icon/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
