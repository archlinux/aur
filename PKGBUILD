# Maintainer: lsf
# Contributor: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
_pkgname=desktop
pkgver=3.14.1
pkgrel=1
pkgdesc="A standard notes app with an un-standard focus on longevity, portability, and privacy."
arch=('x86_64' 'aarch64')
url="https://standardnotes.org/"
license=('GPL3')
conflicts=('sn-bin')
depends=('electron')
makedepends=('npm' 'node-gyp' 'git' 'jq' 'yarn' 'nvm')
_nodeversion=14
# we need to use a commit directly for 3.14.1, as the tag points to an old/wrong wommit
# source=("git+https://github.com/standardnotes/desktop.git#tag=v${pkgver}"
source=("git+https://github.com/standardnotes/desktop.git#commit=2d58b449b31c48f4ce1f47983434dfcbe58da50a"
        "git+https://github.com/standardnotes/web.git#commit=03f707ee63f0c5bd0c8240011efcce0794eeb851"
        'webpack.patch'
        'standardnotes-desktop.desktop'
        'standardnotes-desktop.js')
sha256sums=('SKIP'
            'SKIP'
            'a0b2b5e95750b5c58fd65bbe7e9797b8560d1fa61b5d0164e160cdd74ecc883d'
            '8045c3baa6a3f5e0a20387913599eafb2d8c6e843745f38f34daea1ab44e73e7'
            '2d90137b689cc38d6c68b17fad2336503846152a0061a91ac2073ea0873a6fc5')

prepare() {
  cd $_pkgname
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install ${_nodeversion}

  git checkout v$pkgver
  git submodule init
  git config submodule.web.url $srcdir/web
  git submodule update

  cp .env.sample .env

  # Set system Electron version for ABI compatibility
  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  # workaround for TS compilation failing due to a "might be null" error.
  # this might be an ugly thing to just ignore, but, well, uh... (electron >=11/12 needs this)
  # patch -Np1 -i ${srcdir}/webpack.patch

  if [[ $CARCH == 'aarch64' ]]; then
    export npm_config_target_arch=arm64
    export npm_config_arch=arm64
    export npm_config_host_arch=arm64
  fi

  yarn --cwd ./web install
  if [[ $CARCH == 'aarch64' ]]; then
    pushd web
    npm rebuild
    popd
  fi
  yarn --cwd ./web run bundle:desktop
  yarn --cwd ./app install
  yarn install
  yarn run webpack --config webpack.prod.js
}

build() {
  cd $srcdir/$_pkgname/
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm use ${_nodeversion}

  if [[ $CARCH == 'aarch64' ]]; then
    export npm_config_target_arch=arm64
    export npm_config_arch=arm64
    export npm_config_host_arch=arm64
  fi

  _electron_dist=/usr/lib/electron
  _electron_ver=$(cat ${_electron_dist}/version)
  case "$CARCH" in
          aarch64)
                  _electronbuilderarch='arm64'
          ;;
          *)
                  _electronbuilderarch='x64'
          ;;
  esac

  yarn run electron-builder --linux --${_electronbuilderrarch} --config.electronDist=${_electron_dist} --config.electronVersion=${_electron_ver} --config.linux.target=dir --publish=never
}


package() {
  function remove_srcdir_ref {
    local tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$1" > "$tmppackage"
    mv "$tmppackage" "$1"
    chmod 644 "$1"
  }

  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/$_pkgname/app $pkgdir/opt/$pkgname/

  # Remove $srcdir references - https://wiki.archlinux.org/index.php/Node.js_package_guidelines
  for i in $(find "$pkgdir" -name package.json); do
    remove_srcdir_ref $i
  done

  install -D -m644 $pkgname.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 $srcdir/$_pkgname/build/icon/Icon-512x512.png "${pkgdir}/usr/share/icons/standard-notes.png"
  install -D -m655 $pkgname.js "${pkgdir}/usr/bin/${pkgname}"
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
