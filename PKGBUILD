# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher
pkgver=1.5.47
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=(x86_64)
url='https://etcher.io'
_github_url='https://github.com/balena-io/etcher'
license=(Apache)
depends=(electron gtk2 libxtst libxss gconf nss alsa-lib)
makedepends=(npm python2 git jq)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
options=('!strip')
source=("${pkgname}::git+https://github.com/balena-io/${pkgname}.git#tag=v${pkgver}"
        'git+https://github.com/balena-io/scripts.git'
        'etcher-electron'
        'etcher-electron.desktop'
        'use-electron-4.1.5.patch')
sha256sums=('SKIP'
            'SKIP'
            '4499f316e4de865696312b31545f8df62850aad4492bcc9736cccb6d8eeb96ec'
            '89291532fb6e6c5555b43d61c9ba3df103bca0eace040483884b86fd30dca3e4'
            '488e2ebce14bb9a8caaa1e9aaa73ee22c1c3eaa68c110d355bd588b37023f002')
conflicts=("balena-${pkgname}"
  "${pkgname}-git"
  "${pkgname}-bin"
)

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.scripts/resin.url "${srcdir}/scripts"
  git submodule update
}

build() {
  cd "${pkgname}"
  git apply -v "${srcdir}/use-electron-4.1.5.patch"
  export NPM_VERSION=$(npm --version)
  make electron-develop || /bin/true
  make webpack
  npm prune --production
}

package() {
  cd "${pkgname}"

  _appdir="${pkgdir}"/usr/lib/${pkgname}
  install -d "${_appdir}"

  install package.json "${_appdir}"
  cp -a {lib,generated,node_modules} "${_appdir}"
  install -D assets/icon.png "${_appdir}"/assets/icon.png
  install -D lib/gui/app/index.html "${_appdir}"/lib/gui/app/index.html

  install -Dm755 "${srcdir}"/etcher-electron "${pkgdir}"/usr/bin/etcher-electron
  install -Dm644 "${srcdir}"/etcher-electron.desktop \
    "${pkgdir}"/usr/share/applications/etcher-electron.desktop

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 assets/iconset/${size}.png \
      "${pkgdir}"/usr/share/icons/hicolor/${size}/apps/etcher-electron.png
  done
}

# vim:set ts=2 sw=2 et:
