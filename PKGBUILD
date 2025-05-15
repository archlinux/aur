# Maintainer:  oech3
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cursor"
_name="${_Name,,}"
_electron=electron34
pkgname="${_name}-electron"
pkgver=0.50.4
pkgrel=2
pkgdesc="The AI Code Editor (system-wide electron)"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary')
depends=("${_electron}" 'bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libxkbfile' 'ripgrep' 'xdg-utils')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_pkgsrc="${_name}-${pkgver}"
source=("${pkgname}."{sh,mjs})
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://downloads.cursor.com/production/8ea935e79a50a02da912a034bbeda84a6d3d355d/linux/arm64/${_Name}-${pkgver}-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://downloads.cursor.com/production/8ea935e79a50a02da912a034bbeda84a6d3d355d/linux/x64/${_Name}-${pkgver}-x86_64.AppImage")
sha512sums=('7cbf05f026f67172d48d08fc240e4253e91009ebd0e60e960c0af9828bd14f28287191b73b1a2ae3f47b47151164eb59e62efa2e129221a0e84bf7bd7a9ed724'
            'a38e9fdf2967e2a044091ad7d54c91a6e00d9f16454a10740e5e608c36a06706c05bc86dde3210341757d85e621117cddb3cfff6475cca52015b00fa67543059')
sha512sums_aarch64=('e336c5b9ec9909b98a660f98bb76ba992345e3691d1983e06caee9cba60ac0ecb8414eac3b989e23699f9b3c0cee7e343054dcb50dcf5a7977f3998a8f39cc2c')
sha512sums_x86_64=('4cd15e7ebc3e5f0aaf7236ab5c6c6bab5b6030b358541ca03062ac26bcbffe5377cceecd786b05c010b6aa66e41e5f2b33d4ed5019a3f81dcb2c4b4c75e21b79')

prepare() {
  cd "${srcdir}"
  sed -e "s|name=electron|name=${_electron}|g" \
      -e '/PKGBUILD/d' \
      -i "${pkgname}.sh"
  sed -e "1s|.*|#!/usr/lib/${_electron}/electron|" \
      -e '/PKGBUILD/d' \
      -i "${pkgname}.mjs"

  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/

  cd "${_pkgsrc}-${CARCH}/usr"
  find . -type f -exec \
    sed -i "s|/usr/share/${_name}/${_name}|/usr/bin/${_name}|g" {} +

  cd "share"
  mv "zsh/vendor-completions" "zsh/site-functions"

  # cd "${_name}/resources/app"
  # echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' squashfs-root/usr/share/cursor/resources/app/package.json) with $(cat /usr/lib/electron${_elnum}/version)
}

package(){
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh"  "${pkgdir}/usr/bin/${_name}"
  install -vDm755 "${pkgname}.mjs" "${pkgdir}/usr/lib/${_name}/${_name}.mjs"
  
  cd "${_pkgsrc}-${CARCH}/usr/share"
  find "appdata" "applications" "bash-completion" "icons" "mime" "pixmaps" "zsh" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/{}" \;

  cd "${_name}/resources/app"
  cp -r --no-preserve=ownership --preserve=mode ./* "${pkgdir}/usr/lib/${_name}/"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/${_name}"

  cd "${pkgdir}/usr"
  ln -vsf "/usr/bin/rg"       "lib/${_name}/node_modules/@vscode/ripgrep/bin/rg"
  ln -vsf "/usr/bin/xdg-open" "lib/${_name}/node_modules/open/xdg-open"

  install -vdm755 "${pkgdir}/usr/share/licenses/${_name}"
  cd "share/licenses/${_name}"
  ln -vsf "/usr/lib/${_name}/LICENSE.txt" "LICENSE.txt"
  ln -vsf "/usr/lib/${_name}/ThirdPartyNotices.txt" "ThirdPartyNotices.txt"
}
