# Maintainer: Neko-san <aur at mycat dot anonaddy dot me>

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
# If you want to turn on additional patches there are switches below.
pkgname=unreal-engine-4
pkgver=4.27.2
pkgrel=8
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url=https://www.unrealengine.com/
makedepends=('git' 'openssh' 'coreutils' 'sed' 'grep' 'glibc')
depends=('icu63' 'sdl2' 'python' 'lld' 'clang' 'xdg-user-dirs' 'dos2unix' 'openssl-1.1' 'steam' 'coreutils' 'findutils')
optdepends=('qt5-base: qmake build system for projects'
            'cmake: build system for projects'
            'qtcreator: IDE for projects'
            'codelite: IDE for projects'
            'kdevelop: IDE for projects'
            'clion: IDE for projects'
            'pacman-contrib: for the paccache cleaning hook')
license=('custom:UnrealEngine')
source=('unreal-engine-4.sh'
        'com.unrealengine.UE4Editor.desktop'
        'clang_path_fix.patch'
        'ccache_executor.patch'
        'unreal-engine-4-pacman-cache.hook')
sha256sums=('c8771291d5ca38696686b06ad7affab496f5ab1b9c5570bd104c9542905a404e'
            'c04c03b2c5c933b7eb1af283d607934ad95fd57f44d62b83719061b555a85dca'
            '960c5a100e0c3732f3c73fb645d3989d39acf4576d74615bbef38ebeee008b90'
            '33982486f7fafac35a33dfa37c85cfba8543aa78b5fe13c395d9cccf691ef4b3'
            'df4687c3bc54dbac3c1589e6104b41c5cba17863f447dc919677ad3a240528f3')
# Not sure if compiling Unreal with LTO is legal? Lot's of different proprietary software goes into Unreal
options=('!strip' 'staticlibs') # Package is 3 Gib smaller with "strip" but it takes a long time and generates many warnings

# Default engine installation directory. Can be useful if you do not have a lot of space in /opt directory.
_install_dir="opt/${pkgname}"

# Change this to true or 1 for a potentially smaller package size by using Arch's Clang compiler
## Note: We can't guarantee that enabling this won't affect cross-distro compatibility given that Epic provides their own toolchain specifically
## based on the claim that it helps with compatibility...
## Though, you could just distribute your game as an AppImage if you decide to publish on a game store... :p
_use_system_clang=false

# Patches for ccache. More optimizations might be needed? - If this doesn't work and you are able to update this, sharing a new patch is welcome :D
_ccache_support=false

# Change this to true if you have a modern system and don't mind the extra packaging time (and size) to avoid compiling shaders on UE startup later; set to false by default for those with less robust systems
_WithDDC=false

## Courtesy of the original author of this patch from https://aur.archlinux.org/packages/unreal-engine
## This patch is a bit more complex, so I'll try to maintain it if someone provides a new one, but don't be surprised if updates for this patch are not speedy
if [ "${_ccache_support}" != "false" ]; then
  depends+=(ccache)
fi

## Use this if you prefer opendoas; the benefit here is that doas won't time out on you if you wait too long to authenticate after compilation
if [ -f /usr/bin/doas ] && [ -f /etc/doas.conf ]; then
  PACMAN_AUTH=(doas)
fi
  
## This is for detecting your CPU architecture automatically; set to false if you want to enforce your own makepkg.conf file

## Note: the resulting package will still be named containing "x86_64" unless the build was done with an "official" Arch distro for that architecture (like Arch ARM - [I don't advise using Arch ARM though])
## or if you manage to trick your Arch installation to accept other architecture extensions by fiddling with the $CARCH variable and /etc/pacman.conf - this method has flaws, namely due to a bug:
## it doesn't work with "makechrootpkg" - though, this PKGBUILD doesn't work in with this method anyway because of Github SSH Agent nonsense

# Valid values are false / disabled / default, auto, and native
arch_auto=auto

