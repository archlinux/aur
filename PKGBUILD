# Old Maintainer: Dylan Ferris <dylan@psilly.com>
# Old Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>
# Old Maintainer: Shatur95 <genaloner@gmail.com>
# Old Maintainer: slx
# Old Co-Maintainer: Neko-san <nekoNexus at protonmail dot ch>
# Maintainer: Alexis Belmonte <alexbelm48@gmail.com>

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
# If you want additional options, there are switches below.
pkgname=unreal-engine
pkgver=5.8.0
pkgrel=1
## Check unreal-engine/Engine/Config/Linux/Linux_SDK.json (MainVersion value) for what the below should be set to
UE_SDK_VERSION="native-linux-v26_clang-20.1.8-rockylinux8"
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url=https://www.unrealengine.com/
makedepends=('git' 'openssh' 'sed' 'grep' 'glibc' 'wget' 'rsync')
depends=('sdl3' 'python' 'dotnet-runtime' 'dotnet-sdk' 'vulkan-icd-loader' 'lld' 'xdg-user-dirs' 'dos2unix' 'openssl' 'steam' 'coreutils' 'findutils')
optdepends=('polly: for potentially increased performance'
            'qt5-base: qmake build system for projects'
            'cmake: build system for projects'
            'qtcreator: IDE for projects'
            'codelite: IDE for projects'
            'kdevelop: IDE for projects'
            'clion: IDE for projects'
            'rider: IDE for projects'
            'code: IDE for projects'
            'pacman-contrib: for the paccache cleaning hook'
            'fake-ms-fonts: Font support for "demo/free/sample/example/tutorial" projects'
            'ttf-ms-fonts: Font support for "demo/free/sample/example/tutorial" projects')
license=('custom:UnrealEngine' 'GPL3')
install="${pkgname}.install"
source=("${UE_SDK_VERSION}.tar.gz::https://cdn.unrealengine.com/Toolchain_Linux/${UE_SDK_VERSION}.tar.gz"
        'unreal-engine.sh'
        'com.unrealengine.UE5Editor.desktop'
        '0001-override-shared-target-build.patch'
        '0002-adapt-android-setup-script.patch'
        '0003-disable-lumen-surface-cache-feedback-on-linux.patch'
        'unreal-engine-5-pacman-cache.hook'
        'ue5editor.svg')
sha256sums=('6eef42679b744cdcb50276f2d7cff0a51f7ddd632960e06bfbc3f6b9508ef615'
            '55a8ad79c2e502bc5919249b9d1804ad405795b36630ab2f23aeb99dd218e5f4'
            'aa09746f9db93713f470ef19390a89b279fd5a335835ad95eab6cdaafa1b9e99'
            '1cedb43efc103c384705e4e18746fed24c60c52a445e89f1acfd0f2992f5291d'
            '3da3f449c6b42d49874d8507be476b1178509be099df6f5d58683802d7e05dd2'
            'db60ce742e6d236a0a9f79b7a8b59496fa2bf003332b244f4a177d81391f83b2'
            '9386160a91594abeeaf4fe02fea562e7a4ead4c6f9a258c2a37b2e5f10e7deca'
            'b00c398b63f15084c46f3963f62a45284ecd8dae9ba6f38a2c4af370bbfdab8d')
# Not sure if compiling Unreal with LTO is legal? Lot's of different proprietary software goes into Unreal
options=('!strip' 'staticlibs') # Package is smaller with "strip" but it takes a long time and generates many warnings

# Default engine installation directory. Can be useful if you do not have a lot of space on the default storage drive
# DON'T put a "/" at the start of the path
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_INSTALL_DIR}" == "" ]]; then
  export UE_INSTALL_DIR="opt/${pkgname}"
fi

# Change this to true if you have a modern system and don't mind the extra packaging time (and size) to avoid compiling shaders on UE startup later; set to false by default for those with less robust systems
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_DDC}" != "true" && "${UE_WITH_DDC}" != "false" ]]; then
  export UE_WITH_DDC=true
fi

# Enable Win64 toolchain/components in BuildGraph for cross-compilation targets
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_WIN64}" != "true" && "${UE_WITH_WIN64}" != "false" ]]; then
  export UE_WITH_WIN64=true
fi

# Keep full debug info in produced binaries
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_FULL_DEBUG_INFO}" != "true" && "${UE_WITH_FULL_DEBUG_INFO}" != "false" ]]; then
  export UE_WITH_FULL_DEBUG_INFO=false
