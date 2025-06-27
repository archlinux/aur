# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ooniprobe-desktop
pkgver=3.10.0
pkgrel=1
_cliver=3.26.0
_nodeversion=18
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://ooni.org"
license=('MIT')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
makedepends=(
  'nvm'
  'yarn'
)
conflicts=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-desktop/archive/refs/tags/v$pkgver.tar.gz"
        "${pkgname%-desktop}-${_cliver}-linux-amd64::https://github.com/ooni/probe-cli/releases/download/v${_cliver}/${pkgname%-desktop}-linux-amd64"
        "$pkgname.desktop"
        'drop-fsevents.patch')
sha256sums=('4446563d217b487f76f3e082b64b90b5a227b16b5d9b73b9d32a1fe3ae504e22'
            '758db091ad0ff8a32a55b04d1c673c865c7a6583599c09b6fea33c6ad3c30d06'
            '77f39a9c8d017b391f61686ac38131a9e31435635de4b72d0f20930165404915'
            'b869d595b6e6100373031c951d976c147050dea02e5683f341711a35f3ffba10')

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
  cd "${pkgname#ooni}-$pkgver"

  # fsevents only for Mac
  patch -Np1 -i ../drop-fsevents.patch


  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  yarn install

  # Place files
  mkdir -p build/probe-cli/linux_amd64
  cp "$srcdir/${pkgname%-desktop}-${_cliver}-linux-amd64" \
    "build/probe-cli/linux_amd64/${pkgname%-desktop}"
  chmod +x "build/probe-cli/linux_amd64/${pkgname%-desktop}"
}

build() {
  cd "${pkgname#ooni}-$pkgver"
  export NODE_OPTIONS=--openssl-legacy-provider
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  _ensure_local_nvm
  yarn next build renderer
  yarn next export renderer
  yarn electron-builder --linux
}

package() {
  cd "${pkgname#ooni}-$pkgver"
  install -d "$pkgdir/opt/OONI Probe"
  cp -a dist/linux-unpacked/* "$pkgdir/opt/OONI Probe/"
  chmod 4755 "$pkgdir/opt/OONI Probe/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/OONI Probe/$pkgname" "$pkgdir/usr/bin/"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  for i in 16 48; do
    install -Dm644 "dist/.icon-set/icon_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  for i in 32 64 128 256 512 1024; do
    install -Dm644 "dist/.icon-set/app_${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
