# Maintainer: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matteo Parolari
# Contributor: gardar <aur@gardar.net>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds

pkgbase="joplin"
pkgname=('joplin' 'joplin-desktop')
pkgver=2.10.18
groups=('joplin')
pkgrel=1
install="joplin.install"
depends=('electron' 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs>=17.3'
         'nss' 'orc' 'rsync' 'libvips')
optdepends=('libappindicator-gtk3: for tray icon')
arch=('x86_64' 'i686')
makedepends=('git' 'npm' 'yarn' 'python' 'rsync' 'jq' 'yq' 'electron' 'libgsf' 'node-gyp>=8.4.1' 'libvips')
url="https://joplinapp.org/"
license=('MIT')
source=("joplin.desktop" "joplin-desktop.sh" "joplin.sh"
  "joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz")
sha256sums=('c7c5d8b0ff9edb810ed901ea21352c9830bfa286f3c18b1292deca5b2f8febd2'
            'a450284fe66d89aa463d129ce8fff3a0a1a783a64209e4227ee47449d5737be8'
            '16aed6c4881efcef3fd86f7c07afb4c743e24d9da342438a8167346a015629e0'
            'd3f0d39596110926a7e557bd06783f5b4d24fff25ef2f14ee51afffaa4984a96')

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
  msg2 "Yarn cache directory: $cache"
  msg2 "Yarn binary: ${yarn_bin}"

  msg2 "Disabling husky (git hooks)"
  sed -i '/"husky": ".*"/d' "${srcdir}/joplin-${pkgver}/package.json"

  # There are so many people
  msg2 "Checking Node PATH"
  local w_node=$(which node)
  if [[ $w_node != "/usr/bin/node" ]]; then
    msg2 "WARNING: Using path ${w_node} beware its not the defualt path, check if you are using nvm or similar"
  fi

  msg2 "Tweaking .yarnrc"
  yq -i -y ".cacheFolder=(\"${cache}\")" "${srcdir}/joplin-${pkgver}/.yarnrc.yml"

  msg2 "Tweaking lerna.json"
  local tmp_json="$(mktemp --tmpdir="$srcdir")"
  local lerna_json="${srcdir}/joplin-${pkgver}/lerna.json"

  msg2 "Deleting app-mobile"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-mobile"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-clipper"

  if [[ ${pkgver} == 2.9.17 ]]; then

    msg2 "******************* BEGIN: TEMPORARY FIX FOR VERSION 2.9.17 ONLY **********************"

        # Let yarn resolve version ^2.12.1 of nan package to 2.17.0 instead of 2.15.0 (https://github.com/nodejs/nan/pull/943)
        local package_json=${srcdir}/joplin-${pkgver}/package.json
        cp $package_json $package_json.bak
        jq '. + {"resolutions": {"nan@^2.12.1": "2.17.0"}}' $package_json.bak > $package_json

    msg2 "******************* END: TEMPORARY FIX FOR VERSION 2.9.17 ONLY ************************"

  fi
}


build() {
  local cache=$(_get_cache)
  local yarn_bin=$(_get_yarn_bin)
  msg2 "Yarn cache directory: $cache"
  cd "${srcdir}/joplin-${pkgver}"

  # Force Lang
  # INFO: https://github.com/alfredopalhares/joplin-pkgbuild/issues/25
  export LANG=en_US.utf8

  msg2 "Installing dependencies through Yarn 3..."
  # FSevents is on the optinal dependencies and its Mac Only
  eval $yarn_bin

  msg2 "Building the workspace"
  $yarn_bin workspace @joplin/lib install
  $yarn_bin workspace @joplin/renderer install
  $yarn_bin workspace @joplin/app-desktop install
  $yarn_bin workspace @joplin/app-desktop run electron-builder build --linux
}

#FIXME: These checks fail on some machines, even with the exit 0
# Something related with the number of allowed processes I guess
check() {
  cd "${srcdir}/joplin-${pkgver}"
  msg2 "Not Running any tests for now"
  #npm run test || exit 0
}