if [[ ${arch_auto} == auto ]]
then
  ## Architecture checks and compile flag adjustments - shellcheck throws a fit about the build function but it looks fine to me; checks for the highest available x64 support level and falls back to "native" if either not available
  if [ "$(uname -m)" == "x86_64" ]; then
    if [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v4' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == '  x86-64-v4 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v4 -mtune=x86-64-v4 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v3' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == 'x86-64-v3 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v3 -mtune=x86-64-v3 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v2' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == 'x86-64-v2 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v2 -mtune=x86-64-v2 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep 'x86_64' | grep 'supported' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /' | grep -w '^x86_64 - supported')" == 'x86_64 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64 -mtune=x86-64 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    fi
  elif [ "$(uname -m)" == "aarch64" ]; then
    export CFLAGS="${CFLAGS} -march=aarch64 -mtune=aarch64 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
    export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
    export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
  else
    echo "Architecture '$(uname -m)' is not supported! Exiting."
    return
  fi
elif [[ "${arch_auto}" == native ]]; then
    export CFLAGS="${CFLAGS} -march=native -mtune=native -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,object-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
    export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
    export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
fi

prepare() {
  # Check access to the repository
  if ! git ls-remote git@github.com:EpicGames/UnrealEngine &>/dev/null
  then
    error 'You must register at unrealengine.com and link your github account to access this private repo. See the wiki for more info: https://wiki.archlinux.org/index.php/Unreal_Engine_4'
    exit 1
  fi

  # Download Unreal Engine source or update if the folder exists
  if [[ ! -d "${pkgname}" ]]
  then
    git clone --depth=1 --branch=${pkgver} git@github.com:EpicGames/UnrealEngine "${pkgname}"
    cd "${pkgname}" || return
  else
    cd "${pkgname}" || return
    CURRENT_CLONED_VERSION="$(git describe --tags)"
    if [ "${CURRENT_CLONED_VERSION}" != "${pkgver}-release" ]; then
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

  # Apply custom patches
  if [ "${_use_system_clang}" == "true" ] || [ "${_ccache_support}" == "true" ]; then
    patch -p1 -i "${srcdir}/clang_path_fix.patch" # Replace Windows specific search with the correct path (used for -mode=GenerateClangDatabase in UBT)
  fi
  
  if [[ ${_ccache_support} == true ]]
  then
    patch -p1 -i "${srcdir}/ccache_executor.patch"
  fi

  # Qt Creator source code access
  if [[ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]]
  then
    git -C Engine/Plugins/Developer clone --depth=1 git@github.com:fire/QtCreatorSourceCodeAccess
  fi
  
  # For some reason, despite this file explicitly asking not to be removed, it was removed from the UE5 source; it has to be re-added or the build will fail - this is the UE4 package, but this will remain in place in-case this occurs for UE4 branches
  if [[ ! -f ${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies ]]
  then
    mkdir -p ${pkgname}/Engine/Source/ThirdParty/Linux/
    touch ${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies
    sed -i "1c\This file must have no extension so that GitDeps considers it a binary dependency - it will only be pulled by the Setup script if Linux is enabled. Please do not remove this file." ${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies
  fi

  ./Setup.sh
}

build() {
  cd ${pkgname} || return
  ## See "https://docs.unrealengine.com/4.27/en-US/ProductionPipelines/DeployingTheEngine/UsinganInstalledBuild/#installedbuildscriptoptions" for reference
  if [[ ${_WithDDC} == true ]]; then
    Engine/Build/BatchFiles/RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -set:WithDDC=true -set:HostPlatformOnly=false -set:WithLinux=true -set:WithWin64=true -set:WithWin32=false -set:WithMac=false -set:WithAndroid=false -set:WithIOS=false -set:WithTVOS=false -set:WithLumin=false
  else
    Engine/Build/BatchFiles/RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -set:WithDDC=false -set:HostPlatformOnly=false -set:WithLinux=true -set:WithWin64=true -set:WithWin32=false -set:WithMac=false -set:WithAndroid=false -set:WithIOS=false -set:WithTVOS=false -set:WithLumin=false
  fi
}

package() {
  # Desktop entry
  sed -i "7c\Exec=/usr/bin/unreal-engine-4.sh %U" com.unrealengine.UE4Editor.desktop
  sed -i "14c\Path=/usr/bin/" com.unrealengine.UE4Editor.desktop
  install -Dm775 com.unrealengine.UE4Editor.desktop "${pkgdir}/usr/share/applications/com.unrealengine.UE4Editor.desktop"
  chmod +x "${pkgdir}/usr/share/applications/com.unrealengine.UE4Editor.desktop"

  ## Install a pacman hook to keep old builds from compounding cache by tens of GBs - 2 builds alone can reach at least 30 GBs in pacman's cache; having one only takes up about 15 GBs
  install -Dm775 unreal-engine-4-pacman-cache.hook "${pkgdir}/etc/pacman.d/hooks/unreal-engine-4-pacman-cache.hook"
  
  cd "${srcdir}/${pkgname}" || return
  
  # Icon for Desktop entry
  install -Dm770 Engine/Source/Programs/UnrealVS/Resources/Preview.png "${pkgdir}/usr/share/pixmaps/ue4editor.png"

  # License
  install -Dm770 LICENSE.md "${pkgdir}/usr/share/licenses/UnrealEngine/LICENSE.md"
  
  # Engine
  ## Set to all permissions to prevent the engine from breaking itself; more elegant solutions might exist - suggest them if they can be automated here
  ## Also, correct me if I package this improperly; I added Win64 support for the build in hopes of supporting cross-compilation
  install -dm777 "${pkgdir}/${_install_dir}/Engine"
  mv LocalBuilds/Engine/Linux/* "${pkgdir}/${_install_dir}"
  chmod -R 777 "${pkgdir}/${_install_dir}"
  
  chmod +x "${pkgdir}/${_install_dir}/Engine/Binaries/ThirdParty/Mono/Linux/bin/xbuild"
  chmod +x "${pkgdir}/${_install_dir}/Engine/Binaries/ThirdParty/Mono/Linux/bin/mcs"
  mkdir -p "${pkgdir}/${_install_dir}/Engine/Binaries/Android/"
  
  # Launch script to initialize missing user folders for Unreal Engine
  install -Dm755 ../unreal-engine-4.sh "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/unreal-engine-4.sh"
  ln -s "${pkgdir}/usr/bin/unreal-engine-4.sh" "${pkgdir}/usr/bin/ue4"
  ln -s "${pkgdir}/usr/bin/unreal-engine-4.sh" "${pkgdir}/usr/bin/UE4"
  ln -s "${pkgdir}/usr/bin/unreal-engine-4.sh" "${pkgdir}/usr/bin/unreal-engine-4"
  chmod 755 "${pkgdir}/usr/bin/ue4" "${pkgdir}/usr/bin/UE4" "${pkgdir}/usr/bin/unreal-engine-4"
  
  # Configuring the launch script to detect when it has been run for the first time
  # Note: Requires that there isn't already a UE5 desktop entry in "${HOME}/local/share/applications/" - delete yours if you have one there before installing this
  DesktopFileChecksum=$(sha256sum "${pkgdir}/usr/share/applications/com.unrealengine.UE4Editor.desktop" | cut -f 1 -d ' ')
  sed -i "s/ChecksumPlaceholder/${DesktopFileChecksum}/" "${pkgdir}/usr/share/applications/com.unrealengine.UE4Editor.desktop"
  sed -i "s/InstalledLocationPlaceholder/${_install_dir}/" "${pkgdir}/usr/share/applications/com.unrealengine.UE4Editor.desktop"
}
