# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_hash="8ea935e79a50a02da912a034bbeda84a6d3d355d" # https://github.com/getcursor/cursor/issues/3119

_Name="Cursor"
_name="${_Name,,}"
_electron=electron34
pkgname="${_name}-electron"
pkgver=0.50.4
pkgrel=4
pkgdesc="The AI Code Editor (system-wide electron)"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
depends=("${_electron}" 'ripgrep' 'xdg-utils' # system-wide replacements
		'bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbfile')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_pkgsrc="${_name}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://downloads.cursor.com/production/${_hash}/linux/arm64/${_Name}-${pkgver}-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://downloads.cursor.com/production/${_hash}/linux/x64/${_Name}-${pkgver}-x86_64.AppImage")
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
  echo 'Fix if "major" version is wrong'
}
build(){
  _app=/usr/share/cursor/resources/app
  # code.mjs just suppress warns.
  sed -e "s|exec /usr|ELECTRON_RUN_AS_NODE=1 exec /usr|" \
      -e "s|flags=()|flags=(${_app}/out/cli.js --app=${_app})|" \
      /usr/bin/${_electron} > "${pkgname}.sh" # should be supported by ${_electron} officially.
}
package(){
  # Use upstream's layout instead of FHS https://github.com/getcursor/cursor/issues/3123
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
