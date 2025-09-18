# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop
_binname=threema
_variant=consumer
_appname="Threema"
pkgdesc="Threema Desktop (Threema Web in Electron)."
pkgver=1.2.49
pkgrel=2
_threema_web_ver=2.6.2 # Keep in sync with version used by threema-desktop
arch=('any')
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL-3.0-only')
_electron=electron37
depends=(${_electron})
makedepends=(git nodejs-lts-iron npm)
install="${pkgname}.install"
source=(
  "threema-web-electron-v${pkgver}.tar.gz::https://github.com/threema-ch/threema-web-electron/archive/refs/tags/${pkgver}.tar.gz"
  "threema-web-v${_threema_web_ver}.tar.gz::https://github.com/threema-ch/threema-web/archive/refs/tags/v${_threema_web_ver}.tar.gz"
  "threema.desktop"
)
sha256sums=(
  '07e8393a32170a96eb40d3e10a9b8f8fed03cc3a41d3411b9baa21db1a9d473d'
  '038b2dbea414020d8bd2a11b18896e6b06348f82c7b963d8b3fe983a23b658eb'
  '9fed7fdd6f9b6e4b53caafc9ef8608b7bd73c1272ab4380d5d6839c3c60deb8b'
)

prepare() {
  cd "${srcdir}/threema-web-electron-${pkgver}/"

  # Move threema-web source code (since threema-web-electron submodule
  # is not contained in GitHub export)
  rm -r "app/dependencies/threema-web"
  mv "${srcdir}/threema-web-${_threema_web_ver}" "app/dependencies/threema-web"

  # Download dependencies for building Threema Web
  export DEV_ENV=production
  export THREEMA_WEB_VERSION=threema-web-${_threema_web_ver}
  npm install --no-audit
}

build() {
  cd "${srcdir}/threema-web-electron-${pkgver}/"

  # Build Threema Web
  export DEV_ENV=production
  export THREEMA_WEB_VERSION=threema-web-${_threema_web_ver}
  ./tools/patches/patch-threema-web.sh
  npm run app:build:web
  ./tools/patches/post-patch-threema-web.sh
  touch app/dependencies/threema-web/release/threema-web-${_threema_web_ver}/userconfig.overrides.js

  # Build Electron app
  npm run app:install
  _target_os=linux-deb
  _target_dist=linux:deb
  node tools/patches/post-patch-threema-web.js $_target_os $_variant
  if [ "$_variant" = "blue" ]; then node tools/patches/blue-patch-threema-web.js; fi
  npm run electron:dist:$_target_dist:$_variant
}

package() {
  cd "${srcdir}/"

  _app_root="${srcdir}/threema-web-electron-${pkgver}"

  # Copy application
  mkdir -p "${pkgdir}/usr/lib/${pkgname}/resources/"
  cp "${_app_root}/app/build/dist-electron/packaged/${_appname}-linux-x64/resources/app.asar" \
     "${pkgdir}/usr/lib/${pkgname}/resources/"

  # Create launcher
  mkdir -p "${pkgdir}/usr/bin/"
  _launcher="${pkgdir}/usr/bin/${_binname}"
  echo -e "#!/bin/sh\nexec ${_electron} '/usr/lib/${pkgname}/resources/app.asar' \${@}" > "$_launcher"
  chmod +x "$_launcher"

  # Copy desktop files
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${_app_root}/app/assets/icons/png/${_variant}-512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  cp "${srcdir}/threema.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i -s "s/{{appname}}/${_appname}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i -s "s/{{binname}}/${_binname}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i -s "s/{{pkgname}}/${pkgname}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i -s "s/{{pkgdesc}}/${pkgdesc}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
