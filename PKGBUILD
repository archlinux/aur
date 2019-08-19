# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

_pkgname=balena-etcher
pkgname=balena-etcher-git
pkgver=1.5.54.r0.g75be3a37
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily. (git version)'
arch=(x86_64)
url='https://www.balena.io/etcher/'
_github_url='https://github.com/balena-io/etcher'
license=(Apache)
depends=(electron3-bin gtk2 libxtst libxss gconf nss alsa-lib)
makedepends=(npm python2 git jq)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("${pkgname}::git+https://github.com/balena-io/etcher.git"
        'git+https://github.com/balena-io/scripts.git'
        'balena-etcher-electron'
        'balena-etcher-electron.desktop')
sha256sums=('SKIP'
            'SKIP'
            '135ce3deefb9f571b0a28abb7f6c678eea10546a537618b8a69c57012906a0eb'
            '89291532fb6e6c5555b43d61c9ba3df103bca0eace040483884b86fd30dca3e4')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.scripts/resin.url "${srcdir}/scripts"
  git submodule update
}

build() {
  cd "${pkgname}"
  export NPM_VERSION=$(npm --version)
  make electron-develop
  make webpack
  npm prune --production
}

package() {
  cd "${pkgname}"

  _appdir="${pkgdir}"/usr/lib/${_pkgname}
  install -d "${_appdir}"

  install package.json "${_appdir}"
  cp -a {lib,generated,node_modules} "${_appdir}"
  install -D assets/icon.png "${_appdir}"/assets/icon.png
  install -D lib/gui/app/index.html "${_appdir}"/lib/gui/app/index.html

  install -Dm755 "${srcdir}/${_pkgname}-electron" "${pkgdir}/usr/bin/${_pkgname}-electron"
  install -Dm644 "${srcdir}/${_pkgname}-electron.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}-electron.desktop"

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 assets/iconset/${size}.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-electron.png"
  done
}

# vim:set ts=2 sw=2 et:
