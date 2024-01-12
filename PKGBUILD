# Maintainer:

## options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="vdhcoapp"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.0.11.r3.gfb9d8d2
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on"
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL-2.0-or-later')
arch=('x86_64')

_main_package() {
  makedepends=(
    'esbuild'
    'jq'
    'yq'

    # AUR
    'nvm'
  )

  options=(!strip emptydirs)
  install="$_pkgname.install"

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _update_version

  _pkgsrc="$_pkgname-${_pkgver:?}"
  _pkgext="tar.gz"
  source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$_pkgver.$_pkgext")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  cd "$_pkgsrc"
  mv -f app/* .

  # create config.json
  tomlq . ./config.toml \
    | jq '.target.os = "linux"' \
    | jq '.target.arch = "amd64"' \
    > src/config.json

  # fix path to config.json
  sed -E -i src/main.js src/native-autoinstall.js \
    -e 's&^(const config = require\('\'')(config.json'\''\);)$&\1./\2&'
}

build() {
  : ${_nodeversion:=18}

  export HOME="$srcdir/node-home"
  export NVM_DIR="${SRCDEST:-${startdir:-$srcdir}}/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

  # build
  cd "$_pkgsrc"

  npm install --no-package-lock --no-audit --no-fund --prefer-offline
  npm install pkg --no-package-lock --no-audit --no-fund --prefer-offline

  local _esbuild_options=(
    src/main.js
    --target=esnext
    "--banner:js=const _importMetaUrl=require('url').pathToFileURL(__filename)"
    "--define:import.meta.url=_importMetaUrl"
    --format=cjs
    --bundle
    --platform=node
    --tree-shaking=true
    --alias:electron=electron2
    --outfile=bundled.js
  )

  esbuild "${_esbuild_options[@]}"

  local _pkg_options=(
    bundled.js
    --target "node$_nodeversion-linux-x64"
    --output vdhcoapp
  )

  ./node_modules/.bin/pkg "${_pkg_options[@]}"
}

package() {
  depends+=('ffmpeg')

  cd "$_pkgsrc"

  install -Dm755 vdhcoapp -t "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/edge/native-messaging-hosts/"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases.atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '"https://.*/releases/tag/.*"' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