fi

# BuildGraph platform toggles

_ue_arch="$(uname -m)"

## Set these as environment variables in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_LINUX}" != "true" && "${UE_WITH_LINUX}" != "false" ]]; then
  if [[ "${_ue_arch}" =~ ^x86_64 ]]; then
    export UE_WITH_LINUX=true
  else
    export UE_WITH_LINUX=false
  fi
fi

if [[ "${UE_WITH_LINUX_ARM}" != "true" && "${UE_WITH_LINUX_ARM}" != "false" ]]; then
  if [[ "${_ue_arch}" =~ ^aarch64 ]]; then
    export UE_WITH_LINUX_ARM=true
  else
    export UE_WITH_LINUX_ARM=false
  fi
fi

if [[ "${UE_WITH_MAC}" != "true" && "${UE_WITH_MAC}" != "false" ]]; then
  export UE_WITH_MAC=false
fi

if [[ "${UE_WITH_ANDROID}" != "true" && "${UE_WITH_ANDROID}" != "false" ]]; then
  export UE_WITH_ANDROID=false
fi

if [[ "${UE_WITH_IOS}" != "true" && "${UE_WITH_IOS}" != "false" ]]; then
  export UE_WITH_IOS=false
fi

if [[ "${UE_WITH_TVOS}" != "true" && "${UE_WITH_TVOS}" != "false" ]]; then
  export UE_WITH_TVOS=false
fi

# BuildGraph game configurations string (semicolon-separated)
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ -z "${UE_GAME_CONFIGURATIONS}" ]]; then
  export UE_GAME_CONFIGURATIONS="Development;Shipping"
fi

# Change this if you want an alternative non-default logo for UE5's desktop icon; the default logo is enabled by default
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" != "1" && "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" != "0" ]]; then
  export UE_USE_DEFAULT_LOGO_AT_INSTALL=1
fi


## This is for detecting your CPU architecture automatically; set to false if you want to enforce your own makepkg.conf file
## Disabled by default as a compromise for those bothered by having it force-enabled

## Note: the resulting package will still be named containing "x86_64" unless the build was done with an "official" Arch distro for that architecture (like Arch ARM - [don't exactly advise using Arch ARM though])
## or if you manage to trick your Arch installation to accept other architecture extensions by fiddling with the $CARCH variable and /etc/pacman.conf - this method has flaws, namely due to a bug:
## it doesn't work with "makechrootpkg" - though, this PKGBUILD doesn't work in with this method anyway because of Github SSH Agent nonsense -- if this changes in the future, let us know

# Valid values are false / disabled / default, auto, and native

# UE_ARCH_AUTO=""

if [[ -n "$(command -v tr)" ]]; then
  # shellcheck disable=SC2006
  UE_ARCH_AUTO="$(echo "${UE_ARCH_AUTO}" | tr '[:upper:]' '[:lower:]')"
fi

case "${UE_ARCH_AUTO}" in
  "auto"|"true"|"enable"|"enabled"|"1"|"native"|"false"|"disable"|"disabled"|"2")
    :
  ;;

  *)
    UE_ARCH_AUTO=false
  ;;
esac

if [[ ${CFLAGS} =~ -O([0-9]+) ]]; then
  _ue_opt_level="-O${BASH_REMATCH[1]}"
else
  _ue_opt_level="-O3"
fi

_ue_polly_path="$(find /usr/lib /usr/lib64 -name 'LLVMPolly.so' -print -quit 2>/dev/null)"

if [[ -n "${_ue_polly_path}" ]]; then
  export CFLAGS="${CFLAGS} -fplugin=LLVMPolly.so -mllvm=-polly -mllvm=-polly-ast-use-context -mllvm=-polly-vectorizer=stripmine -mllvm=-polly-invariant-load-hoisting -mllvm=-polly-run-inliner -mllvm=-polly-run-dce"
fi

_ue_common_cflags="${_ue_opt_level} -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -Wl,-z,relro,-z,now -Wformat -Werror=format-security -fPIC -fPIE -Wp,-D_FORTIFY_SOURCE=2"
_ue_common_ldflags="-pie -Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"

_ue_is_arch_auto_enabled() {
  case "$1" in
    auto|true|enable|enabled|1) return 0 ;;
    *) return 1 ;;
  esac
}

