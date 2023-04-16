# Maintainer: jacekpoz <jacekpoz@cock.li>
# Contributor: n3oney <neo@neoney.dev>
# Contributor: Spacingbat3 <git@spacingbat3.anonaddy.com> (https://github.com/spacingbat3)
# this is SpacingBat3's webcord-git package modified - if I'm violating any licenses in any way please contact me

### SCRIPT METADATA ###

# shellcheck shell=bash disable=SC2164,SC2034

### PKGBUILD METADATA ###

pkgname=webcord-vencord-git
pkgver=4.2.0.r845.66c71e5
pkgrel=5
pkgdesc="A Discord and Fosscord client made with the Electron (master branch with Vencord)."
arch=("any")

_repo="WebCord"
_author="SpacingBat3"

url="https://github.com/${_author}/${_repo}"
license=('MIT')
depends=('electron24')
optdepends=(
  'xdg-desktop-portal-impl: Screen share UI and other portals under Wayland'
  'pipewire: WebRTC screen sharing under Wayland'
  'org.freedesktop.secrets: Encryption using stored key in the secret service'
)
makedepends=('npm' 'git' 'imagemagick' 'typescript' 'asar' 'p7zip' 'pnpm')
provides=("${pkgname%-vencord-git}")
conflicts=("${pkgname%-vencord-git}")
source=(
  "${pkgname%-vencord-git}::git+https://github.com/${_author}/${_repo}.git"
  "${pkgname%-vencord-git}.desktop"
  "vencord::git+https://github.com/vendicated/vencord.git"
)
md5sums=(
  'SKIP'
  '6046178af59a8c93835051e698eacf1e'
  'SKIP'
)

### CONFIGURABLE VARIABLES ###

# Set to "true" if you want to have update notifications enabled.
_UPDATE_NOTIFICATIONS=false

# Set to "true" if you want to use dependencies from the upstream lockfile
# (NOT RECOMMENDED, as they might be outdated). By the default, NPM will try to
# pick the latest dependencies defined in `package.json`.
_LOCKFILE=true

# Set to "release" if you want to disable an access to the development tools.
_RELEASE_TYPE=devel

_LOCAL_PACKAGES=(
  # Uncomment to use system-provided packages instead of bundled NPM ones.
  #marked semver
)

### TYPE CHECKS ###

_typecorrect=0

__cbe() {
  if [[ -n "${2}" && "${2}" != "true" && "${2}" != "false" ]]; then
    echo "PKGBUILD: ${1}: Invalid type (should be boolean or empty)." >&2
    _typecorrect=$((_typecorrect+${3})) || true
  fi
}

__cbe "_UPDATE_NOTIFICATIONS" "${_UPDATE_NOTIFICATIONS}" 1
__cbe "_LOCKFILE" "${_LOCKFILE}" 2

if [[ -n "${_RELEASE_TYPE}" && "${_RELEASE_TYPE}" != "devel" && "${_RELEASE_TYPE}" != "release" ]]; then
  echo "PKGBUILD: _RELEASE_TYPE: Invalid type (should be 'devel','release' or empty)." >&2
  _typecorrect=$((_typecorrect+4)) || true
fi

[[ "${_typecorrect}" != 0 ]] && exit "${_typecorrect}"

### PKGBUILD STANDARD FUNCTIONS ###

prepare() {
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  _TIMES_MAX=1
  if [[ "${_LOCKFILE}" == "true" ]]; then
    ((_TIMES_MAX++))
    _echo_times "Restoring upstream lockfile..."
    git restore "package-lock.json"
  fi

  cd "${srcdir:?}/vencord"
  pnpm install
  pnpm run buildWeb

  cd "${srcdir:?}/${pkgname%-vencord-git}"

  sed -i "361i session.defaultSession.loadExtension(\"/usr/share/webcord/vencord-ext\").then(() => console.log(\"Vencord loaded.\"));" "${srcdir:?}/webcord/sources/code/common/main.ts"

  _echo_times "Generating / updating a changelog..."
  _changelog vty > "${_pkgbuilddir:?}/${pkgname%-git}.changelog"
}

