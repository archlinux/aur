# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cursor"
_name="${_Name,,}"
_electron=32
pkgname="${_name}-electron"
pkgver=0.46.11
pkgrel=3
pkgdesc="The AI Code Editor"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary')
depends=('bash' "electron${_electron}" 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libx11' 'libxkbfile')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${pkgver}"
source=("${pkgname}.sh")
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/arm64/appimage/${_Name}-${pkgver}-ae378be9dc2f5f1a6a1a220c6e25f9f03c8d4e19.deb.glibc2.28-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/x64/appimage/${_Name}-${pkgver}-ae378be9dc2f5f1a6a1a220c6e25f9f03c8d4e19.deb.glibc2.25-x86_64.AppImage")
b2sums=('7731877436bc3fbc813862cc4517e280d9a74a8f9fa7fe3bf116206f82e5a9110460a82a7b66d7dd7b2109ec12f52547e4ee7a2f027cb4df9e8587b3826452fc')
b2sums_aarch64=('2f76693167f1623f75f914e0ff6febe37885a12980d8eb49e252a179fd52522da94aa3edf3011c8c9f27a46f4c3c2d8298ef673020bd4e89ac62634ea06ca961')
b2sums_x86_64=('2860a4a55d213a77f51dcf25b22eea4d2ae907d29a4ef42c6b4cf2d58bd2fa914456ec4e9736d7d33cf8a78b59b0763ee459649f9846fcdff65f6faf7c8efa5d')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  sed -e "s|@electronversion@|${_electron}|g" \
      -e "s|@appname@|${_name}|g" \
      -e "s|@runname@|app|g" \
      -e "s|@cfgdirname@|${_name}|g" \
      -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
      -i "${pkgname}.sh"
      
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/

  # remove AppImage-specific files in root dir
  cd "${_pkgsrc}-${CARCH}"
  find . -mindepth 1 -maxdepth 1 -type f,l -delete

  # native Electron apps should be installed to usr/lib/${_name}
  cd "usr"
  rm -rf "lib/${_name}"
  mv -f "share/${_name}/resources" "lib/${_name}"
  chmod -R 755 "lib/${_name}"
  rm -rf "share/${_name}"

  # remove useless .AppImage files
  cd "lib/${_name}"
  rm -f ./*.AppImage

  # https://github.com/getcursor/cursor/issues/837#issuecomment-2326443145
  # native Electron apps should be installed to usr/lib/${_name}
  find "app" -type f -name '*.js' -exec \
    sed -e 's/,minHeight/,frame:false,minHeight/g' \
        -e "s|/opt/${_name}/resources|/usr/lib/${_name}|g" \
        -i "{}" +

  # fix hicolor-icon-theme icon name
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share"
  find "icons" -type f -name "${_name}.png" -execdir \
    mv -f "{}" "co.anysphere.cursor.png" \;

  # native Electron apps should be installed to usr/lib/${_name}
  find "applications" -type f -name '*.desktop' -exec \
    sed -i "s|/usr/share/${_name}/${_name}|${_name}|g" "{}" +

  # symlink the license file
  install -d "licenses/${_name}"
  ln -sf "/usr/lib/${_name}/app/LICENSE.txt" "licenses/${_name}/LICENSE"

  # fix zsh completion dir
  cd "zsh"
  rm -rf "site-functions"
  mv -f "vendor-completions" "site-functions"
}

package() {
  cd "${srcdir}"
  cp -r --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_name}"
}
