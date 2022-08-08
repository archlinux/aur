# Maintainer: Spacingbat3 <git@spacingbat3.anonaddy.com> (https://github.com/spacingbat3)

# shellcheck shell=bash disable=SC2164,SC2034

### PKGBUILD METADATA ###

pkgname=webcord-git
pkgver=3.7.0.r617.4039fda
pkgrel=3
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=("any")

_repo="WebCord"
_author="SpacingBat3"

url="https://github.com/${_author}/${_repo}"
license=('MIT')
makedepends=('npm' 'git' 'imagemagick' 'typescript' 'jq' 'asar')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/${_author}/${_repo}.git"
    "${pkgname%-git}.desktop")
md5sums=('SKIP'
         'c420b0dd4b9a360b0b2f35840f562e39')

### CONFIGURABLE VARIABLES ###

# Set to "true" if you want to have update notifications enabled.
_UPDATE_NOTIFICATIONS=true

# Set to "release" if you want to disable an access to the development tools.
_RELEASE_TYPE=devel

_LOCAL_PACKAGES=(
  # Comment to use NPM-provided packages instead of AUR/pacman-provided ones.
  marked semver
)

### "STATIC" VARIABLES (DO NOT CHANGE) ###

depends+=(
  "${_LOCAL_PACKAGES[@]}"
)

_NODE_MODULES=/usr/lib/node_modules/

### TYPE CHECKS ###

_typecorrect=0

if [[ -n "${_UPDATE_NOTIFICATIONS}" && "${_UPDATE_NOTIFICATIONS}" != "true" && "${_UPDATE_NOTIFICATIONS}" != "false" ]]; then
  echo "PKGBUILD: _UPDATE_NOTIFICATIONS: Invalid type (should be boolean or empty)." >&2
  _typecorrect=$((_typecorrect+1)) || true
fi
if [[ -n "${_RELEASE_TYPE}" && "${_RELEASE_TYPE}" != "devel" && "${_RELEASE_TYPE}" != "release" ]]; then
  echo "PKGBUILD: _RELEASE_TYPE: Invalid type (should be 'devel','release' or empty)." >&2
  _typecorrect=$((_typecorrect+2)) || true
fi

[[ "${_typecorrect}" != 0 ]] && exit "${_typecorrect}"

### PKGBUILD STANDARD FUNCTIONS ###

pkgver() {
  cd "${srcdir:?}/${pkgname%-git}"
  printf "%s.r%s.%s" "$(jq -r .version "${srcdir:?}/${pkgname%-git}/package.json" | tr '-' '_')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _TIMES_MAX=6
  cd "${srcdir:?}/${pkgname%-git}"

  # Remove unnecesary developer dependencies

  mapfile -t _remove_deps < <(grep -E '@electron-forge|electron-forge-maker' "${srcdir:?}/${pkgname%-git}/package.json" | sed 's~"\(.*\)":.*~\1~g' | tr -d " ")

  _remove_deps+=(
    typescript eslint eslint-import-resolver-typescript eslint-plugin-import
    @typescript-eslint/parser @typescript-eslint/experimental-utils
    @typescript-eslint/eslint-plugin
  )

  _echo_times "Installing dependencies..."
  [[ -f package-lock.json ]] && _npm update
  [[ -n "${_LOCAL_PACKAGES[*]}" ]] && _npm i "${_LOCAL_PACKAGES[@]/#/"${_NODE_MODULES}"}" 
  _npm --save r "${_remove_deps[@]}"
  _cleanup && _compile && _genico && _gen_buildinfo
}

package() {
  # Neccesary files – application data, license etc.

  _TIMES_MAX=2
  _pack "${pkgdir:?}/usr/share/"
  _echo_times "Adding other files to package..."
  _script "${pkgdir:?}/usr/bin/${pkgname%-git}"
  cd "${srcdir:?}"
  install -Dm755 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm644 "${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/COPYING"
  if [[ -n "${_LOCAL_PACKAGES[*]}" ]]; then
    install -dm755 "${pkgdir:?}/usr/share/${pkgname%-git}/node_modules"
    ln -st "${pkgdir:?}/usr/share/${pkgname%-git}/node_modules" \
      "/usr/lib/node_modules/semver" "/usr/lib/node_modules/marked"
  fi

  # Application icons

  install -dm755 "${pkgdir:?}/usr/share/icons"
  cp -R "iconThemes/themeId-1/" "${pkgdir}/usr/share/icons/hicolor"
  chmod 0644 "${pkgdir}/usr/share/icons"/*/*/*/"${pkgname%-git}."*

  # Documentation

  install -dm755 "${pkgdir}/usr/share/docs"
  cp -R "${pkgname%-git}/docs/" "${pkgdir}/usr/share/docs/${pkgname%-git}/"
  chmod 0644 "${pkgdir}/usr/share/docs/${pkgname%-git}/"

  # Get supported electron version and add it to the dependencies.
  #   (`-n "$pkgdir"` check also prevents adding it to .SRCINFO)
  [[ -n "$pkgdir" ]] && depends+=("electron$(_getelectron)")
}

