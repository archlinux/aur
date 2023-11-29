# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop
_binname=threema
_variant=consumer
_appname="Threema"
pkgdesc="Threema Desktop (Threema Web in Electron)."
pkgver=1.2.39
pkgrel=3
_threema_web_ver=2.5.2 # Keep in sync with version used by threema-desktop
arch=('any')
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=(electron)
makedepends=(npm nodejs-lts-iron git)
source=(
  "threema-web-electron-v${pkgver}.tar.gz::https://github.com/threema-ch/threema-web-electron/archive/refs/tags/${pkgver}.tar.gz"
  "threema-web-v${_threema_web_ver}.tar.gz::https://github.com/threema-ch/threema-web/archive/refs/tags/v${_threema_web_ver}.tar.gz"
  "threema.desktop"
)
sha256sums=(
  'e46d79ef44c9fbd142f43dff17166f2a79c15515abe4e34fdcef256e1dc17179'
  'dc4bf75444a37cffd087cf0919c148b2c6942dffc26064d2c402dde30a23acc2'
  'ccfdae3416e2a1f096cfaf67fd8f8dacb0d8348582fc666ecc8b5b0d08ef5bf2'
)

prepare() {
  cd "${srcdir}/threema-web-${_threema_web_ver}"
}

build() {
  cd "${srcdir}/threema-web-electron-${pkgver}/"

  # Copy threema-web source code (since threema-web-electron submodule
  # is not contained in GitHub export)
  rm -r "app/dependencies/threema-web"
  cp -R "../threema-web-${_threema_web_ver}" "app/dependencies/threema-web"

  # Build Threema Web
  export DEV_ENV=production
  export threema_web_version=threema-web-${_threema_web_ver}
  npm install
  ./tools/patches/patch-threema-web.sh
  npm run app:build:web
  ./tools/patches/post-patch-threema-web.sh
  touch app/dependencies/threema-web/release/threema-web-${_threema_web_ver}/userconfig.overrides.js

  # Build Electron app
  npm run app:install
  _target_os=linux-deb
  _target_dist=linux:deb
  node tools/patches/post-patch-threema-web.js $_target_os $_variant
  if [ "$_variant" = "red" ]; then tools/patches/red-patch-threema-web.sh; fi
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
  echo -e "#!/bin/sh\nexec electron '/usr/lib/${pkgname}/resources/app.asar' '$@'" > "$_launcher"
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
