# Old Maintainer: Dylan Ferris <dylan@psilly.com>
# Old Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>
# Maintainer: Shatur95 <genaloner@gmail.com>
# Co-Maintainer: Neko-san <aur@mycat.anonaddy.me>
# Contributor: shawarden

# The source is about 200 MiB, with an extra ~11 GiB of dependencies downloaded in Setup.sh, and may take several hours to compile.
# If you want additional options, there are switches below.
pkgname=unreal-engine
pkgver=5.1.1
pkgrel=1
pkgdesc='A 3D game engine by Epic Games which can be used non-commercially for free.'
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url=https://www.unrealengine.com/
makedepends=('git' 'openssh' 'sed' 'grep' 'glibc' 'wget')
depends=('icu63' 'sdl2' 'python' 'lld' 'xdg-user-dirs' 'dos2unix' 'openssl' 'steam' 'coreutils' 'findutils')
optdepends=('qt5-base: qmake build system for projects'
            'cmake: build system for projects'
            'qtcreator: IDE for projects'
            'codelite: IDE for projects'
            'kdevelop: IDE for projects'
            'clion: IDE for projects'
            'pacman-contrib: for the paccache cleaning hook')
license=('custom:UnrealEngine' 'GPL3')
source=('unreal-engine-5.sh'
        'com.unrealengine.UE4Editor.desktop'
        'use_system_clang.patch'
        'unreal-engine-5-pacman-cache.hook')
sha256sums=('14a2f522dc4ed701678adac0d49f802ac55a0adcb3e1de6663ef9fc64c851099'
            'c04c03b2c5c933b7eb1af283d607934ad95fd57f44d62b83719061b555a85dca'
            'b0a57db9a44d0001dc76ca8504d93e273af30093c6a993a5969d82b0ace54b98'
            '9386160a91594abeeaf4fe02fea562e7a4ead4c6f9a258c2a37b2e5f10e7deca')
# Not sure if compiling Unreal with LTO is legal? Lot's of different proprietary software goes into Unreal
options=('!strip' 'staticlibs') # Package is smaller with "strip" but it takes a long time and generates many warnings

## Use this if you prefer opendoas; the benefit here is that doas won't time out on you if you wait too long to authenticate after compilation
if [ -f /usr/bin/doas ] && [ -f /etc/doas.conf ]; then
  PACMAN_AUTH=(doas)
fi

# Change this to true or 1 for a potentially smaller package size
## Note: We can't guarantee that enabling this won't affect cross-distro compatibility given that Epic provides their own toolchain specifically
## based on the claim that it helps with compatibility...
## Though, you could just distribute your game as an AppImage if you decide to publish on a game store... :p
_use_system_clang=false

# Default engine installation directory. Can be useful if you do not have a lot of space on the default storage drive
# DON'T put a "/" at the start of the path
_install_dir="opt/${pkgname}"

# Change this to true if you have a modern system and don't mind the extra packaging time (and size) to avoid compiling shaders on UE startup later; set to false by default for those with less robust systems
_WithDDC=false

## An attempt to fix the NuGet SSL issue during the build -- didn't seem to work; users had to do this manually, so we'll rollback to an alternative
#ln -s /etc/ssl /usr/lib/ssl
#ln -s /etc/ssl /usr/lib64/ssl
## ---
export DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0

## This is for detecting your CPU architecture automatically; set to false if you want to enforce your own makepkg.conf file
## Disabled by default as a compromise for those bothered by having it force-enabled

## Note: the resulting package will still be named containing "x86_64" unless the build was done with an "official" Arch distro for that architecture (like Arch ARM - [don't exactly advise using Arch ARM though])
## or if you manage to trick your Arch installation to accept other architecture extensions by fiddling with the $CARCH variable and /etc/pacman.conf - this method has flaws, namely due to a bug:
## it doesn't work with "makechrootpkg" - though, this PKGBUILD doesn't work in with this method anyway because of Github SSH Agent nonsense -- if this changes in the future, let us know

# Valid values are false / disabled / default, auto, and native
arch_auto=false

