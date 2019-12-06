# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-git
_pkgname=etcher
pkgver=1.5.67.r0.g4d65bd9f
pkgrel=1
epoch=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=(x86_64)
_github_url='https://github.com/balena-io/etcher'
url='https://etcher.io'
license=(Apache)
depends=(electron3-bin gtk2 libxtst libxss gconf nss alsa-lib nodejs)
makedepends=(npm python2 git jq)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
conflicts=("${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-bin"
)
options=('!strip')
source=("${_pkgname}::git+https://github.com/balena-io/${_pkgname}.git"
        'git+https://github.com/balena-io/scripts.git'
        "${pkgname}-electron"
        "${pkgname}-electron.desktop"
        )
sha256sums=('SKIP'
            'SKIP'
            'e3870f588df1985b4a45ffa29db899465874e6e1b55c020c2f5b280f3fa77e21'
            'cf61045383e48fe569a67110f880fdd24527607a0d4d7c4fea8f8ead7e046d7e')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.scripts/resin.url "${srcdir}/scripts"
  git submodule update
}

build() {
  cd "${_pkgname}"
  export NPM_VERSION=$(npm --version)
  rm -rf node_modules
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  make electron-develop
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