### INTERNAL PKGBUILD VARIABLES ###

_TIMES='1'
_TIMES_MAX='?'

### INTERNAL PSEUDO-FUNCTIONS ###

# Generates a "buildInfo.json" metadata file.
_gen_buildinfo() {
  _echo_times "Generating build configuration..."
  cd "${srcdir:?}/${pkgname%-git}"
  printf '{"type":"%s","commit":"%s","features":{"updateNotifications":%s}}' \
    "${_RELEASE_TYPE:=devel}" "$(git rev-parse HEAD)" "${_UPDATE_NOTIFICATIONS:=true}" > buildInfo.json
}

# Internal "echo" command to show a progress on current PKGBUILD step.
_echo_times() {
  echo "(${_TIMES}/${_TIMES_MAX})" "${@}"
  ((_TIMES++)) || true
}

# NPM alias with useful flags/modifications.
_npm() {
  ELECTRON_SKIP_BINARY_DOWNLOAD=1 npm --cache="${srcdir:-.}/npm-cache" "$@"
}

# Cleanup script to remove useless files before packaging the application.
_cleanup() {
  cd "${srcdir:?}/${pkgname%-git}"
  _echo_times "Cleaning up workspace..."

  _PACKAGE_IGNORE=(
    "../${pkgname%-git}.asar" "../iconThemes" "sources/assets/icons/app.ico"
    "sources/assets/icons/app.icns" "app/code/build" "sources/code/build" 
    "schemas" "../docs" "build"
  )

  for _target in "${_PACKAGE_IGNORE[@]}"; do
    if [[ -f "${_target}" ]]; then
      rm "${_target}" &
    elif [[ -d "${_target}" ]]; then
      rm -R "${_target}" &
    fi
  done
  wait
}

# A print function used internally by "genico" script.
_print() {
  printf "\r%-${1}s" "${2}"
}

# A function used for to compile the code to JavaScript files.
_compile() {
  cd "${srcdir:?}/${pkgname%-git}"
  _echo_times "Compiling TypeScript to Javascript..."
  tsc || { echo "Failed to compile TypeScript sources to JavaScript"; exit 1; }
  _postcompile
}

# A function that returns the currently supported Electron major release.
_getelectron(){
  jq -r .devDependencies.electron "${srcdir:-src}/${pkgname%-git}/package.json" | sed 's~\^\([0-9]*\)\.[0-9a-z.]*~\1~'
}

# A function to convert the base icon into another sizes.
_genico(){
  _icons=("${srcdir:?}/${pkgname%-git}/sources/assets/icons/app.png")
  mkdir "${srcdir:?}/iconThemes"
  cd "${srcdir:?}/iconThemes"
  _sizes=(512 256 128 96 64 48 32 24 22 18 16 8)
  _i=1
  mkdir "themeId-${_i}"
  _echo_times "Generating icons in different sizes..."
  for _file in "${_icons[@]}"; do
    [[ $(file "${_file}") =~ "PNG" ]] && _ext="png"
    for _size in "${_sizes[@]}"; do
      [[ -n "${_msg}" ]] && _old_msg="${#_msg}" || _old_msg=0
      _msg="Generating images: F=$(basename "${_file}"); S=${_size}x${_size}"
      _print "${_old_msg}" "${_msg}"
      _out="themeId-${_i}/${_size}x${_size}/apps/${pkgname%-git}.${_ext}"
      mkdir -p "$(dirname "$_out")"
      if [[ "${_ext}" == "png" ]]; then
        convert "$_file" -size "${_size}x${_size}" "$_out" &
      else
        echo -e "\nERROR: Unknown image type! (${_ext})"
        exit 3
      fi
    done
    ((_i++)) || true
  done
  _print "${#_msg}" && printf '\r'
  wait
}

# A function to pack the application data into the ASAR archive.
_pack() {
  cd "${srcdir:?}/${pkgname%-git}"
  # Package to ASAR
  _echo_times "Packaging app to ASAR archive..."
  install -dm755 "${1}/${pkgname%-git}"
  asar pack --exclude-hidden . "${1}/${pkgname%-git}/app.asar" || {
    echo "Failed to package to ASAR!"
    exit 2
  }
}

# A postcompile step to remove build dependencies.
_postcompile() {
  cd "${srcdir:?}/${pkgname%-git}"
  _echo_times "Removing build dependencies..."
  rm -R tsconfig.json sources/code &
  _npm --omit=dev i &
  wait
  [[ -n "${_LOCAL_PACKAGES[*]}" ]] && _npm --omit=dev r "${_LOCAL_PACKAGES[@]}"
  rmdir node_modules/* --ignore-fail-on-non-empty
}

# A function that returns a script to be used for starting WebCord with
# system-wide Electron binary.
_script() {
  mkdir -p "$(dirname "$1")"
  echo -ne "#!/bin/bash\nelectron$(_getelectron) /usr/share/${pkgname%-git}/app.asar \"\$@\"\nexit \$?">"$1"
  chmod 755 "$1"
}