if [[ ${arch_auto} == auto ]]
then
  ## Architecture checks and compile flag adjustments - shellcheck throws a fit about the build function but it looks fine to me; checks for the highest available x64 support level and falls back to "native" if either not available
  if [ "$(uname -m)" == "x86_64" ]; then
    if [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v4' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == 'x86-64-v4 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v4 -mtune=x86-64-v4 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v3' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == 'x86-64-v3 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v3 -mtune=x86-64-v3 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep -w 'x86-64-v2' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /')" == 'x86-64-v2 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64-v2 -mtune=x86-64-v2 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    elif [ "$(/lib/ld-linux-x86-64.so.2 --help | grep 'x86_64' | grep 'supported' | cut -d ',' -f 1 | sed 's/^  //' | sed 's/ (/ - /' | grep -w '^x86_64 - supported')" == 'x86_64 - supported' ]; then
      export CFLAGS="${CFLAGS} -march=x86-64 -mtune=x86-64 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
      export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
      export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
    fi
  elif [ "$(uname -m)" == "aarch64" ]; then
    export CFLAGS="${CFLAGS} -march=aarch64 -mtune=aarch64 -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
    export CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
    export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
  else
    echo "Architecture '$(uname -m)' is not supported! Exiting."
    return
  fi
elif [[ "${arch_auto}" == native ]]; then
    export CFLAGS="${CFLAGS} -march=native -mtune=native -O3 -pipe -fno-plt -fstack-clash-protection -fstack-protector-strong -fcf-protection -fsanitize=bounds,alignment,dir-size -fsanitize-undefined-trap-on-error -Wformat -Werror=format-security -Warray-bounds -Wvla -Wimplicit-fallthrough -Wno-unused-result -Wno-unneeded-internal-declaration"
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
    #git clone --depth=1 --branch=ue5-main git@github.com:EpicGames/UnrealEngine "{$pkgname}"
    git clone --depth=1 --branch=${pkgver}-release git@github.com:EpicGames/UnrealEngine "${pkgname}"
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
  
  ## Apply custom patches if enabled
  if [ "${_use_system_clang}" == true ]; then
    patch -p1 -i "${srcdir}/use_system_clang.patch"
  fi

  # Qt Creator source code access
  if [[ ! -d Engine/Plugins/Developer/QtCreatorSourceCodeAccess ]]
  then
    git -C Engine/Plugins/Developer clone --depth=1 git@github.com:fire/QtCreatorSourceCodeAccess
  fi

  # For some reason, despite this file explicitly asking not to be removed, it was removed from the UE5 source; it has to be re-added or the build will fail
  if [[ ! -f ${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies ]]
  then
    mkdir -p "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/"
    touch "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies"
    sed -i "1c\This file must have no extension so that GitDeps considers it a binary dependency - it will only be pulled by the Setup script if Linux is enabled. Please do not remove this file." "${srcdir}/${pkgname}/Engine/Source/ThirdParty/Linux/HaveLinuxDependencies"
  fi
  
  ./Setup.sh
}

build() {
  cd "${pkgname}" || return
  
  while true; do 
    if [ "${_WithDDC}" == true ]; then
      Engine/Build/BatchFiles/RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -set:WithDDC=true -set:HostPlatformOnly=false -set:WithLinux=true -set:WithWin64=true -set:WithMac=false -set:WithAndroid=false -set:WithIOS=false -set:WithTVOS=false
    else
      Engine/Build/BatchFiles/RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -set:WithDDC=false -set:HostPlatformOnly=false -set:WithLinux=true -set:WithWin64=true -set:WithMac=false -set:WithAndroid=false -set:WithIOS=false -set:WithTVOS=false
    fi
    exit_status=$?
    
    if [ ${exit_status} -eq 0 ]; then
      break
    else
      echo "Error: Build failed; try searching the output for suspicious messages." >&2
      exit ${exit_status}
    fi
  done
}

package() {

  # Desktop entry
  if [ ! -f com.unrealengine.UE5Editor.desktop ] && [ -f com.unrealengine.UE4Editor.desktop ]; then
    cp com.unrealengine.UE4Editor.desktop com.unrealengine.UE5Editor.desktop
  fi
  
  sed -i "7c\Exec=/usr/bin/unreal-engine-5.sh %U" com.unrealengine.UE5Editor.desktop
  sed -i "14c\Path=/usr/bin/" com.unrealengine.UE5Editor.desktop
  sed -i 's/Unreal Engine 4 Editor/Unreal Engine 5 Editor/g' com.unrealengine.UE5Editor.desktop
  sed -i 's/Icon=ue4editor/Icon=ue5editor/g' com.unrealengine.UE5Editor.desktop
  install -Dm775 com.unrealengine.UE5Editor.desktop "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop"
  chmod +x "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop"

  ## Install a pacman hook to keep old builds from compounding cache by tens of GBs - 2 builds alone can reach at least 30 GBs in pacman's cache; having one only takes up about 15 GBs
  install -Dm775 unreal-engine-5-pacman-cache.hook "${pkgdir}/etc/pacman.d/hooks/unreal-engine-5-pacman-cache.hook"
  
  cd "${srcdir}/${pkgname}" || return
  
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/share/applications/"
  # Icon for Desktop entry
  # install -Dm770 Engine/Source/Programs/UnrealVS/UnrealVS.2022/Resources/Preview.png "${pkgdir}/usr/share/pixmaps/ue5editor.png"
  wget --output-document "ue5editor.svg" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/apps/scalable/ue4editor.svg"
  install -Dm750 ue5editor.svg "${pkgdir}/usr/share/pixmaps/ue5editor.svg"
  wget --output-document "LICENSE" "https://raw.githubusercontent.com/EliverLara/candy-icons/master/LICENSE"
  mkdir -p "${pkgdir}/usr/share/UnrealEngine/EliverLara-candy-icons/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/UnrealEngine/EliverLara-candy-icons/"
  rm ue5editor.svg
  rm LICENSE

  # License
  install -Dm770 LICENSE.md "${pkgdir}/usr/share/licenses/UnrealEngine/LICENSE.md"
  
  # Engine
  ## Set to all permissions to prevent the engine from breaking itself; more elegant solutions might exist - suggest them if they can be automated here
  ## Also, correct me if I package this improperly; I added Win64 support for the build in hopes of supporting cross-compilation
  install -dm777 "${pkgdir}/${_install_dir}/Engine"
  
  # Copy LocalBuilds to pkg...
  cp -flr "${srcdir}"/"${pkgname}"/LocalBuilds/Engine/Linux/* "${pkgdir}"/"${_install_dir}"/
  if [ -f "${srcdir}"/"${pkgname}"/LocalBuilds/Engine/Linux/Engine/Binaries/Linux/UnrealEditor ]; then
    # Can never be too careful with recursive rm...
    rm -r "${srcdir}"/"${pkgname}"/LocalBuilds
  fi

  # Copy the rest of it to pkg... Should we be overwriting LocalBuilds?
  cp -flr "${srcdir}"/"${pkgname}"/* "${pkgdir}"/"${_install_dir}"/
  if [ -f "${srcdir}"/"${pkgname}"/Engine/Binaries/Linux/UnrealEditor ]; then
    rm -r "${srcdir}"/"${pkgname:?}"/*
  fi
  
  # if [ -f "${srcdir}/${pkgname}/cpp.hint" ] && [ ! -d "${srcdir}/${pkgname}/cpp.hint" ]; then
  #   mv "${srcdir}/${pkgname}/cpp.hint" "${pkgdir}/${_install_dir}"
  # elif [ -d "${srcdir}/${pkgname}/cpp.hint" ]; then
  #   mkdir -p "${pkgdir}/${_install_dir}/cpp.hint"
  #   mv "${srcdir}"/"${pkgname}"/cpp.hint/* "${pkgdir}/${_install_dir}/cpp.hint"
  # fi
  # 
  # if [ -f "${srcdir}/${pkgname}/GenerateProjectFiles.sh" ]; then
  #   install -Dm777 "${srcdir}/${pkgname}/GenerateProjectFiles.sh" "${pkgdir}/${_install_dir}"
  # fi
  
  chmod -R 777 "${pkgdir}/${_install_dir}"
  
  if [ -x "$(find "${pkgdir}/${_install_dir}" -type f -iname 'xbuild')" ]; then
    find "${pkgdir}/${_install_dir}" -type f -iname 'xbuild' -exec chmod +x "{}" \;
  fi
  
  if [ -x "$(find "${pkgdir}/${_install_dir}" -type f -iname 'mcs')" ]; then
    find "${pkgdir}/${_install_dir}" -type f -iname 'mcs' -exec chmod +x "{}" \;
  fi
  
  ## Do this, in case the path doesn't exist for some reason
  mkdir -p "${pkgdir}/${_install_dir}/Engine/Binaries/Android/"
  
  # Launch script to initialize missing user folders for Unreal Engine
  install -Dm755 ../unreal-engine-5.sh "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/unreal-engine-5.sh"
  ln -s "${pkgdir}/usr/bin/unreal-engine-5.sh" "${pkgdir}/usr/bin/ue5"
  ln -s "${pkgdir}/usr/bin/unreal-engine-5.sh" "${pkgdir}/usr/bin/UE5"
  ln -s "${pkgdir}/usr/bin/unreal-engine-5.sh" "${pkgdir}/usr/bin/unreal-engine-5"
  chmod 755 "${pkgdir}/usr/bin/ue5" "${pkgdir}/usr/bin/UE5" "${pkgdir}/usr/bin/unreal-engine-5"
  
  # Configuring the launch script to detect when it has been run for the first time
  # Note: Requires that there isn't already a UE5 desktop entry in "${HOME}/local/share/applications/" - delete yours if you have one there before installing this
  DesktopFileChecksum=$(sha256sum "${pkgdir}/usr/share/applications/com.unrealengine.UE5Editor.desktop" | cut -f 1 -d ' ')
  sed -i "s|ChecksumPlaceholder|${DesktopFileChecksum}|" "${pkgdir}/usr/bin/unreal-engine-5.sh"
  sed -i "s|InstalledLocationPlaceholder|/${_install_dir}/Engine/Binaries|" "${pkgdir}/usr/bin/unreal-engine-5.sh"
}
