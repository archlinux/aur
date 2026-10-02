# Maintainer: Finley Laempe <finley.laempe@web.de>
# Contributor: Alexis Belmonte <alexbelm48@gmail.com>
# Contributor: Neko-san <nekoNexus at protonmail dot ch>
# Contributor: Dylan Ferris <dylan@psilly.com>
# Contributor: Michael Lojkovic <mikelojkovic@gmail.com>
# Contributor: Shatur95 <genaloner@gmail.com>
# Contributor: slx
#
# Based on the `unreal-engine` AUR package (https://aur.archlinux.org/packages/unreal-engine),
# maintained by Alexis Belmonte. The build logic in this PKGBUILD, the launcher, desktop
# entry, pacman hook and icon are copied from it, and its patches are taken automatically
# from its newest release of each Unreal Engine version.
# Patches in this package: upstream commit dc9aa87 (5.8.2, Alexis Belmonte)
#
# Per-minor parallel-install variant, published from:
#   https://github.com/FinleyLaempe/aur-unreal-engine-src

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
# If you want additional options, there are switches below.
pkgname=unreal-engine-src-5.8
pkgver=5.8.3
pkgrel=1
_uetag="${pkgver}-release"
_ueminor="5.8"
_ueminor_us="5_8"
# Empty override = parse from cloned UE5 repo's Engine/Config/Linux/Linux_SDK.json at build time
_ue_sdk_override=""
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url=https://www.unrealengine.com/
makedepends=('git' 'openssh' 'sed' 'grep' 'glibc' 'wget' 'rsync' 'curl')
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
# Toolchain tarball is NOT in source=(); downloaded by prepare() after clone
# once SDK_VERSION is known (either from  or parsed
# from the cloned UE5 repo's Engine/Config/Linux/Linux_SDK.json).
source=('unreal-engine-5.8.sh'
        'com.unrealengine.UE5_8Editor.desktop'
        '0001-override-shared-target-build.patch'
        '0002-adapt-android-setup-script.patch'
        '0003-disable-lumen-surface-cache-feedback-on-linux.patch'
        'unreal-engine-src-5.8-pacman-cache.hook'
        'ue5_8editor.svg')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
# Not sure if compiling Unreal with LTO is legal? Lot's of different proprietary software goes into Unreal
# 'staticlibs' kept: the installed engine ships .a files needed to link C++ projects.
# 'strip' left ON (no '!strip'): UE5 debug symbols add tens of GiB; stripping is the
# single biggest size win.
# '!debug': do NOT emit a separate -debug subpackage. Its files live under
# /usr/lib/debug/.build-id/<hash> keyed by content hash, so two minors that share
# any identical object collide on install (e.g. 5.4-debug vs 5.7-debug) — which
# would break parallel installation of multiple unreal-engine-src-5.X packages.
# We strip and discard the symbols instead of packaging them.
options=('staticlibs' '!debug')

# Default engine installation directory. Can be useful if you do not have a lot of space on the default storage drive
# DON'T put a "/" at the start of the path
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_INSTALL_DIR}" == "" ]]; then
  export UE_INSTALL_DIR="opt/unreal-engine-src-5.8"
fi

# Change this to true if you have a modern system and don't mind the extra packaging time (and size) to avoid compiling shaders on UE startup later; set to false by default for those with less robust systems
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_DDC}" != "true" && "${UE_WITH_DDC}" != "false" ]]; then
  # Skip the prebuilt Derived Data Cache by default: it adds hours to the
  # build (compiles shader permutations for every sample asset) and the
  # Editor compiles shaders on first launch anyway. Override with
  # UE_WITH_DDC=true in /etc/makepkg.conf or on the makepkg command line if
  # you want the shipped-shader experience at the cost of build time.
  export UE_WITH_DDC=false
fi

# Enable Win64 toolchain/components in BuildGraph for cross-compilation targets.
# Default false: shipping the Win64 cross toolchain + binaries adds ~10-20 GiB to
# the package and is useless unless you actually cross-compile for Windows.
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_WIN64}" != "true" && "${UE_WITH_WIN64}" != "false" ]]; then
  export UE_WITH_WIN64=false
