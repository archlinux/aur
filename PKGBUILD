# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="schildichat-revenge"
pkgname="${_pkgname}-git"
# 2026-05-28: Seems to work with both OpenJDK 21 and OpenJDK 26. We do not enforce a specific Java version. But make sure that `archlinux-java` is set to a version where an SDK and not only a JRE is installed.
#_jdkversion=21
#_jdkversion=26
pkgver=26.06.06+60.r2867.20260621.df44afb4
pkgrel=1
pkgdesc="Matrix client for desktop written in Kotlin and using the Matrix Rust SDK, designed to be fully keyboard controllable, multi account, hirarchical spaces. Design in the tradition of SchildiChat clients."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://schildi.chat/revenge/"
_url_schildirevenge_source="https://github.com/SchildiChat/schildi-revenge"
_url_matrix_rust_sdk="https://github.com/SchildiChat/matrix-rust-sdk"
license=(
  'GPL-3.0-or-later' # SchildiChat Revenge
  'Apache-2.0'       # Matrix Rust SDK
)
provides=(
  "${_pkgname}=${pkgver}"
  "schildi-revenge=${pkgver}"
  "schildi-revenge-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "schildi-revenge"
  "schildi-revenge-bin"
)
replaces=(
  "schildi-revenge-git<=26.05.05+130.r2772.20260528.77a4ce84" # Name change.
)
makedepends=(
  "git"
  "cargo"
  "gradle"
  #"java-environment=${_jdkversion}"
  "java-environment"
  #'zopfli'   # To size-optimise PNG files.
  #'parallel' # To size-optimise PNG files.
)
depends=(
  #'java-runtime' # Seems to bundle it's own java runtime in '.../lib/runtime'.
  'glibc'
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'libgcc'
  'giflib'
  'libglvnd'
  'harfbuzz'
  'libjpeg'
  'lcms2'
  'libpng'
  'libstdc++'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib'
)
optdepends=()
source=(
  "${_pkgname}::git+${_url_schildirevenge_source}.git"        # schildi-revenge source code.
  "matrix-rust-sdk-schildi::git+${_url_matrix_rust_sdk}.git"  # SpiritCroc's fork of matrix-rust-sdk.
  'keybindings-readme.md'
)
sha256sums=(
  'SKIP'  # schildi-revenge source code.
  'SKIP'  # SpiritCroc's fork of matrix-rust-sdk.
  '63b85cc65b586e252565a2c33b28c87021cb1698e6352e2e662508cf4059fc8e'  # 'keybindings-readme.md'.
)
#options+=('!lto' 'debug' '!strip')
_gradle_default_options=(
  -PreleaseBuild=true
  --no-daemon
  --console verbose
  --info
  --no-parallel
)


