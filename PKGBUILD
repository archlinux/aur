# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=balena-etcher
_pkgname=etcher
pkgver=1.5.34
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=(x86_64)
_github_url='https://github.com/balena-io/etcher'
url='https://etcher.io'
license=(Apache)
depends=(electron gtk2 libxtst libxss gconf nss alsa-lib)
makedepends=(npm python2 git jq)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
conflicts=("${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-bin"
)
options=('!strip')
source=("${_pkgname}::git+https://github.com/balena-io/${_pkgname}.git#tag=v${pkgver}"
        'git+https://github.com/balena-io/scripts.git'
        "${pkgname}-electron"
        "${pkgname}-electron.desktop"
        "use-electron-4.1.5.patch")
sha256sums=('SKIP'
            'SKIP'
            '0a9de6e33cacdab09dfad84a0a7b6cd26e7f611e9473d1513eb49c53ac5d2edb'
            'c950d9578f9cf60998c920bb60c6617559963f06a4918e7072fdc706b0ef5754'
            '488e2ebce14bb9a8caaa1e9aaa73ee22c1c3eaa68c110d355bd588b37023f002')

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.scripts/resin.url "${srcdir}/scripts"
  git submodule update
}

build() {
  cd "${_pkgname}"
  #git apply -v "${srcdir}/use-electron-4.1.5.patch"
  export NPM_VERSION=$(npm --version)
  make electron-develop #|| /bin/true
  make webpack
  npm prune --production
}

package() {
  cd "${_pkgname}"

  _appdir="${pkgdir}/usr/lib/${pkgname}"
  install -d "${_appdir}"

  install package.json "${_appdir}"
  cp -a {lib,generated,node_modules} "${_appdir}"
  install -D assets/icon.png "${_appdir}/assets/icon.png"
  install -D lib/gui/app/index.html "${_appdir}/lib/gui/app/index.html"

  install -Dm755 "${srcdir}/${pkgname}-electron" "${pkgdir}/usr/bin/${pkgname}-electron"
  install -Dm644 "${srcdir}/${pkgname}-electron.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}-electron.desktop"

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 "assets/iconset/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}-electron.png"
  done
}

# vim:set ts=2 sw=2 et:
