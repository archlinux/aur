# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: lsf (https://aur.archlinux.org/account/lsf)
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Steef Hegeman <mail@steefhegeman.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Julian Schacher <jspp@posteo.net>

## On 2026-03-10, taken from the `schildichat-desktop-git` `PKGBUILD` and just renamed it and added the proper `replaces` directives and pinned to specific upstream commits.

_electron="electron38"  # As of 2025-10-22, electron38 actually works.
#_electron="electron39"  # As of 2026-01-10, electron39 does _not_ work.
_nodeversion=25         # As of 2025-05-26, the minimum version of `nodejs` is 22. As of 2026-01-10, version 23 does not work, but 22, 24 and 25 do.
_pkgname="schildichat-desktop"
pkgname="${_pkgname}-eol"
pkgver=1.11.112.sc.0.test.0.r551.20260222.cd6a795
pkgrel=1
pkgdesc="A Matrix client based on Element with a more traditional instant messaging experience. End-of-Life: Latest upstream commit before deprecation/ archival."
arch=(
  "x86_64"
)
url="https://schildi.chat"
license=('Apache-2.0')
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git"
)
provides=(
  "${_pkgname}=${pkgver}"
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
  "imagemagick" # To generate PNG icons from SVG.
  "inkscape" # To generate PNG icons from SVG.
  'pngcrush' # To generate PNG icons from SVG.
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
replaces=(
  "${_pkgname}-git<=1.11.112.sc.0.test.0.r551.20260222.cd6a795" # Upstream has been archived and put End of Life. This `-eol` package here specifically is to serve the last (working) commit and is the replacement for the `-git` variant of `schildichat-desktop`, which is discontinued.
)
source=(
  "${_pkgname}::git+https://github.com/SchildiChat/schildichat-desktop.git#commit=cd6a7958e231bcff5d09dbb8d50d2a5b91535c0f" # #branch=lite
  "git+https://github.com/SchildiChat/compound-web.git#commit=70cc4f218a32186cd3f06b136f5fb223128deafc"
  "git+https://github.com/SchildiChat/matrix-js-sdk.git#commit=4a9006aea68f9d4d7fad3965e754e89b03fb286f"
  "git+https://github.com/SchildiChat/element-web.git#commit=86076c05ce70fdb3705ae01260068be316108711"
  "git+https://github.com/SchildiChat/element-desktop.git#commit=4970f98fa2a99b779238fabb545ef0fd4fca92f9"
  "autolaunch.patch"
  "schildichat-desktop.desktop"
  "schildichat-desktop.sh"
)
sha256sums=(
  '7365ef6ace3392e6e54e7a07e7ceac622bb2a239d0b01a8598625a5bfd668b82'  # schildichat-desktop (git)
  '1bd747510d899a6d1c65f11b486332bd86f32ae18f68ddadd7f06b444b2bdc23'  # compound-web (git)
  '7f8460a9ba00492ede8fd7d16a4117d7231fa49eef5f7431a1625d2600608a18'  # matrix-js-sdk (git)
  '9007c62cf32da575f2fdc45a249818ef71569a3aa8d8d6be3eb733bfab7f058b'  # element-web (git)
  '3784a0882a01a95feeb06b3699aa495831a6986cbedb987e797bc10cbcfbdefa'  # element-desktop (git)
  '7c876d06fd69279441069560699e6dfc91a9434b558279213ababda24e39380b'  # autolaunch.patch
  '6450af411fea039cb76357ff4ea7f1ef336601315de4d27b848a75d7960cef17'  # schildichat-desktop.desktop
  '8084211fe11ba23be956ef4b8bb0fffaa6aaa721b79f9753ecc3574666ef95ce'  # schildichat-desktop.sh
)
#options+=('!lto' 'debug' '!strip')

prepare() {
  cd ${_pkgname}
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  printf '%s\n' " --> Running 'nvm install ${_nodeversion}' ..."
  nvm install "${_nodeversion}"

  printf '%s\n' " --> Running 'git submodule init' ..."
  git submodule init
  printf '%s\n' "     \`-> Configuring 'compound-web' git submodule URL ..."
  git config submodule.compound-web.url     "${srcdir}/compound-web"
  printf '%s\n' "     \`-> Configuring 'matrix-js-sdk' git submodule URL ..."
  git config submodule.matrix-js-sdk.url    "${srcdir}/matrix-js-sdk"
  # printf '%s\n' "     \`-> Configuring 'matrix-react-sdk' git submodule URL ..."
  # git config submodule.matrix-react-sdk.url "${srcdir}/matrix-react-sdk"
  printf '%s\n' "     \`-> Configuring 'element-web' git submodule URL ..."
  git config submodule.element-web.url      "${srcdir}/element-web"
  printf '%s\n' "     \`-> Configuring 'element-desktop' git submodule URL ..."
  git config submodule.element-desktop.url  "${srcdir}/element-desktop"
  printf '%s\n' " --> Running 'git submodule update' ..."
  git -c protocol.file.allow=always submodule update

  printf '%s\n' " --> Specifying electron version in launcher script ..."
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

  printf '%s\n' " --> Generating git log ..."
  git log > git.log

  printf '%s\n' " --> Generating SchildiChat PNG icons from SVG ..."
  ./graphics/icon_gen.sh

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

  # crashes (at least on wayland) when remaining packed. Might be some issue with the webapp.asar location, but inconclusive
  # workaround by extracting app.asar

  install -dvm755 "${pkgdir}"/usr/lib/${_pkgname}/resources/app
  asar e "${pkgdir}"/usr/lib/${_pkgname}/resources/app.asar "${pkgdir}/usr/lib/${_pkgname}/resources/app"
  rm "${pkgdir}/usr/lib/${_pkgname}/resources/app.asar"

  # Required extras
  install -Dvm644 "${srcdir}/schildichat-desktop.desktop" -t "${pkgdir}"/usr/share/applications/
  install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Icons
  install -Dvm0644 graphics/ic_launcher_sc.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

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