prepare() {
  cd "${srcdir}/${_pkgname}"

  #export JAVA_HOME="/usr/lib/jvm/java-${_jdkversion}-openjdk"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Checking out git submodules ..."
  git submodule init
  git config submodule.matrix-rust-sdk.url "${srcdir}/matrix-rust-sdk-schildi"
  git -c protocol.file.allow=always submodule update

  #printf '%s\n' " --> Size-optimising PNG files ..."
  #find "${srcdir}/${_pkgname}" -name '*.png' -type f | parallel -j "`nproc`" zopflipng -m -y {} {}

  #printf '%s\n' " --> DEBUG INFO: Listing all 'gradle' tasks ..."
  #gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" tasks --all
  #exit 1

  # gradle tasks to be known that they require internet connectivity (as of 2026-05-27):
  # config:compileKotlin shim:compileKotlin composeApp:checkRuntime matrix:buildSdk matrix:compileKotlin composeApp:compileKotlinJvm composeApp:createReleaseDistributable

  printf '%s\n' " --> Running 'gradle matrix:generateFfiBindings' in non-offline mode ..."
  gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" matrix:generateFfiBindings
  # Output will be at 'matrix-rust-sdk/target/'. But just saving this, deleting the whole schildichat-revenge directory, and after re-checkout restoring 'matrix-rust-sdk/target/' does not skip re-compilation of :matrix:buildSdk and :matrix:generateFfiBindings. Would be great if there would be a way to package the Matrix Rust SDK Kotlin bindings, shared library and what is needed to build schildichat-revenge against it separately so that we can _depend_ on it as a proper Arch Linux package and not build it here, since it takes a lot of time and ressources to build.

  printf '%s\n' " --> Generating git log ..."
  git log > git.log
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-(sc)|.\1|' -e 's|-([0-9]+)$|+\1|')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}/${_pkgname}"

  #export JAVA_HOME="/usr/lib/jvm/java-${_jdkversion}-openjdk"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  #printf '%s\n' " --> DEBUG INFO: JAVA_HOME: '${JAVA_HOME}'."

  #printf '%s\n' " --> Building using 'gradle composeApp:packageReleaseUberJarForCurrentOs' in non-offline mode ..."
  #gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" composeApp:packageReleaseUberJarForCurrentOs

  printf '%s\n' " --> Building using 'gradle composeApp:createReleaseDistributable' in non-offline mode ..."  # Yes, this needs to download stuff at several stages during build :-(.
  gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" composeApp:createReleaseDistributable
}



# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   #export JAVA_HOME="/usr/lib/jvm/java-${_jdkversion}-openjdk"
#   export GRADLE_USER_HOME="${srcdir}/.gradle"
#   export RUSTUP_HOME="${srcdir}/.rustup"
#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_HOME="${srcdir}/.cargo"
#   export CARGO_TARGET_DIR=target
# 
#   printf '%s\n' " --> Running 'gradle composeApp:allTests' ..."
#   gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" --offline composeApp:allTests
# 
#   printf '%s\n' " --> Running 'gradle composeApp:check' ..."
#   gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" --offline composeApp:check
# }



package() {
  cd "${srcdir}/${_pkgname}"

  #export JAVA_HOME="/usr/lib/jvm/java-${_jdkversion}-openjdk"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  #printf '%s\n' " --> Packaging using 'gradle packageReleasePacman' ..."
  #gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" --offline packageReleasePacman  # This wouls generate an Arch Linux package file unter `composeApp/build/compose/binaries/main-release/pacman`, ready to be installed via `pacman -U`. This is not what we want, since we want `makepkg` to create the package file.
  #exit 1
  #printf '%s\n' " --> Packaging using 'gradle package' ..."
  #gradle -g "${GRADLE_USER_HOME}" "${_gradle_default_options[@]}" --offline package
  #exit 1

  local _targetdir=/usr/lib/schildichat-revenge
  local _bindir=/usr/bin
  local _composed_app_dir=composeApp/build/compose/binaries/main-release/app/schildichat-revenge

  printf '%s\n' " --> Installing main application ..."
  install -dvm755 "${pkgdir}/${_targetdir}"
  install -dvm755 "${pkgdir}/${_bindir}"

  cp -rv "${_composed_app_dir}"/* "${pkgdir}/${_targetdir}"
  ln -sv "${_targetdir}/bin/schildichat-revenge" "${pkgdir}/${_bindir}/schildichat-revenge"

  printf '%s\n' " --> Installing .desktop and icon files ..."
  install -Dvm644 -t "${pkgdir}/usr/share/applications" launcher/schildichat-revenge.desktop
  install -dvm755 "${pkgdir}/usr/share/pixmaps"
  ln -sv "${_targetdir}/lib"/schildichat-revenge.png "${pkgdir}/usr/share/pixmaps"/

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md "${srcdir}/keybindings-readme.md"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" composeApp/src/jvmMain/composeResources/files/keybindings-default.toml
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" example-config/keybindings-advanced.toml

  printf '%s\n' " --> Installing license ..."
  install -Dvm644 LICENSE                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.schildichat-revenge"
  install -Dvm644 matrix-rust-sdk/LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.matrix-rust-sdk"
}
