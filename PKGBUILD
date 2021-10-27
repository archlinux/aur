# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop
_binname=threema
pkgver=1.0.3
_threema_web_ver=2.3.17
pkgrel=2
pkgdesc="Threema Desktop (Threema Web in Electron)."
arch=("x86_64")
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=(electron)
makedepends=(npm)
source=(
  "https://github.com/threema-ch/threema-web-electron/archive/refs/tags/release-${pkgver}-latest.tar.gz"
  "https://github.com/threema-ch/threema-web/archive/refs/tags/v${_threema_web_ver}.tar.gz"
  "threema.desktop"
)
sha256sums=(
  "5ddd3ec7e7ec422c624a744a230bf1fb3d35e96ee731ee9af70ab6e89024e094"
  "15d80662188332d019ea82cf2486952b4deca39790b275b585a3c4178e7a8d54"
  "fcea11858be11ca7c51f44fa0750b33d11b16065a48ddc8566d119b560ce5cb8"
)

build() {
  cd "${srcdir}/threema-web-electron-release-${pkgver}-latest/"

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

  # Build Electron app
  npm run app:install
  TARGET_OS=linux-deb
  TARGET_DIST=linux:deb
  node tools/patches/post-patch-threema-web.js $TARGET_OS consumer
  npm run electron:dist:$TARGET_DIST:consumer
}

package() {
  cd "${srcdir}/"

  # Set some variables
  app_root="${srcdir}/threema-web-electron-release-${pkgver}-latest"

  # Copy application
  mkdir -p "${pkgdir}/usr/lib/${pkgname}/resources/"
  cp "${app_root}/app/build/dist-electron/packaged/Threema-linux-x64/resources/app.asar" \
     "${pkgdir}/usr/lib/${pkgname}/resources/"

  # Create launcher
  mkdir -p "${pkgdir}/usr/bin/"
  LAUNCHER="${pkgdir}/usr/bin/${_binname}"
  echo -e "#!/bin/sh\nexec electron '/usr/lib/${pkgname}/resources/app.asar' '$@'" > $LAUNCHER
  chmod +x $LAUNCHER

  # Copy desktop files
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/threema.desktop" "${pkgdir}/usr/share/applications/threema.desktop"
  cp "${app_root}/app/assets/icons/png/consumer-512x512.png" "${pkgdir}/usr/share/pixmaps/threema.png"
}

# vim:set ts=2 sw=2 et:
