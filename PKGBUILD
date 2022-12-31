# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur/balena-etcher: Matthew McGinn <mamcgi@gmail.com>

pkgname=etcher-git
_pkgname=etcher
pkgver=1.13.0.r0.g371716fe
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://etcher.io/'
license=(Apache)
depends=("electron13" "gtk3" "libxtst" "libxss" "nss" "alsa-lib" "glib2" "polkit" "libusb")
makedepends=("git" "npm" "nodejs-lts-fermium")
optdepends=("libnotify: for notifications")
provides=("${_pkgname}=${pkgver}")
options=('!strip')
_github_balena='https://github.com/balena-io'
source=(
  "${_pkgname}::git+${_github_balena}/${_pkgname}.git"
  "${_pkgname}-scripts::git+${_github_balena}/scripts.git"
  "${pkgname}-electron.sh"
  "${pkgname}-electron.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            '21689fc17198a9eaed04680d19c93911c3c00ddeebf2956b62342452addc482f'
            'a770bc8be0c02580b6f9ba12b286f4ff88d9ecd3b2186073a811992d06518aa3')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config "submodule.scripts/resin.url" "${srcdir}/${_pkgname}-scripts"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${_pkgname}"
  make electron-develop
  npm run webpack
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

  install -Dm755 "${srcdir}/${pkgname}-electron.sh" "${pkgdir}/usr/bin/${pkgname}-electron"
  install -Dm644 "${srcdir}/${pkgname}-electron.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}-electron.desktop"

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 "assets/iconset/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}-electron.png"
  done

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}
