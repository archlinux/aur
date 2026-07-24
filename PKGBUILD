# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Levi Zim <rsworktech at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=affine
pkgver=0.27.3
pkgrel=1
pkgdesc='A next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.'
arch=('x86_64')
url='https://affine.pro'
_pkgname=AFFiNE
_nodejs='nvm'
_build_type=stable
_electronversion=39
_nodeversion=22
_ghurl='https://github.com/toeverything/AFFiNE'
license=(
  "custom:${_pkgname}-LICENSE"
  'MIT'
)
provides=(
  "${pkgname}=${pkgver}"
  "${pkgname}-${_build_type}=${pkgver}"
)
conflicts=('affine-bin')
depends=(
  bash
  hicolor-icon-theme
  "electron${_electronversion}"
)
makedepends=(
  "electron$_electronver"
  nvm yarn cargo cmake libgcc glibc git
  git jq zip unzip
)
source=(
  "${_pkgname}-${pkgver}::git+https://github.com/toeverything/AFFiNE#tag=v${pkgver}"
  "${pkgname}.sh"
  "${pkgname}.desktop"
)
sha256sums=('cc6ee4cd1ddd9475b18042c1d4a6ffa72435e3c76307852e388fb77ce5536da4'
            '25363b65c38961d22b1213bed8b8e90b996b7713ab69e4d776a84c1bfe94bf34'
            '18724474ab2351ed00965f9fe9adea04967458dec810866b572cf44ca8185b5b')

options=('strip' '!staticlibs' '!zipman' '!debug' 'buildflags' 'lto')

# Allow using unsupported node.js versions
if [[ -n "$NODEJS" ]]; then
  makedepends[0]="$NODEJS"
fi

_ensure_nodejs() {
  if [[ "$NODEJS" == "nvm" ]]; then
    local NVM_DIR="$_srcdir/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    [[ "$1" == "install" ]] && nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
  fi
}

prepare() {
  local _srcdir="${srcdir}/${_pkgname}-${pkgver}" \
    NODEJS="${_nodejs:-nvm}"

  cd "$_srcdir" || exit 1

  _ensure_nodejs install

  declare -rx HUSKY=0
  declare -rx PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  declare -rx ELECTRON_SKIP_BINARY_DOWNLOAD=1
  declare -rx YARN_NETWORK_CONCURRENCY=100
  declare -rx SENTRYCLI_SKIP_DOWNLOAD=1
  # declare -rx DEBUG='*'

  # mkdir -v ./yarn-cache-nl
  yarn config set nmMode classic
  # yarn config set enableGlobalCache false
  # yarn config set cacheFolder ./yarn-cache-nl
  #yarn config set enableScripts true
  yarn config set nmHoistingLimits none

  #SYSTEM_ELECTRON_VERSION=$(</usr/lib/electron"${_electronversion}"/version)
  # SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
  _electron_pkg_ver="$(jq -r .devDependencies.electron package.json | tr -d '^' | cut -d. -f1)"
  if [[ "$_electronversion" -ne "$_electron_pkg_ver" ]]; then
    echo "Electron version ${_electronversion} does not match ${_electron_pkg_ver} in package.json"
    exit 1
  fi

  # export SYSTEM_ELECTRON_VERSION ELECTRONVERSION=$_electronversion
  sed -i -e "
      s/@electronversion@/$_electronversion/g
      s/@appname@/$pkgname/g
      s/@runname@/app.asar/g
      s/@cfgdirname@/$_pkgname/g
      s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
  " "$srcdir/$pkgname.sh"

  yarn install

}