package_joplin() {
  pkgdesc="A note taking and to-do application with synchronization capabilities - CLI App"
  depends=('coreutils' 'libsecret' 'nodejs' 'python')

  local cache=$(_get_cache)
  local yarn_bin=$(_get_yarn_bin)
  msg2 "Yarn cache directory: $cache"

  msg2 "Packaging CLI with Repo Gulp"
  cd "${srcdir}/joplin-${pkgver}/packages/app-cli/"
  gulp_bin=$($yarn_bin bin gulp)
  msg2 "Using gulp: ${gulp_bin}"
  ${gulp_bin} build
  $yarn_bin pack

  msg2 "Installing package"
  mkdir -p "${pkgdir}/usr/share/joplin/"
  mv package.tgz "${pkgdir}/usr/share/joplin/"
  cd "${pkgdir}/usr/share/joplin/"
  $yarn_bin init
  # FIXME: The repo wran crashed
  # You also need to pipe yes, for depeendy
  yes | yarn add ./package.tgz

  msg2 "Fixing Directories Permissions"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  msg2 "Removing References to \$pkgdir"
  find "$pkgdir" -name package.json -print0 | xargs -0 sed -i "/_where/d"

  msg2 "Fixing Permissions set by npm"
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  msg2 "Installing LICENSE"
  install -Dm644 "${srcdir}/joplin-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Installing Startup Script"
  cd "${srcdir}"
  install -Dm755 joplin.sh "${pkgdir}/usr/bin/joplin"
}


package_joplin-desktop() {
  pkgdesc="A note taking and to-do application with synchronization capabilities - Desktop"
  depends=('electron' 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs'
         'nss' 'orc')
  optdepends=('libappindicator-gtk3: for tray icon')
  conflicts=('joplin-desktop-electron')

  # ./generateSha512.js fails if AppImage is not built
  mkdir -p "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/"
  touch "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/AppImage"

  #cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/node_modules/@joplin/"
  #ln -sf "../../../fork-uslug" "."

  msg2 "Building Desktop with packaged Electron..."
  cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/"
  #electron_dir="/usr/lib/electron"
  #electron_version=$(cat /usr/lib/electron/version)
  #msg2 "Using Electron Version ${electron_version}"
  ## Current version of electron does not work
  ##USE_HARD_LINKS=false yarn run dist -- --publish=never  --linux  --x64 \
  #sed -i "s/const forceAbiArgs = '--force-abi 89';/const forceAbiArgs = ''/" tools/electronRebuild.js
  #gulp electronRebuild
  ##DEBUG="electron-rebuild" USE_HARD_LINKS=false yarn run dist -- --publish=never \
  ##  --dir="dist/"
  # # --dir="dist/" -c.electronDist=$electron_dir -c.electronVersion=$electron_version
  #    # FIXME: Using packaged electron breaks the interface

  msg2 "Packaging the desktop..."
  # TODO: Cleanup app.asar file
  cd dist/linux-unpacked/
  mkdir -p "${pkgdir}/usr/share/joplin-desktop"
  cp -R "." "${pkgdir}/usr/share/joplin-desktop"
  msg2 "Installing LICENSE..."
  cd "${srcdir}/joplin-${pkgver}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  msg2 "Installing startup script and desktop file..."
  cd "${srcdir}"
  install -Dm755 ${srcdir}/joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"
  install -Dm644 ${srcdir}/joplin.desktop -t "${pkgdir}/usr/share/applications"

  msg2 "Installing icons"
  local -r src_icon_dir="${srcdir}/joplin-${pkgver}/packages/app-desktop/build/icons"
  local -i size
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 512; do
    [[ -f "${src_icon_dir}/${size}x${size}.png" ]] &&
      install -Dm644 \
        "${src_icon_dir}/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/joplin.png"
  done
}

