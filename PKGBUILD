# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: lsf (https://aur.archlinux.org/account/lsf)
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Steef Hegeman <mail@steefhegeman.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Julian Schacher <jspp@posteo.net>

_electron="electron38"  # As of 2025-10-22, electron38 actually works.
_nodeversion=24         # As of 2025-05-26, the minimum version of `nodejs` is 22. As of 2025-08-11, version 23 does not work, but 22 and 24.
_pkgname="schildichat-desktop"
pkgname="${_pkgname}-git"
pkgver=1.11.112.sc.0.test.0.r547.20250917.4d4dcf1
pkgrel=3
pkgdesc="A Matrix client based on Element with a more traditional instant messaging experience. Build of the latest git checkout."
arch=(
  "x86_64"
)
url="https://schildi.chat"
license=('Apache-2.0')
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-custom=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
makedepends=(
  "npm"
  "git"
  "yarn"
  "python"
  "python-setuptools"
  "rust"
  "tcl"
  # "nodejs>=${_nodeversion}" # Do not use this, since build process downloads and uses a manually specified node version.
  "nvm"
  "libxcrypt-compat"
  "asar"
  'zopfli' # To size-reduce PNG files
)
depends=(
  "gcc-libs"
  "glib2"
  "${_electron}"
  "libsecret"
  "sh"
)
optdepends=(
  "nodejs: For some utilities."
)
source=(
  "${_pkgname}::git+https://github.com/SchildiChat/schildichat-desktop.git#branch=lite"
  "git+https://github.com/SchildiChat/compound-web.git"
  "git+https://github.com/SchildiChat/matrix-js-sdk.git"
  # "git+https://github.com/SchildiChat/matrix-react-sdk.git"
  "git+https://github.com/SchildiChat/element-web.git"
  "git+https://github.com/SchildiChat/element-desktop.git"
  "autolaunch.patch"
  "schildichat-desktop.desktop"
  "schildichat-desktop.sh"
)
sha256sums=(
  'SKIP'  # schildichat-desktop (git)
  'SKIP'  # compound-web (git)
  'SKIP'  # matrix-js-sdk (git)
  # 'SKIP'  # matrix-react-sdk (git)
  'SKIP'  # element-web (git)
  'SKIP'  # element-desktop (git)
  '20533d63ffadf03dbfd173e6d4f1f1048746a628db7b2a70f5bc02390e812302'  # autolaunch.patch
  '6450af411fea039cb76357ff4ea7f1ef336601315de4d27b848a75d7960cef17'  # schildichat-desktop.desktop
  '8084211fe11ba23be956ef4b8bb0fffaa6aaa721b79f9753ecc3574666ef95ce'  # schildichat-desktop.sh
)
#options+=('!lto' 'debug' '!strip')

prepare() {
  cd ${_pkgname}
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  git submodule init
  git config submodule.compound-web.url     "${srcdir}/compound-web"
  git config submodule.matrix-js-sdk.url    "${srcdir}/matrix-js-sdk"
  # git config submodule.matrix-react-sdk.url "${srcdir}/matrix-react-sdk"
  git config submodule.element-web.url      "${srcdir}/element-web"
  git config submodule.element-desktop.url  "${srcdir}/element-desktop"
  git -c protocol.file.allow=always submodule update

  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" "${srcdir}/schildichat-desktop.sh"

  _electron_dist="/usr/lib/${_electron}"
  _electron_ver="$(cat "${_electron_dist}/version")"

  cd element-desktop
  printf '%s\n' " --> Applying patch 'autolaunch.patch' ..."
  patch -Np1 --follow-symlinks -i "${srcdir}/autolaunch.patch"

  printf '%s\n' " --> Doing some fixups with sed in .json files ..."
  sed -i 's|"target": "deb"|"target": "dir"|' package.json
  sed -i "s|\"electronVersion\": \".*\"|\"electronVersion\": \"${_electron_ver}\"|" package.json # removed?
  sed -i "s|\"electron\": \".*\"|\"electron\": \"${_electron_ver}\"|" package.json
  sed -i 's|"https://packages.element.io/desktop/update/"|null|' element.io/release/config.json

  cd ${srcdir}/${_pkgname}

  git log > git.log

  printf '%s\n' " --> Running 'make setup' ..."
  make setup
}

pkgver() {
  cd "${_pkgname}"

  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-(sc)|.\1|' -e 's|-([0-9]+)$|+\1|')"  # <-- get version from git tags. Might be outdated.
  _ver="$(grep -E '^[[:space:]]*"version"[[:space:]]*:' "element-web/package.json" | head -n1 | awk -F: '{print $2}' | awk -F\" '{print $2}' | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-(sc)|.\1|' -e 's|-([0-9]+)$|+\1|')"
  # "element-web/package.json"   # <-- this file to parse the version from.
  # "element-web/webapp/version" # <-- this file might directly contain the version.
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${_pkgname}"
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm use ${_nodeversion}
  export SQLCIPHER_BUNDLED=1
  export CFLAGS+=" -ffat-lto-objects"

  # printf '%s\n' " --> Running 'yarn' ..."
  # yarn --cwd element-desktop run build:64 --linux -c.linux.target=dir -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}
  # let's use the ready-made build script instead - otherwise, we'd have to do a lot more work to get the webapp build etc.

  printf '%s\n' " --> Running 'make pacman' ..."
  make pacman
}

package() {
  cd "${_pkgname}"

  install -dvm755 "${pkgdir}/usr/lib/${_pkgname}"

  cp -rv element-desktop/dist/linux-unpacked/resources{,.pak} "${pkgdir}"/usr/lib/${_pkgname}/
  cp -rv element-desktop/dist/linux-unpacked/locales "${pkgdir}"/usr/lib/${_pkgname}/

  # crashes (at least on wayland) when remaining packed. might be some issue with the webapp.asar location, but inconclusive
  # workaround by extracting app.asar

  install -dvm755 "${pkgdir}"/usr/lib/${_pkgname}/resources/app
  asar e "${pkgdir}"/usr/lib/${_pkgname}/resources/app.asar "${pkgdir}/usr/lib/${_pkgname}/resources/app"
  rm "${pkgdir}/usr/lib/${_pkgname}/resources/app.asar"

  # Required extras
  install -Dvm644 "${srcdir}/schildichat-desktop.desktop" -t "${pkgdir}"/usr/share/applications/
  install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Icons
  zopflipng -m -y element-desktop/build/icon.png element-desktop/build/icon.png
  install -Dvm644 element-desktop/build/icon.png "${pkgdir}"/usr/share/icons/schildichat-desktop.png
  #for i in 16 24 48 64 96 128 256 512; do
  #  install -Dvm644 "element-desktop/build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/schildichat-desktop.png"
  #done

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log RELEASE.md README.md FEATURES.md

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
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