pkgver() {
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  printf "%s.r%s.%s" "$(npm pkg get version | sed 's~-~_~g;s~"\([^"]*\)"~\1~g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _TIMES=1
  _TIMES_MAX=6
  cd "${srcdir:?}/${pkgname%-vencord-git}"

  # Remove unnecesary developer dependencies

  mapfile -t _remove_deps < <(grep -E '@electron-forge|@reforged|@typescript-eslint' "${srcdir:?}/${pkgname%-vencord-git}/package.json" | sed 's~"\(.*\)":.*~\1~g' | tr -d " ")

  _remove_deps+=(
    typescript eslint eslint-import-resolver-typescript eslint-plugin-import
    eslint-plugin-json-schema-validator husky @electron/fuses
  )

  _echo_times "Installing dependencies..."
  [[ -n "${_LOCAL_PACKAGES[*]}" ]] && _npm i "${_LOCAL_PACKAGES[@]/#/"${_NODE_MODULES}"}"
  npm pkg delete "${_remove_deps[@]/#/devDependencies.}"
  if [[ "${_LOCKFILE}" == "true" ]]; then
    _npm ci 
  else
    _npm update
  fi
  _cleanup && _compile && _genico && _gen_buildinfo
}

package() {
  # Neccesary files – application data, license etc.

  _TIMES_MAX=2
  _pack "${pkgdir:?}/usr/share/"
  _echo_times "Adding other files to package..."
  _script "${pkgdir:?}/usr/bin/${pkgname%-vencord-git}"
  cd "${srcdir:?}"
  install -Dm755 "${pkgname%-vencord-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-vencord-git}.desktop"
  install -Dm644 "${pkgname%-vencord-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-vencord-git}/COPYING"
  if [[ -n "${_LOCAL_PACKAGES[*]}" ]]; then
    install -dm755 "${pkgdir:?}/usr/share/${pkgname%-vencord-git}/node_modules"
    ln -st "${pkgdir:?}/usr/share/${pkgname%-vencord-git}/node_modules" \
      "/usr/lib/node_modules/semver" "/usr/lib/node_modules/marked"
  fi

  # Application icons

  install -dm755 "${pkgdir:?}/usr/share/icons"
  cp -R "iconThemes/themeId-1/" "${pkgdir}/usr/share/icons/hicolor"
  chmod 0644 "${pkgdir}/usr/share/icons"/*/*/*/"${pkgname%-vencord-git}."*

  # Documentation

  install -dm755 "${pkgdir}/usr/share/docs"
  cp -R "${pkgname%-vencord-git}/docs/" "${pkgdir}/usr/share/docs/${pkgname%-vencord-git}/"
  chmod 0644 "${pkgdir}/usr/share/docs/${pkgname%-vencord-git}/"
  _changelog md > "${pkgdir}/usr/share/docs/${pkgname%-vencord-git}/Changelog.md"

  # Get supported electron version and add it to the dependencies.
  #  (`-n "$pkgdir"` check also prevents adding it to .SRCINFO)
  #[[ -n "$pkgdir" ]] && depends+=("electron$(_getelectron)")
  # commented the line above because _getelectron had some error and this does literally nothing afaik, since electron22 still doesn't work

  # Add changelog file to the package if present
  if [[ -f "${_pkgbuilddir}/${pkgname%-vencord-git}.changelog" ]]; then
    [[ -n "$pkgdir" ]] && changelog="${pkgname%-vencord-git}.changelog"
  fi
}

### INTERNAL PKGBUILD VARIABLES ###

_pkgbuilddir="$PWD"
_NODE_MODULES=/usr/lib/node_modules/
_TIMES=1
_TIMES_MAX='?'
depends+=(
  "${_LOCAL_PACKAGES[@]}"
)

### INTERNAL PSEUDO-FUNCTIONS ###

# Generates a "buildInfo.json" metadata file.
_gen_buildinfo() {
  _echo_times "Generating build configuration..."
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  printf '{"type":"%s","commit":"%s","features":{"updateNotifications":%s}}' \
    "${_RELEASE_TYPE:=devel}" "$(git rev-parse HEAD)" "${_UPDATE_NOTIFICATIONS:=true}" > buildInfo.json
}

# Prints a "changelog" in given format.
_changelog() {
  local tag_cur tag_prev format title oldpwd
  oldpwd="$PWD"
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  case "$1" in
    "md")
      title="# Changelog for \`${pkgname}\`\n\n## Changes since %s\n\n%s\n\n## Changes since %s\n\n%s"
      # shellcheck disable=SC2016
      format=' - `%h`: *%s* by [**%an**](mailto:%ae).'
    ;;
    "vty")
      title='\n%s\n---\n%s\n\n\n%s\n---\n%s'
       format=' * [%h]: %s%n'
      format+='   - %an <%ae>.%n'
    ;;
    *) return 1 ;;
  esac
  tag_cur="$(git describe --tags --abbrev=0)"
  tag_prev="$(git describe --tags --abbrev=0 "$tag_cur"~)"
  # shellcheck disable=SC2059
  printf "$title" \
    "${tag_cur}..HEAD" \
    "$(git log --invert-grep --grep="Bump" --pretty="$format" "$tag_cur"..HEAD)" \
    "${tag_prev}..${tag_cur}" \
    "$(git log --invert-grep --grep="Bump" --pretty="$format" "$tag_prev".."$tag_cur")"
  cd "$oldpwd"
}

