# Maintainer:  oech3
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_hash="8ea935e79a50a02da912a034bbeda84a6d3d355d" # https://github.com/getcursor/cursor/issues/3119

_Name="Cursor"
_name="${_Name,,}"
_electron=electron34
pkgname="${_name}-electron"
pkgver=0.50.4
pkgrel=3
pkgdesc="The AI Code Editor (system-wide electron)"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
depends=("${_electron}" 'ripgrep' 'xdg-utils' # system-wide replacements
		'bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbfile')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_pkgsrc="${_name}-${pkgver}"
_codever=1.100.2-1
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/${_codever}/code.sh")
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://downloads.cursor.com/production/${_hash}/linux/arm64/${_Name}-${pkgver}-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://downloads.cursor.com/production/${_hash}/linux/x64/${_Name}-${pkgver}-x86_64.AppImage")
sha512sums=('937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')
sha512sums_aarch64=('e336c5b9ec9909b98a660f98bb76ba992345e3691d1983e06caee9cba60ac0ecb8414eac3b989e23699f9b3c0cee7e343054dcb50dcf5a7977f3998a8f39cc2c')
sha512sums_x86_64=('4cd15e7ebc3e5f0aaf7236ab5c6c6bab5b6030b358541ca03062ac26bcbffe5377cceecd786b05c010b6aa66e41e5f2b33d4ed5019a3f81dcb2c4b4c75e21b79')
#options=(!strip)
prepare() {
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/usr/share"
  mv -v zsh/{vendor-completions,site-functions}

  echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' "${_name}"/resources/app/package.json) with $(cat /usr/lib/${_electron}/version)
}
build(){
  _app=/usr/share/cursor/resources/app
  # code.mjs does nothing more than suppressing warns.
  sed -e "s|code-flags|cursor-flags|" \
    -e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
    -e "s|/usr/lib/code/code.mjs|--app=${_app}|" \
    -e "s/name=electron/name=${_electron}/" code.sh > "${pkgname}.sh"
}
package(){
  # Use upstream's layout instead of FHS
  install -Dvm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_name}"
  install -d "${pkgdir}/usr/share/${_name}/resources"
  ln -sf "/usr/bin/${_name}" "${pkgdir}/usr/share/${_name}/${_name}"

  cd "${_pkgsrc}-${CARCH}"
  # icon https://github.com/getcursor/cursor/issues/3120
  install -Dvm644 co.anysphere.cursor.png "${pkgdir}/usr/share/pixmaps/co.anysphere.cursor.png"

  cd usr/share
  cp -r --reflink=auto appdata applications bash-completion mime zsh "${pkgdir}/usr/share/"
  cp -r --reflink=auto "${_name}/resources/app" "${pkgdir}/usr/share/${_name}/resources/"

  # Use system-wide tools
  cd "${pkgdir}/usr/share/cursor/resources/app"
  ln -vsf "/usr/bin/rg"       "node_modules/@vscode/ripgrep/bin/rg"
  ln -vsf "/usr/bin/xdg-open" "node_modules/open/xdg-open"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv -v LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # for namcap
  mv -v ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
