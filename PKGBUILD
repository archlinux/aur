# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app
pkgver=2.0.16
pkgrel=11
epoch=2
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('i686' 'x86_64')
url="https://www.notion.so/desktop"
license=('MIT')
depends=('re2' 'gtk3' 'xdg-utils')
makedepends=('imagemagick' 'p7zip' 'npm' 'nvm' 'python2' 'git')
source=("Notion-"${pkgver}".exe::https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe" 
        'notion-app.desktop')
md5sums=('9f72284086cda3977f7f569dff3974d5'
         '257f3106e5d9364ef2df557a656cd8e7')

print_info() {
    echo -e "\033[1;33m==> $@\033[0m"
}

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  nvm install 14.16.1
}

build() {
  _ensure_local_nvm

  print_info "Extracting app from Windows build..."
  7z x -y "${srcdir}/Notion-"${pkgver}".exe" -o"${srcdir}/extracted-exe" >/dev/null
  7z x -y "${srcdir}/extracted-exe/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/extracted-app" >/dev/null
  
  rm -rf "${srcdir}/package-rebuild"
  mkdir -p "${srcdir}/package-rebuild"

  print_info "Copying original app resources..."
  cp -r "${srcdir}/extracted-app/resources/app/"* "${srcdir}/package-rebuild"

  cd "${srcdir}/package-rebuild"
  
  print_info "Patching original sources for fixes..."
  sed -i 's|process.platform === "win32"|process.platform !== "darwin"|g' main/main.js

  print_info "Recreating package node_modules..."
  rm -r node_modules
  npm install --cache "${srcdir}/npm-cache"
  node_modules/.bin/patch-package
  npm install cld@2.7.0 --cache "${srcdir}/npm-cache"

  print_info "Converting app icon..."
  convert "icon.ico[0]" "icon.png" >/dev/null

  print_info "Building electron package..."
  npm install electron@11 electron-builder --save-dev --cache "${srcdir}/npm-cache"
  node_modules/.bin/electron-builder --linux dir

  cd "${srcdir}"
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/applications"

  cp -r "${srcdir}/package-rebuild/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/package-rebuild/icon.png" "${pkgdir}/opt/${pkgname}/icon.png"
  install -Dm644 "${srcdir}/package-rebuild/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  ln -s "/opt/${pkgname}/notion" "${pkgdir}/usr/bin/${pkgname}"
}