_ue_set_arch_flags() {
  local _ue_march="$1"
  local _ue_tune="$2"

  export CFLAGS="${CFLAGS} -march=${_ue_march} ${_ue_tune} ${_ue_common_cflags}"
  export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="${_ue_common_ldflags}"
}

_ue_detect_x86_64_march() {
  local _ue_ldso="/lib/ld-linux-x86-64.so.2"
  local _ue_ld_help

  _ue_ld_help="$("${_ue_ldso}" --help 2>/dev/null || true)"

  if grep -qw "x86-64-v4 (supported" <<< "${_ue_ld_help}"; then
    echo "x86-64-v4"
  elif grep -qw "x86-64-v3 (supported" <<< "${_ue_ld_help}"; then
    echo "x86-64-v3"
  elif grep -qw "x86-64-v2 (supported" <<< "${_ue_ld_help}"; then
    echo "x86-64-v2"
  elif grep -Ewq "x86_64.*supported" <<< "${_ue_ld_help}"; then
    echo "x86-64"
  else
    echo ""
  fi
}

_ue_map_build_arch() {
  local _ue_source_arch="$1"

  case "${_ue_source_arch}" in
    x86_64) echo "x64" ;;
    aarch64) echo "arm64" ;;
    *) echo "" ;;
  esac
}

_ue_build_arch="$(_ue_map_build_arch "${_ue_arch}")"

if _ue_is_arch_auto_enabled "${UE_ARCH_AUTO}"; then
  if [[ "${_ue_arch}" == "x86_64" ]]; then
    _ue_detected_march="$(_ue_detect_x86_64_march)"

    if [[ -n "${_ue_detected_march}" ]]; then
      _ue_set_arch_flags "${_ue_detected_march}" ""
    else
      msg "Could not detect a supported x86_64 micro-architecture level. Exiting."
      return 1
    fi
  elif [[ "${_ue_arch}" == "aarch64" ]]; then
    _ue_set_arch_flags "aarch64" ""
  else
    msg "Architecture '${_ue_arch}' is not supported! Exiting."
    return 1
  fi
elif [[ "${UE_ARCH_AUTO}" == "native" ]]; then
  _ue_set_arch_flags "native" "-mtune=native"
fi

case "${UE_ARCH_AUTO}" in
  "auto"|"true"|"enable"|"enabled"|"native"|"1")
    :
  ;;

  *)
    if [[ -n "${_ue_polly_path}" ]]; then
      ## Make sure that if polly is installed and the auto-flags above are not used, to add the polly flags to CXXFLAGS for consistency with having them set as CFLAGS
      CXXFLAGS="${CXXFLAGS} -fplugin=LLVMPolly.so -mllvm=-polly -mllvm=-polly-ast-use-context -mllvm=-polly-vectorizer=stripmine -mllvm=-polly-invariant-load-hoisting -mllvm=-polly-run-inliner -mllvm=-polly-run-dce"
    fi
  ;;
esac

# Causes a SEGV during derived data cache build if not set
export DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0

