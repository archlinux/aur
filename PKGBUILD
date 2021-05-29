# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-enhanced
notion_ver=2.0.16
enhancer_commit=b417882
pkgver="${notion_ver}"
pkgrel=3
pkgdesc="The all-in-one workspace for your notes and tasks, but enhanced"
arch=('i686' 'x86_64')
url="https://www.notion.so/desktop"
license=('MIT')
depends=('re2' 'gtk3' 'xdg-utils')
makedepends=('imagemagick' 'p7zip' 'npm' 'nvm' 'python2' 'jq')
provides=('notion-app')
conflicts=('notion-app')
__enhancer_dir="notion-enhancer@${enhancer_commit}"
__notion_enhanced="notion-enhanced"
source=("Notion-"${notion_ver}".exe::https://desktop-release.notion-static.com/Notion%20Setup%20${notion_ver}.exe" 
        "${__enhancer_dir}::git+https://github.com/notion-enhancer/notion-enhancer#commit=${enhancer_commit}"
        'notion-app-enhanced.desktop'
        'notion-check-relativeurl.patch'
        "enhancer-query-selector-fix.patch"
        "enhancer-urlhelper-fix.patch"
        "enhancer-add-path.patch")
md5sums=('9f72284086cda3977f7f569dff3974d5'
         'SKIP'
         'bbd8a12eb1993359f010ea9e7e7e660a'
         '5319275232e34299341f9b34ea3039e9'
         '887bc04c0305f6e0124544d0361ee928'
         'afc3df3c50e25710d7a1f4c391df8b25'
         'aaba0b7a2340686c5c4dd9f6eb0cd4de')

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
  7z x -y "${srcdir}/Notion-"${notion_ver}".exe" -o"${srcdir}/extracted-exe" >/dev/null
  7z x -y "${srcdir}/extracted-exe/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/extracted-app" >/dev/null
  
  rm -rf "${srcdir}/package-rebuild"
  mkdir -p "${srcdir}/package-rebuild"

  print_info "Copying original app resources..."
  cp -r "${srcdir}/extracted-app/resources/app/"* "${srcdir}/package-rebuild"

  cd "${srcdir}/package-rebuild"
  
  print_info "Patching original sources for fixes..."
  sed -i 's|process.platform === "win32"|process.platform !== "darwin"|g' main/main.js
  patch -p0 --binary < "${srcdir}/notion-check-relativeurl.patch"

  print_info "Recreating package node_modules..."
  rm -r node_modules
  PATCHED_PACKAGE_JSON=`jq '.dependencies.cld="2.7.0"|.name="notion-enhanced"' package.json`
  echo "${PATCHED_PACKAGE_JSON}" > package.json
  npm install --cache "${srcdir}/npm-cache"
  node_modules/.bin/patch-package

  # installs the only extra runtime dependency needed by notion-enhancer
  # cannot install it in the enhancer's node_modules because it is ignored by electron-builder
  # see more info at https://github.com/electron-userland/electron-builder/issues/3185
  npm install keyboardevent-from-electron-accelerator --cache "${srcdir}/npm-cache" 

  print_info "Converting app icon..."
  convert "icon.ico[0]" "icon.png" >/dev/null

  print_info "Swapping the original icon with the enhancer's one..."
  mv icon.icns original_icon.icns
  mv icon.png original_icon.png
  mv icon.ico original_icon.ico
  enhancer_icon_path="mods/core/icons/mac+linux.png"
  cp "${srcdir}/${__enhancer_dir}/${enhancer_icon_path}" icon.png

  print_info "Preparing enhancer..."
  __embedded_enhancer="embedded_enhancer"
  cp -r "${srcdir}/notion-enhancer@${enhancer_commit}" ${__embedded_enhancer}
  cd ${__embedded_enhancer}

  patch -p0 --binary < "${srcdir}/enhancer-query-selector-fix.patch"
  patch -p0 --binary < "${srcdir}/enhancer-urlhelper-fix.patch"
  patch -p0 --binary < "${srcdir}/enhancer-add-path.patch"
  cd "${srcdir}/package-rebuild"

  print_info "Injecting enhancer loader..."
  for patchable_file in $(find . -type d \( -path ./${__embedded_enhancer} -o -path ./node_modules \) -prune -false -o -name '*.js'); do
    patchable_file_dir=$(dirname $patchable_file)
    rel_loader_path=$(realpath ${__embedded_enhancer}/pkg/loader.js --relative-to $patchable_file_dir) 
    [ $patchable_file_dir = '.' ] && rel_loader_path="./"$rel_loader_path
    rel_loader_require="require('${rel_loader_path}')(__filename, exports);"

    echo -e "\n\n" >> $patchable_file
    echo "//notion-enhancer" >> $patchable_file
    echo "${rel_loader_require}" >> $patchable_file
  done

  print_info "Building electron package..."
  npm install electron@11 electron-builder --save-dev --cache "${srcdir}/npm-cache"
  node_modules/.bin/electron-builder \
    --linux dir -c.asar=false \
    -c.linux.executableName=${__notion_enhanced} \
    -c.productName=${__notion_enhanced}

  cd "${srcdir}"
}

package() {
  _ensure_local_nvm

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/applications"

  cp -r "${srcdir}/package-rebuild/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/package-rebuild/original_icon.png" "${pkgdir}/opt/${pkgname}/original-notion-icon.png"
  cp "${srcdir}/package-rebuild/icon.png" "${pkgdir}/opt/${pkgname}/enhanced-notion-icon.png"

  install -Dm644 "${srcdir}/package-rebuild/icon.png" "${pkgdir}/usr/share/pixmaps/${__notion_enhanced}.png" 
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  ln -s "/opt/${pkgname}/${__notion_enhanced}" "${pkgdir}/usr/bin/${pkgname}"
}
