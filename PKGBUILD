# Maintainer: JinguTech <xiuluo dot android at gmail dot com>
# Contributor: Alkindi42
pkgname=joplin-beta
pkgver=2.12.18
pkgrel=1
pkgdesc="The latest pre-release - open source note taking and to-do application"
arch=('x86_64')
depends=('electron' 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs>=17.3'
         'nss' 'orc' 'rsync' 'libvips')
optdepends=('libappindicator-gtk3: for tray icon')
makedepends=('git' 'npm' 'yarn' 'python' 'jq' 'yq' 'node-gyp>=8.4.1')
source=(
  "${pkgname%-*}-desktop.sh" "${pkgname%-*}.sh" "${pkgname%-*}.desktop"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/refs/tags/v${pkgver}.tar.gz"
  
)
conflicts=('joplin' 'joplin-desktop' 'joplin-appimage')
url="https://joplinapp.org"
license=('MIT')

sha256sums=('18cca699f52f884980646359631bb59a77d190b9f91e9e3e71efa62166772557'
            'b5c621c425cdf0b5bb07bf0353939f6991a18db81955294a47ec42d0c5593438'
            'b46dd772eb1adf9327f6c07657acf3c627c6ea204f8de3a4481efa6db0071f5e'
            'a85f2133e5b71d829fbc9438d2e3191172f8af2e270906745203a8fa36aac307')


# local npm cache directory
_yarn_cache="yarn-cache"

## Sets up a local cache to prevent the redownloding the packages on rebuilds
_get_cache() {
  if [[ "${_yarn_cache}" =~ ^/ ]]; then
    printf "%s" "${_yarn_cache}"
  else
    printf "%s" "${srcdir}/${_yarn_cache}"
  fi
}

_get_yarn_bin() {
  local yarn_bin=$(yq ".yarnPath" ${srcdir}/joplin-${pkgver}/.yarnrc.yml)
  #Remove quotes
  yarn_bin="${yarn_bin%\"}"
  yarn_bin="${yarn_bin#\"}"
  printf "%s" "${srcdir}/joplin-${pkgver}/${yarn_bin}"
}

prepare() {
  local cache=$(_get_cache)
  local yarn_bin=$(_get_yarn_bin)
  echo "Yarn cache directory: $cache"
  echo "Yarn binary: ${yarn_bin}"

  echo "Disabling husky (git hooks)"
  sed -i '/"husky": ".*"/d' "${srcdir}/joplin-${pkgver}/package.json"

  # There are so many people
  echo "Checking Node PATH"
  local w_node=$(which node)
  if [[ $w_node != "/usr/bin/node" ]]; then
    echo "WARNING: Using path ${w_node} beware its not the defualt path, check if you are using nvm or similar"
  fi

  echo "Tweaking .yarnrc"
  yq -i -y ".cacheFolder=(\"${cache}\")" "${srcdir}/joplin-${pkgver}/.yarnrc.yml"

  echo "Tweaking lerna.json"
  local tmp_json="$(mktemp --tmpdir="$srcdir")"
  local lerna_json="${srcdir}/joplin-${pkgver}/lerna.json"

  echo "Deleting app-mobile"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-mobile"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-clipper"
}

build() {
  local cache=$(_get_cache)
  local yarn_bin=$(_get_yarn_bin)
  echo "Yarn cache directory: $cache"
  cd "${srcdir}/joplin-${pkgver}"

  # Force Lang
  # INFO: https://github.com/alfredopalhares/joplin-pkgbuild/issues/25
  export LANG=en_US.utf8

  echo "Installing dependencies through Yarn 3..."
  # FSevents is on the optinal dependencies and its Mac Only
  eval $yarn_bin

  echo "Building the workspace"
  $yarn_bin workspace @joplin/lib install
  $yarn_bin workspace @joplin/renderer install
  $yarn_bin workspace @joplin/app-desktop install
  $yarn_bin workspace @joplin/app-desktop run electron-builder build --linux
}

#FIXME: These checks fail on some machines, even with the exit 0
# Something related with the number of allowed processes I guess
check() {
  cd "${srcdir}/joplin-${pkgver}"
  echo "Not Running any tests for now"
  #npm run test || exit 0
}


package() {

  # ./generateSha512.js fails if AppImage is not built
  mkdir -p "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/"
  touch "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/AppImage"

  #cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/node_modules/@joplin/"
  #ln -sf "../../../fork-uslug" "."

  echo "Building Desktop with packaged Electron..."
  cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/"
  #electron_dir="/usr/lib/electron"
  #electron_version=$(cat /usr/lib/electron/version)
  #echo "Using Electron Version ${electron_version}"
  ## Current version of electron does not work
  ##USE_HARD_LINKS=false yarn run dist -- --publish=never  --linux  --x64 \
  #sed -i "s/const forceAbiArgs = '--force-abi 89';/const forceAbiArgs = ''/" tools/electronRebuild.js
  #gulp electronRebuild
  ##DEBUG="electron-rebuild" USE_HARD_LINKS=false yarn run dist -- --publish=never \
  ##  --dir="dist/"
  # # --dir="dist/" -c.electronDist=$electron_dir -c.electronVersion=$electron_version
  #    # FIXME: Using packaged electron breaks the interface

  echo "Packaging the desktop..."
  # TODO: Cleanup app.asar file
  cd dist/linux-unpacked/
  mkdir -p "${pkgdir}/usr/share/joplin"
  cp -R "." "${pkgdir}/usr/share/joplin"
  echo "Installing LICENSE..."
  cd "${srcdir}/joplin-${pkgver}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  echo "Installing startup script and desktop file..."
  cd "${srcdir}"
  install -Dm755 ${srcdir}/joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"
  install -Dm644 ${srcdir}/joplin.desktop -t "${pkgdir}/usr/share/applications"

  echo "Installing icons"
  local -r src_icon_dir="${srcdir}/joplin-${pkgver}/packages/app-desktop/build/icons"
  local -i size
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 512; do
    [[ -f "${src_icon_dir}/${size}x${size}.png" ]] &&
      install -Dm644 \
        "${src_icon_dir}/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/joplin.png"
  done
}