build() {
  local _srcdir="${srcdir}/${_pkgname}-${pkgver}"
  local x86_64=x64
  cd "$_srcdir" || exit 1

  NODEJS=${_nodejs:-nvm}
  ORIG_CFLAGS=$CFLAGS

  _ensure_nodejs

  # https://github.com/toeverything/AFFiNE/blob/canary/docs/building-desktop-client-app.md
  # https://github.com/toeverything/AFFiNE/blob/canary/.github/actions/setup-version/action.yml
  declare -rx APP_VERSION="$pkgver"
  declare -rx RELEASE_VERSION="$pkgver"
  #declare -rx DEBUG='*'
  #declare -rx DEBUG='affine:*,napi:*'

  ./scripts/set-version.sh $APP_VERSION

  # 0. Build AFFiNE native
  CFLAGS+=' -ffat-lto-objects'
  yarn affine @affine/native build

  # 1. Build the core
  declare -rx BUILD_TYPE="${_build_type}"
  #yarn affine @affine/electron build
  SKIP_NX_CACHE=1 yarn affine @affine/electron generate-assets

  # mkdir -v ./yarn-cache-lw
  # yarn config set cacheFolder ./yarn-cache-lw
  yarn config set nmHoistingLimits workspaces
  # 2. Re-config yarn, clean up the node_modules and reinstall the dependencies
  rm -vrf package-lock.json node_modules
  # find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
  # rm -rf \
  #   "$_srcdir/.cache/yarn" \
  #   "$_srcdir/.npm"
  # yarn add
  # yarn add --dev
  # yarn install --immutable-cache --inline-builds
  yarn install

  # 3. Build the desktop client app installer
  SKIP_WEB_BUILD=1 SKIP_BUNDLE=1 HOIST_NODE_MODULES=1 \
    yarn affine @affine/electron make --platform=linux --arch="${!CARCH}"

  ln -vrsL "./packages/frontend/apps/electron/out/$_build_type" -T ./build
  ln -vrsL "./packages/frontend/apps/electron/resources/icons" -T ./build/icons

  # mkdir ./build
  # unzip -v "./packages/frontend/apps/electron/out/$_build_type/zip/linux/${!CARCH}"/*.zip \
  #   -d ./build/
}

# check() {
#   TODO
# }

package() {
  local _srcdir="${srcdir}/${_pkgname}-${pkgver}"
  local x86_64=x64

  install -vDm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cd "$_srcdir" || exit 1

  install -vDm755 -d \
    "$pkgdir/usr/lib" \
    "$pkgdir/usr/share/metainfo" \
    "$pkgdir/opt/$pkgname/locales" \
    "$pkgdir/opt/$pkgname/resources/app.asar.unpacked/dist"

  (
    cd "build/$_pkgname-linux-${!CARCH}"

    install -vDm644 -t "$pkgdir/opt/$pkgname/locales" ./locales/*.pak
    install -vDm644 -t "$pkgdir/opt/$pkgname/resources" \
      \
      resources/app.asar #resources/$pkgname.metainfo.xml \
    #resources/app-update.yml
    install -vDm644 -t "$pkgdir/opt/$pkgname/resources/app.asar.unpacked/dist" \
      resources/app.asar.unpacked/dist/*

    # find . -depth -maxdepth 1 -type f -exec \
    #   install -vDm644 -t "$pkgdir/opt/$pkgname" {} \+

    install -vDm644 -t "$pkgdir/usr/share/metainfo" \
      resources/*.metainfo.xml

    cd ../icons
    install -vDm644 "./icon.png" \
      "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -vDm644 -t "$pkgdir/opt/$pkgname/icons" ./*

    for icon_size in 64 512; do
      install -vDm644 "./icon_${_build_type}_${icon_size}x${icon_size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
    done
  )

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE-MIT"
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"

  cd "$pkgdir/usr/lib"
  ln -vrLs "$pkgdir/opt/$pkgname/resources" -T $pkgname
  ln -vrLs "$pkgdir/opt/$pkgname/locales" -t $pkgname
  # ln -vrLs "$pkgdir/opt/$pkgname/$_pkgname" -t $pkgname
  # chmod 755 "$pkgdir/opt/$pkgname/$_pkgname"

}