fi

# Keep full debug info in produced binaries
## Set this as an environment variable in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_FULL_DEBUG_INFO}" != "true" && "${UE_WITH_FULL_DEBUG_INFO}" != "false" ]]; then
  export UE_WITH_FULL_DEBUG_INFO=false
fi

# BuildGraph platform toggles
## Set these as environment variables in /etc/makepkg.conf if you want predefined behavior
if [[ "${UE_WITH_LINUX}" != "true" && "${UE_WITH_LINUX}" != "false" ]]; then
  export UE_WITH_LINUX=true
fi

# Linux AArch64 (arm64) target. InstalledEngineBuild.xml defaults this ON
# (DefaultWithLinuxArm64=true), which cross-compiles a full second arm64 target
# on an x86_64 host: it roughly doubles build time and package size, and host
# strip/fakeroot can't process the arm64 .a/.debug files (harmless warnings).
# Default false; set UE_WITH_LINUX_ARM64=true if you actually ship to arm64 Linux.
if [[ "${UE_WITH_LINUX_ARM64}" != "true" && "${UE_WITH_LINUX_ARM64}" != "false" ]]; then
  export UE_WITH_LINUX_ARM64=false
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

# Optional BuildGraph architecture override: x64 or arm64
## Leave unset to auto-detect from host architecture
if [[ -n "${UE_BUILD_ARCH_OVERRIDE}" && "${UE_BUILD_ARCH_OVERRIDE}" != "x64" && "${UE_BUILD_ARCH_OVERRIDE}" != "arm64" ]]; then
  msg "Invalid UE_BUILD_ARCH_OVERRIDE='${UE_BUILD_ARCH_OVERRIDE}'. Expected 'x64' or 'arm64'. Ignoring override."
  unset UE_BUILD_ARCH_OVERRIDE
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

_ue_arch="$(uname -m)"

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

if [[ -n "${UE_BUILD_ARCH_OVERRIDE}" ]]; then
  _ue_build_arch="${UE_BUILD_ARCH_OVERRIDE}"
else
  _ue_build_arch="$(_ue_map_build_arch "${_ue_arch}")"
fi

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

# Ported from upstream (5.8.2): the Roslyn compiler server coordinates through named
# mutexes backed by lock files under ${TMPDIR}/.dotnet/shm; concurrent MSBuild nodes
# racing on them intermittently fail with "MSB3883: ReleaseMutex failed". Compiling
# in-process sidesteps the server (MSBuild reads this as a global property, so it
# also covers BuildGraph/UAT), and disabling node reuse stops stale nodes outliving
# makepkg.
export UseSharedCompilation=false
export MSBUILDDISABLENODEREUSE=1

