# Maintainer: Spacingbat3 <git@spacingbat3.anonaddy.com> (https://github.com/spacingbat3)
pkgname=webcord-git
pkgver=2.1.2.r324.3342d53
pkgrel=2
pkgdesc="A Discord client based on the Electron engine."
arch=("any")

_repo="WebCord"
_author="SpacingBat3"

url="https://github.com/${_author}/${_repo}"
license=('MIT')
makedepends=('npm' 'git' 'imagemagick' 'typescript' 'jq')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/${_author}/${_repo}.git"
    "${pkgname%-git}.desktop")
md5sums=('SKIP'
         '85d234a65c69f3cf817fac5c54c194c8')

_TIMES='1'
_TIMES_MAX='?'

_echo_times() {
  echo "(${_TIMES}/${_TIMES_MAX})" "${@}"
  let _TIMES++
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s.r%s.%s" "$(jq -r .version "${srcdir}/${pkgname%-git}/package.json" | tr '-' '_')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_cleanup() {
  cd "${srcdir}/${pkgname%-git}"
  _echo_times "Cleaning up workspace..."

  _PACKAGE_IGNORE=("../${pkgname%-git}.asar" "../iconThemes" "sources/assets/icons/app.ico"
          "sources/assets/icons/app.icns" "sources/app/build/forge.js"
          "sources/app/build/forge.js.map" "sources/code/build/forge.ts"
          ".gitignore" ".eslintrc.json" "../docs" "build" ".github" "../extra")

  for _target in "${_PACKAGE_IGNORE[@]}"; do
    if [[ -f "${_target}" ]]; then
      rm "${_target}"
    elif [[ -d "${_target}" ]]; then
      rm -R "${_target}"
    fi
  done
}

_print() {
  printf "\r%-${1}s" "${2}"
}

_compile() {
  cd "${srcdir}/${pkgname%-git}"
  _echo_times "Compiling TypeScript to Javascript..."
  tsc || { echo "Failed to compile TypeScript sources to JavaScript"; exit 1; }
  _postcompile
}

_getelectron(){
  jq -r .devDependencies.electron "${srcdir:-src}/${pkgname%-git}/package.json" | sed 's~\^\([0-9]*\)\.[0-9a-z.]*~\1~'
}

_genico(){
  _icons=("${srcdir}/${pkgname%-git}/sources/assets/icons/app.png")
  mkdir "${srcdir}/iconThemes"
  cd "${srcdir}/iconThemes"
  _sizes=(512 256 128 96 64 48 32 24 22 18 16 8)
  _i=1
  mkdir "themeId-${_i}"
  _echo_times "Generating icons in different sizes..."
  for _file in "${_icons[@]}"; do
    [[ $(file "${_file}") =~ "PNG" ]] && _ext="png"
    for _size in "${_sizes[@]}"; do
      [[ ! -z "${_msg}" ]] && _old_msg="${#_msg}" || _old_msg=0
      _msg="Generating images: F=`basename "${_file}"`; S=${_size}x${_size}"
      _print "${_old_msg}" "${_msg}"
      _out="themeId-${_i}/${_size}x${_size}/apps/${pkgname%-git}.${_ext}"
      mkdir -p "$(dirname "$_out")"
      if [[ "${_ext}" == "png" ]]; then
        convert "$_file" -size "${_size}x${_size}" "$_out"
      else
        echo -e "\nERROR: Unknown image type! (${_ext})"
        exit 3
      fi
    done
    let _i++
  done
  _print "${#_msg}" && printf '\r'
}

_pack() {
  cd "${srcdir}/${pkgname%-git}"
  # Package to ASAR
  _echo_times "Packaging app to ASAR archive..."
  [[ -d .git ]] && mv .git ../git-data
  mkdir -p "${1}"
  npx asar pack . "${1}/${pkgname%-git}.asar" || { echo "Failed to package to ASAR!"; exit 2; }
  [[ -d ../git-data ]] && mv ../git-data .git
}

_postcompile() {
  cd "${srcdir}/${pkgname%-git}"
  _echo_times "Removing build dependencies..."
  npm i --cache "${_cache}" --only=prod
  rmdir node_modules/* --ignore-fail-on-non-empty
}

build() {
  _TIMES_MAX=5
  _cache="${srcdir}/npm-cache"
  cd "${srcdir}/${pkgname%-git}"

  # Remove unnecesary developer dependencies

  mapfile -t _remove_deps < <(grep -E '@electron-forge|electron-forge-maker' "${srcdir}/${pkgname%-git}/package.json" | sed 's~"\(.*\)":.*~\1~g' | tr -d " ")

  _remove_deps+=(
  typescript eslint eslint-import-resolver-typescript eslint-plugin-import
  @typescript-eslint/parser @typescript-eslint/experimental-utils
  @typescript-eslint/eslint-plugin
  )

  _echo_times "Installing dependencies..."
  npm r --cache "${_cache}" --save ${_remove_deps[@]}

  _cleanup && _compile && _genico
}

_script() {
  mkdir -p "`dirname "$1"`"
  echo -ne "#!/bin/bash\nelectron$(_getelectron) /usr/lib/${pkgname%-git}.asar\nexit \$?">"$1"
  chmod 755 "$1"
}

package() {
  # Neccesary files – application data, license etc.

  _TIMES_MAX=2
  _pack "${pkgdir}/usr/lib/"
  _echo_times "Adding other files to package..."
  _script "${pkgdir}/usr/bin/${pkgname%-git}"
  cd "${srcdir}"
  install -Dm755 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm644 "${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/COPYING"

  # Application icons

  install -dm755 "${pkgdir}/usr/share/icons"
  cp -R "iconThemes/themeId-1/" "${pkgdir}/usr/share/icons/hicolor"
  chmod 0644 "${pkgdir}/usr/share/icons"/*/*/*/"${pkgname%-git}."*

  # Documentation

  install -dm755 "${pkgdir}/usr/share/docs"
  cp -R "${pkgname%-git}/docs/" "${pkgdir}/usr/share/docs/${pkgname%-git}/"
  chmod 0644 "${pkgdir}/usr/share/docs/${pkgname%-git}/"

  # Get supported electron version and add it to the dependencies.
  depends=(electron`_getelectron`)
}