prepare() {
  if [[ "${UE_WITH_ANDROID}" == "yes" ]]; then
    if ! pacman -Q android-studio >/dev/null 2>&1; then
      error "You need to install Android Studio with its cmdline-tools package first before compiling Unreal Engine with Android export support"
    elif [[ ! -d "/opt/android-studio/cmdline-tools/latest/bin" ]]; then
      error "You installed Android Studio, but you haven't installed the cmdline-tools SDK package yet. Please install it first and try again."
    fi
  fi

  # Check access to the repository
  if ! git ls-remote git@github.com:EpicGames/UnrealEngine &>/dev/null; then
    error 'You must register at unrealengine.com and link your github account to access this private repo. See the wiki for more info: https://wiki.archlinux.org/index.php/Unreal_Engine_4'
    exit 1
  fi

  local _ue_install_path="/${UE_INSTALL_DIR#/}"
  local _ue_arch_detail=""
  local _ue_use_system_clang="no"
  local _ue_ddc_text="no"
  local _ue_debug_text="no"
  local _ue_default_logo_text="yes"
  local _ue_target_platforms=()
  local _ue_platforms_csv="none"

  [[ "${UE_USE_SYSTEM_CLANG}" == "true" ]]          && _ue_use_system_clang="yes"
  [[ "${UE_WITH_DDC}" == "true" ]]                  && _ue_ddc_text="yes"
  [[ "${UE_WITH_FULL_DEBUG_INFO}" == "true" ]]      && _ue_debug_text="yes"
  [[ "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" == "0" ]]  && _ue_default_logo_text="no"

  [[ "${UE_WITH_WIN64}" == "true" ]]     && _ue_target_platforms+=("Windows")
  [[ "${UE_WITH_LINUX}" == "true" ]]     && _ue_target_platforms+=("Linux")
  [[ "${UE_WITH_LINUX_ARM}" == "true" ]] && _ue_target_platforms+=("Linux (ARM)")
  [[ "${UE_WITH_MAC}" == "true" ]]       && _ue_target_platforms+=("macOS")
  [[ "${UE_WITH_TVOS}" == "true" ]]      && _ue_target_platforms+=("tvOS")
  [[ "${UE_WITH_ANDROID}" == "true" ]]   && _ue_target_platforms+=("Android")
  [[ "${UE_WITH_IOS}" == "true" ]]       && _ue_target_platforms+=("iOS")

  if (( ${#_ue_target_platforms[@]} > 0 )); then
    local IFS=";"
    _ue_platforms_csv="${_ue_target_platforms[*]}"
  fi

  msg ''
  msg "Unreal Engine ${pkgver} build options summary:"
  msg ''
  msg "- End package installation path:            ${_ue_install_path}"
  msg "- Integrate prebuilt shader cache:          ${_ue_ddc_text}"
  msg ''
  msg "- Target platforms supported for export:    ${_ue_platforms_csv}"
  msg "- Game configurations:                      ${UE_GAME_CONFIGURATIONS}"
  msg "- Include full debug info:                  ${_ue_debug_text}"
  msg "- Use default logo at install:              ${_ue_default_logo_text}"
  msg ''

  # Download Unreal Engine source or update if the folder exists
  if [[ ! -d "${pkgname}" ]]
  then
    git clone --depth=1 --branch=${pkgver}-release git@github.com:EpicGames/UnrealEngine "${pkgname}"
    cd "${pkgname}" || return
  else
    cd "${pkgname}" || return

    current_cloned_ver="$(git describe --tags --always)"
    if [[ "${current_cloned_ver}" != "${pkgver}-release" ]]; then
      cd ..
      rm -rf "${pkgname}"
      git clone --depth=1 --branch=${pkgver}-release git@github.com:EpicGames/UnrealEngine "${pkgname}"
      cd "${pkgname}" || return
    else
      rm -f .git/index.lock
      git fetch --depth=1 origin tag ${pkgver}-release
      git reset --hard ${pkgver}-release
    fi
  fi

  for patch_file in ../*.patch; do
    msg "Applying ${patch_file}" 

    if ! patch -p1 -i "${patch_file}"; then
      msg "Some or all of the patch at ${patch_file} failed to apply. Will still try to build."
    fi
  done

  # Qt Creator source code access
  if [[ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]]
  then
    # https://github.com/fire-archive/QtCreatorSourceCodeAccess - See for usage
    git -C Engine/Plugins/Developer clone --depth=1 https://github.com/fire-archive/QtCreatorSourceCodeAccess
  fi

  # For some reason, despite this file explicitly asking not to be removed, it was removed from the UE5 source; it has to be re-added or the build will fail
  if [[ ! -f ${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies ]]
  then
    mkdir -p "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/"
    touch "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies"
    sed -i "1c\This file must have no extension so that GitDeps considers it a binary dependency - it will only be pulled by the Setup script if Linux is enabled. Please do not remove this file." "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies"
  fi
  
  # Ensure UVS registration is non-interactive during package builds.
  if [[ -f Setup.sh ]]; then
    sed -i 's#UnrealVersionSelector-Linux-Shipping -register > /dev/null &#UnrealVersionSelector-Linux-Shipping -register -unattended > /dev/null \&#' Setup.sh
  fi

  mkdir -p "${srcdir}/git-deps"
  ./Setup.sh --cache="${srcdir}/git-deps"
  cd "${srcdir}/${pkgname}/Engine/Build/BatchFiles/Linux/" || return

  ## This should just be working, but somehow isn't: https://aur.archlinux.org/packages/unreal-engine#comment-986166
  #./Engine/Build/BatchFiles/Linux/SetupToolchain.sh
  ## So, we're doing this instead:
  mkdir -p "${srcdir}/${pkgname}/Engine/Extras/ThirdPartyNotUE/SDKs/HostLinux/Linux_x64/"
  tar -xvf "${srcdir}/${UE_SDK_VERSION}.tar.gz" -C "${srcdir}/${pkgname}/Engine/Extras/ThirdPartyNotUE/SDKs/HostLinux/Linux_x64/"

  "${srcdir}"/"${pkgname}"/Engine/Build/BatchFiles/Linux/BuildThirdParty.sh
  "${srcdir}"/"${pkgname}"/Engine/Build/BatchFiles/Linux/SetupDotnet.sh
  "${srcdir}"/"${pkgname}"/Engine/Build/BatchFiles/Linux/FixDependencyFiles.sh

  if [[ "${UE_WITH_ANDROID}" == "yes" ]]; then
    "${srcdir}"/"${pkgname}"/Engine/Extras/Android/SetupAndroid.sh
  fi
}

build() {
  cd "${pkgname}" || return

  # Rebuild UBT from patched source so the pre-built dll is replaced before BuildGraph runs.
  # RunUBT.sh skips the rebuild when InstalledBuild.txt exists, so we must do it explicitly here.
  dotnet build "Engine/Source/Programs/UnrealBuildTool/UnrealBuildTool.csproj" \
    -c Development \
    -o "Engine/Binaries/DotNET/UnrealBuildTool" \
    --no-self-contained \
    -p:GenerateDocumentationFile=false

  if [[ $? -ne 0 ]]; then
    msg 'Error: Failed to rebuild UnrealBuildTool.'
    exit $?
  fi

  "Engine/Build/BatchFiles/RunUAT.sh" BuildGraph \
    -target="Make Installed Build Linux" \
    -script=Engine/Build/InstalledEngineBuild.xml \
    -nosign \
    -set:WithDDC="${UE_WITH_DDC}" \
    -set:WithLinux="${UE_WITH_LINUX}" \
    -set:WithLinuxArm64="${UE_WITH_LINUX_ARM}" \
    -set:WithWin64="${UE_WITH_WIN64}" \
    -set:WithMac="${UE_WITH_MAC}" \
    -set:WithAndroid="${UE_WITH_ANDROID}" \
    -set:WithIOS="${UE_WITH_IOS}" \
    -set:WithTVOS="${UE_WITH_TVOS}" \
    -set:GameConfigurations="${UE_GAME_CONFIGURATIONS}" \
    -set:WithFullDebugInfo="${UE_WITH_FULL_DEBUG_INFO}"

  if [[ $? -ne 0 ]]; then
    msg "Error: Build failed; try searching the output for suspicious messages." >&2
    return;
  fi
}

package() {
  # Desktop entry
  if [[ ! -f com.unrealengine.UE5Editor.desktop && -f com.unrealengine.UE4Editor.desktop ]]; then
    cp com.unrealengine.UE4Editor.desktop com.unrealengine.UE5Editor.desktop
  fi
  
  sed -i "7c\Exec=/usr/bin/unreal-engine %U" com.unrealengine.UE5Editor.desktop
  sed -i "14c\Path=/usr/bin/" com.unrealengine.UE5Editor.desktop
  install -Dm644 com.unrealengine.UE5Editor.desktop "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop"
  chmod +x "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop"

  ## Install a pacman hook to keep old builds from compounding cache by tens of GBs - 2 builds alone can reach at least 30 GBs in pacman's cache; having one only takes up about 15 GBs
  install -Dm775 unreal-engine-5-pacman-cache.hook "${pkgdir}/etc/pacman.d/hooks/unreal-engine-5-pacman-cache.hook"
  
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/share/applications/"

  # Icon for Desktop entry
  if [[ "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" == "1" ]]; then
    install -Dm644 ue5editor.svg "${pkgdir}/usr/share/pixmaps/ue5editor.svg"
  else
    mv ue5editor.svg ue5editor.svg.bak
    wget --output-document "ue5editor.svg" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/apps/scalable/ue4editor.svg"
    install -Dm644 ue5editor.svg "${pkgdir}/usr/share/pixmaps/ue5editor.svg"
    wget --output-document "LICENSE" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/LICENSE"
    mkdir -p "${pkgdir}/usr/share/UnrealEngine/EliverLara-candy-icons/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/UnrealEngine/EliverLara-candy-icons/"
    rm ue5editor.svg
    rm LICENSE
    mv ue5editor.svg.bak ue5editor.svg
  fi

  # License
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md"  "${pkgdir}/usr/share/licenses/UnrealEngine/LICENSE.md"
  
  # Engine
  install -dm755 "${pkgdir}/${UE_INSTALL_DIR}/Engine"
  
  # Copy LocalBuilds to pkg...
  rsync -a "${srcdir}/${pkgname}/LocalBuilds/Engine/Linux/" "${pkgdir}/${UE_INSTALL_DIR}/"
  if [[ -f "${srcdir}/${pkgname}/LocalBuilds/Engine/Linux/Engine/Binaries/Linux/UnrealEditor" ]]; then
    # Can never be too careful with recursive rm...
    rm -r "${srcdir}/${pkgname}/LocalBuilds"
  fi

  # Ensure InstalledBuild.txt is present so UBT treats this as an installed engine,
  # preventing the "unique build environment" error when building projects.
  printf '%s' "${pkgver}" | install -Dm644 /dev/stdin "${pkgdir}/${UE_INSTALL_DIR}/Engine/Build/InstalledBuild.txt"

  # Copy the rest of it to pkg... Should we be overwriting LocalBuilds?
  rsync -a --exclude='Intermediate/' "${srcdir}/${pkgname}/" "${pkgdir}/${UE_INSTALL_DIR}/"

  # The BuildGraph staging copies the unpatched UBT DLL from CsTools into LocalBuilds,
  # which then overwrites our patched build. Re-stamp both locations with the patched DLL.
  local _ubtsrcdir="${srcdir}/${pkgname}/Engine/Source/Programs/UnrealBuildTool"
  local _ubtpkgdir="${pkgdir}/${pkgname}/${UE_INSTALL_DIR}/Engine/Binaries/DotNET/UnrealBuildTool"

  if [[ -x "$(find "${pkgdir}/${UE_INSTALL_DIR}" -type f -iname 'xbuild')" ]]; then
    find "${pkgdir}/${UE_INSTALL_DIR}" -type f -iname 'xbuild' -exec chmod +x "{}" \;
  fi
  
  if [[ -x "$(find "${pkgdir}/${UE_INSTALL_DIR}" -type f -iname 'mcs')" ]]; then
    find "${pkgdir}/${UE_INSTALL_DIR}" -type f -iname 'mcs' -exec chmod +x "{}" \;
  fi
  
  ## Do this, in case the path doesn't exist for some reason
  mkdir -p "${pkgdir}/${UE_INSTALL_DIR}/Engine/Binaries/Android/"
  
  # Launch script to initialize missing user folders for Unreal Engine
  install -Dm755 ../unreal-engine.sh "${pkgdir}/usr/bin/unreal-engine"
  chmod +x "${pkgdir}/usr/bin/unreal-engine"
  ln -s "${pkgdir}/usr/bin/unreal-engine" "${pkgdir}/usr/bin/ue5"
  ln -s "${pkgdir}/usr/bin/unreal-engine" "${pkgdir}/usr/bin/UE5"
  ln -s "${pkgdir}/usr/bin/unreal-engine" "${pkgdir}/usr/bin/unreal-engine-5"
  chmod 755 "${pkgdir}/usr/bin/ue5" "${pkgdir}/usr/bin/UE5" "${pkgdir}/usr/bin/unreal-engine-5"
  
  # Configuring the launch script to detect when it has been run for the first time
  # Note: Requires that there isn't already a UE5 desktop entry in "${HOME}/local/share/applications/" - delete yours if you have one there before installing this
  DesktopFileChecksum=$(sha256sum "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop" | cut -f 1 -d ' ')
  sed -i "s|ChecksumPlaceholder|${DesktopFileChecksum}|" "${pkgdir}/usr/bin/unreal-engine"
  sed -i "s|InstalledLocationPlaceholder|/${UE_INSTALL_DIR}/Engine/Binaries|" "${pkgdir}/usr/bin/unreal-engine"

  # Ship the resolved install prefix so the .install scriptlet can locate the tree
  # even when a custom UE_INSTALL_DIR was used at build time.
  printf '/%s\n' "${UE_INSTALL_DIR#/}" \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/${pkgname}/install-prefix"

  # Bake group-writability into the package so members of the 'unreal' group can
  # write engine build/runtime artifacts without a manual chown. The group OWNER
  # is set at install time by the scriptlet, since a -r group's GID is unknown here.
  chmod -R g+w "${pkgdir}/${UE_INSTALL_DIR}"
  find "${pkgdir}/${UE_INSTALL_DIR}" -type d -exec chmod g+s {} +
}