prepare() {
  # --- Probe GitHub access (SSH first, HTTPS fallback) ---
  local _ue_remote_ssh="git@github.com:EpicGames/UnrealEngine.git"
  local _ue_remote_https="https://github.com/EpicGames/UnrealEngine.git"
  local _ue_remote=""

  msg "Probing GitHub access to EpicGames/UnrealEngine..."
  if git ls-remote "${_ue_remote_ssh}" &>/dev/null; then
    _ue_remote="${_ue_remote_ssh}"
    msg "  -> SSH OK, using ${_ue_remote}"
  elif git ls-remote "${_ue_remote_https}" &>/dev/null; then
    _ue_remote="${_ue_remote_https}"
    msg "  -> SSH failed, HTTPS OK, using ${_ue_remote}"
  else
    error "Cannot access EpicGames/UnrealEngine via SSH or HTTPS."
    error "You must:"
    error "  1. Have a GitHub account linked to your Epic Games account:"
    error "     https://www.unrealengine.com/en-US/ue-on-github"
    error "  2. Accept the @EpicGames org invitation in your GitHub inbox."
    error "  3. Configure either:"
    error "     - SSH: 'ssh -T git@github.com' must succeed with your key"
    error "     - HTTPS: 'gh auth login' or git credential helper with PAT (repo scope)"
    error "Probed: ${_ue_remote_ssh} and ${_ue_remote_https}"
    exit 1
  fi

  # --- Build config summary (preserved from upstream lines 255–311) ---
  local _ue_commit="not-cloned"
  local _ue_install_path="/${UE_INSTALL_DIR#/}"
  local _ue_arch_label="${_ue_build_arch:-unknown}"
  local _ue_arch_detail=""
  local _ue_ddc_text="no"
  local _ue_debug_text="no"
  local _ue_default_logo_text="yes"
  local _ue_target_platforms=()
  local _ue_platforms_csv="none"

  if [[ -d "${pkgname}/.git" ]]; then
    _ue_commit="$(git -C "${pkgname}" rev-parse --short HEAD 2>/dev/null || echo unknown)"
  fi
  if [[ "${_ue_arch_label}" == "x64" ]]; then
    if [[ -n "${_ue_detected_march}" ]]; then
      _ue_arch_detail=" (${_ue_detected_march})"
    elif [[ ${CFLAGS} =~ -march=([^[:space:]]+) ]]; then
      _ue_arch_detail=" (${BASH_REMATCH[1]})"
    else
      _ue_arch_detail=" (x86_64)"
    fi
  elif [[ "${_ue_arch_label}" == "arm64" ]]; then
    if [[ ${CFLAGS} =~ -march=([^[:space:]]+) ]]; then
      _ue_arch_detail=" (${BASH_REMATCH[1]})"
    else
      _ue_arch_detail=" (aarch64)"
    fi
  fi
  [[ "${UE_WITH_DDC}" == "true" ]]                  && _ue_ddc_text="yes"
  [[ "${UE_WITH_FULL_DEBUG_INFO}" == "true" ]]      && _ue_debug_text="yes"
  [[ "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" == "0" ]]  && _ue_default_logo_text="no"
  [[ "${UE_WITH_WIN64}" == "true" ]]    && _ue_target_platforms+=("Windows")
  [[ "${UE_WITH_LINUX}" == "true" ]]    && _ue_target_platforms+=("Linux")
  [[ "${UE_WITH_MAC}" == "true" ]]      && _ue_target_platforms+=("macOS")
  [[ "${UE_WITH_TVOS}" == "true" ]]     && _ue_target_platforms+=("tvOS")
  [[ "${UE_WITH_ANDROID}" == "true" ]]  && _ue_target_platforms+=("Android")
  [[ "${UE_WITH_IOS}" == "true" ]]      && _ue_target_platforms+=("iOS")
  if (( ${#_ue_target_platforms[@]} > 0 )); then
    local IFS=", "
    _ue_platforms_csv="${_ue_target_platforms[*]}"
  fi
  msg ''
  msg "Unreal Engine ${pkgver} (commit ${_ue_commit}) build options summary:"
  msg ''
  msg "- End package installation path:            ${_ue_install_path}"
  msg "- Target architecture build:                ${_ue_arch_label}${_ue_arch_detail}"
  msg "- Integrate prebuilt shader cache:          ${_ue_ddc_text}"
  msg "- Target platforms supported for export:    ${_ue_platforms_csv}"
  msg "- Game configurations:                      ${UE_GAME_CONFIGURATIONS}"
  msg "- Include full debug info:                  ${_ue_debug_text}"
  msg "- Use default logo at install:              ${_ue_default_logo_text}"
  msg ''

  # --- Clone or update UE5 source ---
  if [[ ! -d "${pkgname}" ]]; then
    git clone --depth=1 --branch="${_uetag}" "${_ue_remote}" "${pkgname}"
  else
    cd "${pkgname}"
    if [[ "$(git describe --tags 2>/dev/null)" != "${_uetag}" ]]; then
      cd .. && rm -rf "${pkgname}"
      git clone --depth=1 --branch="${_uetag}" "${_ue_remote}" "${pkgname}"
    else
      rm -f .git/index.lock
      git fetch --depth=1 origin tag "${_uetag}"
      git reset --hard "${_uetag}"
      cd ..
    fi
  fi

  # --- Apply patches (upstream's for this minor + local extras; continues on failure per upstream behaviour) ---
  for patch_file in ../*.patch; do
    [[ -f "${patch_file}" ]] || continue
    msg "Applying ${patch_file}"
    if ! patch -p1 -d "${pkgname}" -i "${patch_file}"; then
      msg "Some or all of the patch at ${patch_file} failed to apply. Will still try to build."
    fi
  done

  cd "${pkgname}" || return

  # --- Qt Creator source code access (preserved from upstream) ---
  if [[ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]]; then
    git -C Engine/Plugins/Developer clone --depth=1 https://github.com/fire-archive/QtCreatorSourceCodeAccess
  fi

  # --- HaveLinuxDependencies marker (preserved from upstream) ---
  if [[ ! -f Engine/Source/ThirdParty/Linux/HaveLinuxDependencies ]]; then
    mkdir -p Engine/Source/ThirdParty/Linux/
    touch Engine/Source/ThirdParty/Linux/HaveLinuxDependencies
    sed -i "1c\This file must have no extension so that GitDeps considers it a binary dependency - it will only be pulled by the Setup script if Linux is enabled. Please do not remove this file." Engine/Source/ThirdParty/Linux/HaveLinuxDependencies
  fi

  # --- Suppress UnrealVersionSelector self-registration in Setup.sh ---
  # Setup.sh runs `UnrealVersionSelector-Linux-Shipping -register`, which writes
  # an engine-ID -> path map to ~/.config/Epic/UnrealEngine/Install.ini and drops
  # com.epicgames.* desktop entries (an "editor" and a "generate project files"
  # applet). At BUILD time those record the transient build-tree path, not the
  # final /${UE_INSTALL_DIR}, so they would point nowhere post-install. We strip
  # the build-time call and instead register at first launch from the launcher,
  # where UVS runs from the real /${UE_INSTALL_DIR} binary and records the
  # correct path (so .uproject double-click/right-click associations work).
  if [[ -f Setup.sh ]]; then
    sed -i '/UnrealVersionSelector-Linux-Shipping -register/d' Setup.sh
  fi

  # --- Resolve SDK_VERSION ---
  # MUST happen BEFORE Setup.sh: SetupToolchain.sh (invoked by Setup.sh)
  # downloads the toolchain itself, and Epic's CDN download path is slow/
  # flaky enough that it routinely fails partway through. By extracting our
  # own tarball into the expected destination first, SetupToolchain.sh's
  # "already installed" check passes and the embedded downloader is skipped
  # entirely.
  local _sdk_ver="${_ue_sdk_override}"
  if [[ -z "${_sdk_ver}" ]]; then
    # Newer UE (5.1+) declares the toolchain in Engine/Config/Linux/Linux_SDK.json
    # ("MainVersion"). Older UE (e.g. 5.0) has no such JSON and instead hardcodes
    # it in UnrealBuildTool's LinuxPlatformSDK.cs GetMainVersion() as
    #   return "v20_clang-13.0.1-centos7";
    # Try the JSON first, then fall back to parsing the .cs return string.
    local _sdk_json="${srcdir}/${pkgname}/Engine/Config/Linux/Linux_SDK.json"
    local _sdk_cs="${srcdir}/${pkgname}/Engine/Source/Programs/UnrealBuildTool/Platform/Linux/LinuxPlatformSDK.cs"
    if [[ -f "${_sdk_json}" ]]; then
      _sdk_ver=$(grep -oE '"MainVersion"[[:space:]]*:[[:space:]]*"[^"]+"' "${_sdk_json}" | \
                 sed -E 's/.*"MainVersion"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
    elif [[ -f "${_sdk_cs}" ]]; then
      # First `return "v<NN>_clang-...";` inside GetMainVersion(). Excludes the
      # `// Example: v11_...` comment because grep matches the `return "` prefix.
      _sdk_ver=$(grep -oE 'return[[:space:]]+"v[0-9]+_clang-[^"]+"' "${_sdk_cs}" | \
                 head -1 | sed -E 's/.*"(v[0-9]+_clang-[^"]+)".*/\1/')
    else
      error "Cannot find ${_sdk_json} or ${_sdk_cs}; cannot resolve SDK_VERSION."
      exit 1
    fi
  fi
  if [[ -z "${_sdk_ver}" ]]; then
    error "Failed to parse SDK_VERSION from Linux_SDK.json or LinuxPlatformSDK.cs."
    exit 1
  fi
  # Linux_SDK.json's MainVersion is the bare toolchain identifier
  # (e.g. "v26_clang-20.1.8-rockylinux8"). Epic's CDN serves it as
  # "native-linux-<MainVersion>.tar.gz" so add the prefix if it's not
  # already present (handles user overrides that already include it).
  local _sdk_basename="${_sdk_ver}"
  if [[ "${_sdk_basename}" != native-linux-* ]]; then
    _sdk_basename="native-linux-${_sdk_basename}"
  fi
  msg "Resolved SDK_VERSION=${_sdk_ver} (tarball: ${_sdk_basename}.tar.gz)"

  # --- Download + extract toolchain (before Setup.sh) ---
  local _sdk_url="https://cdn.unrealengine.com/Toolchain_Linux/${_sdk_basename}.tar.gz"
  local _sdk_tar="${srcdir}/${_sdk_basename}.tar.gz"
  # Host toolchain dir is named by host arch (Linux_x64 / Linux_arm64). Use the
  # arch we already detected from uname so an arm64 host extracts to the right
  # place instead of a hardcoded x64 path.
  local _sdk_dest="${srcdir}/${pkgname}/Engine/Extras/ThirdPartyNotUE/SDKs/HostLinux/Linux_${_ue_build_arch:-x64}/"
  if [[ ! -f "${_sdk_tar}" ]]; then
    msg "Downloading SDK toolchain from ${_sdk_url}"
    curl -fL --retry 3 -o "${_sdk_tar}" "${_sdk_url}" || {
      error "Failed to download SDK toolchain from ${_sdk_url}"
      exit 1
    }
  fi
  mkdir -p "${_sdk_dest}"
  # Only extract if not already done (idempotent across resume attempts).
  if [[ ! -d "${_sdk_dest}${_sdk_basename}" ]]; then
    msg "Extracting SDK toolchain to ${_sdk_dest}"
    tar -xf "${_sdk_tar}" -C "${_sdk_dest}"
  else
    msg "SDK toolchain already extracted at ${_sdk_dest}${_sdk_basename}"
  fi

  # --- Setup.sh (now sees existing toolchain, skips its own download) ---
  ./Setup.sh
  cd "${srcdir}" || return

  # --- Build third-party + dotnet setup (preserved from upstream) ---
  "${srcdir}/${pkgname}/Engine/Build/BatchFiles/Linux/BuildThirdParty.sh"
  "${srcdir}/${pkgname}/Engine/Build/BatchFiles/Linux/SetupDotnet.sh"
  "${srcdir}/${pkgname}/Engine/Build/BatchFiles/Linux/FixDependencyFiles.sh"
}

build() {
  cd "${pkgname}" || return

  # Rebuild UBT from patched source so the pre-built dll is replaced before BuildGraph runs.
  # RunUBT.sh skips the rebuild when InstalledBuild.txt exists, so we must do it explicitly here.
  if ! dotnet build "Engine/Source/Programs/UnrealBuildTool/UnrealBuildTool.csproj" \
    -c Development \
    -o "Engine/Binaries/DotNET/UnrealBuildTool" \
    --no-self-contained \
    -p:GenerateDocumentationFile=false; then
    error 'Failed to rebuild UnrealBuildTool.'
    return 1
  fi

  local _ue_buildgraph_arch_arg=()

  if [[ -n "${_ue_build_arch}" ]]; then
    _ue_buildgraph_arch_arg=(-set:BuildArchitecture="${_ue_build_arch}")
  fi

  # DDC commandlet routinely SIGSEGVs at editor shutdown (LockFreeFixedSizeAllocator
  # assertion, UE5 Vulkan-RHI cleanup bug). When the user hasn't explicitly opted
  # in, skip the BuildGraph node by name in addition to -set:WithDDC=false so a
  # stale env value can't reintroduce the crash. The editor compiles shaders on
  # first launch instead.
  local _ue_buildgraph_extra=()
  if [[ "${UE_WITH_DDC}" != "true" ]]; then
    _ue_buildgraph_extra+=(-IgnoreNode="Build Derived Data Cache")
  fi

  # Platform selection matches the proven upstream unreal-engine PKGBUILD: pass
  # each -set:With* explicitly (no HostPlatformOnly). The per-platform defaults
  # come from the UE_WITH_* env block above; WithLinuxArm64 is the one we add on
  # top of upstream to skip the arm64 cross-compile by default.
  if ! "Engine/Build/BatchFiles/RunUAT.sh" BuildGraph \
    -target="Make Installed Build Linux" \
    -script=Engine/Build/InstalledEngineBuild.xml \
    -nosign \
    "${_ue_buildgraph_arch_arg[@]}" \
    "${_ue_buildgraph_extra[@]}" \
    -set:WithDDC="${UE_WITH_DDC}" \
    -set:WithLinux="${UE_WITH_LINUX}" \
    -set:WithLinuxArm64="${UE_WITH_LINUX_ARM64}" \
    -set:WithWin64="${UE_WITH_WIN64}" \
    -set:WithMac="${UE_WITH_MAC}" \
    -set:WithAndroid="${UE_WITH_ANDROID}" \
    -set:WithIOS="${UE_WITH_IOS}" \
    -set:WithTVOS="${UE_WITH_TVOS}" \
    -set:GameConfigurations="${UE_GAME_CONFIGURATIONS}" \
    -set:WithFullDebugInfo="${UE_WITH_FULL_DEBUG_INFO}"; then
    error "Build failed; try searching the output for suspicious messages."
    return 1
  fi
}

package() {
  # Desktop entry (rendered with correct Exec + Path per minor; no sed needed)
  install -Dm644 "com.unrealengine.UE${_ueminor_us}Editor.desktop" \
    "${pkgdir}/usr/share/applications/com.unrealengine.UE${_ueminor_us}Editor.desktop"
  chmod +x "${pkgdir}/usr/share/applications/com.unrealengine.UE${_ueminor_us}Editor.desktop"

  ## Pacman hook: trim cache to one prior build per minor
  install -Dm775 "${pkgname}-pacman-cache.hook" \
    "${pkgdir}/etc/pacman.d/hooks/${pkgname}-pacman-cache.hook"
  
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/share/applications/"

  # Icon for Desktop entry (renamed per minor to avoid pixmap collisions)
  if [[ "${UE_USE_DEFAULT_LOGO_AT_INSTALL}" == "1" ]]; then
    install -Dm644 "ue${_ueminor_us}editor.svg" "${pkgdir}/usr/share/pixmaps/ue${_ueminor_us}editor.svg"
  else
    mv "ue${_ueminor_us}editor.svg" "ue${_ueminor_us}editor.svg.bak"
    wget --output-document "ue${_ueminor_us}editor.svg" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/apps/scalable/ue4editor.svg"
    install -Dm644 "ue${_ueminor_us}editor.svg" "${pkgdir}/usr/share/pixmaps/ue${_ueminor_us}editor.svg"
    wget --output-document "LICENSE" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/LICENSE"
    # Per-pkgname dir avoids collision when multiple unreal-engine-src-5.X
    # packages are installed in parallel.
    mkdir -p "${pkgdir}/usr/share/${pkgname}/EliverLara-candy-icons/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/${pkgname}/EliverLara-candy-icons/"
    rm "ue${_ueminor_us}editor.svg"
    rm LICENSE
    mv "ue${_ueminor_us}editor.svg.bak" "ue${_ueminor_us}editor.svg"
  fi

  # License — per-pkgname dir (Arch convention + avoids collision when
  # multiple unreal-engine-src-5.X packages are installed in parallel).
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  
  # Engine
  ## 755, not 777: an Installed Build is redistributable and does NOT write back
  ## into its own install tree at runtime (DDC, config and Saved data go to the
  ## user's home / project dirs). World-writable /opt would let any local user
  ## replace engine binaries another user then executes — a local privesc.
  install -dm755 "${pkgdir}/${UE_INSTALL_DIR}/Engine"

  # Ship ONLY the Installed Build (the redistributable engine produced by
  # "Make Installed Build Linux"). It already contains the headers and static
  # libs needed to compile C++ projects, so we deliberately do NOT also rsync
  # the full source tree on top — that dragged in .git, Setup.sh's ThirdParty
  # downloads, the SDK toolchain and DDC, inflating the package by ~100 GiB.
  rsync -a "${srcdir}/${pkgname}/LocalBuilds/Engine/Linux/" "${pkgdir}/${UE_INSTALL_DIR}/"
  if [[ -f "${srcdir}/${pkgname}/LocalBuilds/Engine/Linux/Engine/Binaries/Linux/UnrealEditor" ]]; then
    # Can never be too careful with recursive rm...
    rm -r "${srcdir}/${pkgname}/LocalBuilds"
  fi

  # Ensure InstalledBuild.txt is present so UBT treats this as an installed engine,
  # preventing the "unique build environment" error when building projects.
  printf '%s' "${pkgver}" | install -Dm644 /dev/stdin "${pkgdir}/${UE_INSTALL_DIR}/Engine/Build/InstalledBuild.txt"

  # BuildGraph staging copies the unpatched UBT into the Installed Build, clobbering
  # the patched UnrealBuildTool we rebuilt in build(). Re-stamp the installed copy.
  local _ubtsrc="${srcdir}/${pkgname}/Engine/Binaries/DotNET/UnrealBuildTool"
  local _ubtdst="${pkgdir}/${UE_INSTALL_DIR}/Engine/Binaries/DotNET/UnrealBuildTool"
  if [[ -d "${_ubtsrc}" && -d "${_ubtdst}" ]]; then
    rsync -a "${_ubtsrc}/" "${_ubtdst}/"
  fi

  find "${pkgdir}/${UE_INSTALL_DIR}" -type f \( -iname 'xbuild' -o -iname 'mcs' \) -exec chmod +x '{}' +

  ## Do this, in case the path doesn't exist for some reason
  mkdir -p "${pkgdir}/${UE_INSTALL_DIR}/Engine/Binaries/Android/"
  
  # Launcher (per-minor name avoids collision with other unreal-engine-src-5.X packages)
  install -Dm755 "../unreal-engine-5.8.sh" "${pkgdir}/usr/bin/unreal-engine-5.8"
  chmod +x "${pkgdir}/usr/bin/unreal-engine-5.8"
  # Per-minor short-form symlinks (e.g. ue5.6, UE5.6); no plain ue5/UE5/unreal-engine-5 to avoid cross-minor collisions.
  # Target is absolute (/usr/bin/unreal-engine-5.8) so the link resolves correctly once the package is installed.
  # No chmod here: it would follow the symlink (currently dangling inside ${pkgdir}) and fail. Linux ignores
  # symlink mode bits anyway — the underlying target's perms apply when the link is traversed.
  for _link in ue5.8 UE5.8; do
    ln -s "/usr/bin/unreal-engine-5.8" "${pkgdir}/usr/bin/${_link}"
  done
  
  # Configuring the launch script to detect when it has been run for the first time
  # Note: Requires that there isn't already a UE5 desktop entry in "${HOME}/local/share/applications/" - delete yours if you have one there before installing this
  DesktopFileChecksum=$(sha256sum "${pkgdir}/usr/share/applications/com.unrealengine.UE${_ueminor_us}Editor.desktop" | cut -f 1 -d ' ')
  sed -i "s|ChecksumPlaceholder|${DesktopFileChecksum}|" "${pkgdir}/usr/bin/unreal-engine-5.8"
  sed -i "s|InstalledLocationPlaceholder|/${UE_INSTALL_DIR}/Engine/Binaries|" "${pkgdir}/usr/bin/unreal-engine-5.8"
}