# Internal "echo" command to show a progress on current PKGBUILD step.
_echo_times() {
  echo "(${_TIMES}/${_TIMES_MAX})" "${@}"
  ((_TIMES++)) || true
}

# NPM alias with useful flags/modifications.
_npm() {
  ELECTRON_SKIP_BINARY_DOWNLOAD=1 npm \
    --cache="${srcdir:-.}/npm-cache"  \
    --no-audit \
    --no-fund \
    --silent \
    --ignore-scripts \
    "$@"
}

# Cleanup script to remove useless files before packaging the application.
_cleanup() {
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  _echo_times "Cleaning up workspace..."

  _PACKAGE_IGNORE=(
    "../${pkgname%-vencord-git}.asar" "../iconThemes" "sources/assets/icons/app.ico"
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
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  _echo_times "Compiling TypeScript to Javascript..."
  tsc || { echo "Failed to compile TypeScript sources to JavaScript"; exit 1; }
  _postcompile
}

# A function that returns the currently supported Electron major release.
_getelectron(){
  local OLDPWD=$PWD;
  cd "${srcdir:?}/${pkgname%-vencord-git}";
  echo $(($(npm pkg get devDependencies.electron | sed 's~"\([^"]*\)"~\1~g;s~.* <\([0-9]*\).*~\1~')-1));
  cd "$OLDPWD";
}

# A function to convert the base icon into another sizes.
_genico(){
  _icons=("${srcdir:?}/${pkgname%-vencord-git}/sources/assets/icons/app.png")
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
      _outdir="themeId-${_i}/${_size}x${_size}/apps"
      _out="${_outdir}/${pkgname%-vencord-git}.${_ext}"
      _outln="${_outdir}/${_repo}.${_ext}"
      mkdir -p "$(dirname "$_out")"
      if [[ "${_ext}" == "png" ]]; then
        convert "$_file" -size "${_size}x${_size}" "$_out" &
        ln -sr "${_out}" "${_outln}" &
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
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  # Package to ASAR
  _echo_times "Packaging app to ASAR archive..."
  install -dm755 "${1}/${pkgname%-vencord-git}"
  cd "${srcdir:?}"

  cp -r "${srcdir:?}/vencord/dist/extension-unpacked" ./vencord-ext
  find "./vencord-ext" -type f -exec install -Dm644 "{}" "${1}/${pkgname%-vencord-git}/{}" \;

  cd "${srcdir:?}/${pkgname%-vencord-git}"
  asar pack --exclude-hidden . "${1}/${pkgname%-vencord-git}/app.asar" || {
    echo "Failed to package to ASAR!"
    exit 2
  }
}

# A postcompile step to remove build dependencies.
_postcompile() {
  cd "${srcdir:?}/${pkgname%-vencord-git}"
  _echo_times "Removing build dependencies..."
  rm -R tsconfig.json sources/code &
  _npm --omit=dev ci &
  wait
  [[ -n "${_LOCAL_PACKAGES[*]}" ]] && _npm --omit=dev r "${_LOCAL_PACKAGES[@]}"
  rmdir node_modules/* --ignore-fail-on-non-empty
}

# A function that returns a script to be used for starting WebCord with
# system-wide Electron binary.
_script() {
  mkdir -p "$(dirname "$1")"
  #echo -ne "#!/bin/bash\nelectron$(_getelectron) /usr/share/${pkgname%-vencord-git}/app.asar \"\$@\"\nexit \$?">"$1"
  echo -ne "#!/bin/bash
    CONFIG=\${XDG_CONFIG_HOME:-~/.config}
    FLAGS=\"\$CONFIG/webcord-flags.conf\"

    if [ -f \"\$FLAGS\" ]; then
        USER_FLAGS=\"\$(cat \"\$FLAGS\")\"
    fi

    electron24 /usr/share/${pkgname%-vencord-git}/app.asar \$USER_FLAGS \"\$@\"\nexit \$?">"$1"
  chmod 755 "$1"
}
