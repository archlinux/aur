# Maintainer: lsf
# Contributor: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
_pkgname=app
pkgver=3.102.5
pkgrel=1
pkgdesc="A standard notes app with an un-standard focus on longevity, portability, and privacy."
arch=('x86_64' 'aarch64')
url="https://standardnotes.org/"
license=('GPL3')
conflicts=('sn-bin')
depends=('electron' 'libsecret')
makedepends=('npm' 'node-gyp' 'git' 'jq' 'yarn' 'nvm')
source=("git+https://github.com/standardnotes/app.git#tag=@standardnotes/desktop@${pkgver}"
        'webpack.patch'
        'standardnotes-desktop.desktop'
        'standardnotes-desktop.sh')
sha256sums=('SKIP'
            '5627cb64b1f8557d6f9a73030e9cd5164707516fec92b24ded1cff48f23b844d'
            '8008f4fdf47d72c526f1929863f415d343929db47a2d79e34e19fbd6d7021113'
            'ef0561661ae828222c040c023f586c8a072c05e828d14f8886138fe12cdd9455')

prepare() {
  cd $_pkgname
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install # ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  if [[ $CARCH == 'aarch64' ]]; then
    export npm_config_target_arch=arm64
    export npm_config_arch=arm64
    export npm_config_host_arch=arm64
  fi

  cd ${srcdir}/${_pkgname}/packages/desktop

  cp .env.public.production .env

  # Set system Electron version for ABI compatibility
  electronDist="/usr/lib/electron"
  electronVer="$(cat /usr/lib/electron/version)"
  sed -r 's#("electron": ").*"#\1'${electronVer}'"#' -i package.json
  sed -r 's#("electronVersion": ").*"#\1'${electronVer}'"#' -i package.json

  # fix electron-builder complaints
  sed -r 's#("productName": "Standard Notes",)#\1\n  "version": "'${pkgver}'",#' -i app/package.json

  patch -Np1 -i ${srcdir}/webpack.patch

  cd ${srcdir}/${_pkgname}
  yarn install
  yarn build:desktop
}

build() {
  cd $srcdir/$_pkgname/
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm use # ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  if [[ $CARCH == 'aarch64' ]]; then
    export npm_config_target_arch=arm64
    export npm_config_arch=arm64
    export npm_config_host_arch=arm64
  fi

  electronDist="/usr/lib/electron"
  electronVer="$(sed s/^v// /usr/lib/electron/version)"

  case "$CARCH" in
          aarch64)
                  _electronbuilderarch='arm64'
          ;;
          *)
                  _electronbuilderarch='x64'
          ;;
  esac

  cd ${srcdir}/${_pkgname}/packages/desktop

  yarn electron-builder --linux=dir --${_electronbuilderrarch} \
    --dir dist \
    --c.electronDist=${_electronDist} \
    --c.electronVersion=${_electronVer} \
    --c.linux.target=dir \
    --publish=never \
    --c.extraMetadata.version=${pkgver}
}


package() {
  case "$CARCH" in
          aarch64)
                  _unpackedPath='linux-arm64-unpacked'
          ;;
          *)
                  _unpackedPath='linux-unpacked'
          ;;
  esac

  cd ${srcdir}/${_pkgname}/packages/desktop

  install -Dm644 dist/${_unpackedPath}/resources/app.asar -t \
    "$pkgdir/usr/lib/standard-notes/resources/"

  install -D -m644 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 ${srcdir}/$pkgname.sh "${pkgdir}/usr/bin/${pkgname}"

  for icon_size in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 build/icon.iconset/icon_${icon_size}.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}/apps/standard-notes.png"
    install -Dm644 build/icon.iconset/icon_${icon_size}@2x.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}@2x/apps/standard-notes.png"
  done
}

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
