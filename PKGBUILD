# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur/balena-etcher: Matthew McGinn <mamcgi@gmail.com>

pkgname=etcher-git
_pkgname=etcher
pkgver=1.5.116.r0.g37769efb
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://etcher.io/'
license=(Apache)
depends=("electron9" "gtk3" "libxtst" "libxss" "nss" "alsa-lib" "nodejs" "glib2" "polkit" "libusb")
makedepends=("npm" "python2" "git" "jq")
optdepends=("libnotify: for notifications")
conflicts=(
  "balena-${_pkgname}"
  "${_pkgname}-bin"
)
options=('!strip')
_scripts='scripts'
_scripts_path='scripts/resin'
_github_balena='https://github.com/balena-io'
source=(
  "${_pkgname}::git+${_github_balena}/${_pkgname}"
  "${_pkgname}-${_scripts}::git+${_github_balena}/${_scripts}"
  "${pkgname}-electron.sh"
  "${pkgname}-electron.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'c8b0f3d9615a21a5f03af36ef9033e71e9c9716c1381879bd7279a7fcf95bb1f'
            'd23e62375aa83a57bfeebbbd7bde09a7d1917deaee78c9e4d3bdf26e1a47870f')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config "submodule.${_scripts_path}.url" "${srcdir}/${_pkgname}-${_scripts}"
  git submodule update
}

build() {
  cd "${_pkgname}"
  export NPM_VERSION=$(npm --version)
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
