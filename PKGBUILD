# Maintainer: Alastair Pharo <me at asph dot dev>

_pkgname=fightn-rage
pkgname=${_pkgname}-linux-bin
pkgver=220120
_pkgbuild=53068
pkgrel=1
pkgdesc="Fight'N Rage is a brand new old-school side-scroller beat'em up. Patched to run on Linux Mono instead of Wine"
arch=("i686" "x86_64" "aarch64" "armv7h")
url="https://www.gog.com/en/game/fightn_rage"
license=("custom:commercial")
depends=("mono" "sdl2" "openal")
makedepends=("innoextract" "icoutils")
options=(!strip)

_fmod_full_version="2.02.07"
_fmod_version=$(tr -d '.' <<<"$_fmod_full_version")
source=("setup_fightn_rage_build${pkgver}_(${_pkgbuild}).exe::gogdownloader://fightn_rage/en1installer1"
        "getfmod://fmodstudioapi${_fmod_version}linux.tar.gz"
        "opentk-3.1.0.zip::https://www.nuget.org/api/v2/package/OpenTK/3.1.0"
        "FIGHT_N_RAGE.exe.config"
        "GalaxyCSharp.cs"
        "fightn-rage"
        "gdi32.c"
        "fmod_fix.c"
        "fightn-rage.desktop")

b2sums=('443c5bafdfebe996f383ebfceb0a5b3a7b2694217b37a8bcbcf66d136babdeca1b2cb323206b90948c1ae1bffbecd8ea85f25ec9f5e1bf0f02c2272cc30540e8'
        '782d8fb6a41500c3876055a77a9ea84cbfcb4ccaa15dbfc8c43f344ef895fd12089ba7c197f75e97e028c16da6b34d1bd11ae7ed49b6a5bc797d41a9436c6068'
        '60ad4e4a233d605b528ce44bc6eb3c18c7dd4ad66e04f1e0b6784ecf63c948f0d5fd7036103886eb1d922c0077667e9615723fc38e5e7a16489f6f516b5080b5'
        '0bf1a1ef46e132648aeb6552afa036bb0628f30e4e8ba3421e90bfdab34eda975c150a8e8a5b80c3c85e80590a378053c8822628b4e9ced3f9929827c35aa48a'
        '6a69b01c112c4315501612e61140c24cdc5a784e65062842066c3121bd53cd892a3e4c7ac72be6cb7ad363b188db2c099b77e2d9f8830229db04dde0a86b85c2'
        '3b2b9d3f4ec61e63b6b730a4108c47597a38c75a02d39720fef06f53b93a2fb3660c7db07df0cefbd33312e9bf9840f87d7a0325a4d9381af28e1c2e7c3292ec'
        'e19f0fa0d836b744b510cafba4eb84b8cb21cf2813c6ed5d60476e277478751e674c09e1abd7e2e304f79d2c808f99f79dec2f14d77c4847cc4c2435fba16119'
        '3eb6f77a24f61272543a8f6b006508cc6eafb21a77bbb6aaa63ef51a878af17bc28f4af3fdcc9f4b1c1a8dd24436abe9b6758c35f4857e8b27cd9d0bda2c20e3'
        '59506cbcb7c362b08d086f51b48cfa5b9d177da4656737bf27347f026a83e80cc77c6d2b5f18db5470b4492d1bc7137d0c74415481b435827739b2b9eecebdf2')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")
#DLAGENTS+=("gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o")

# Explain how to get FMOD
DLAGENTS+=("getfmod::/usr/bin/echo Please download FMOD Engine v${_fmod_full_version} for Linux from https://fmod.com/ and place the .tar.gz file in \"$(pwd)\".")

prepare() {
  innoextract "setup_fightn_rage_build${pkgver}_(${_pkgbuild}).exe" \
    -I data \
    -I FIGHT_N_RAGE.exe \
    -I gamecontrollerdb.txt \
    -I SDL2-CS.dll \
    -I tmp/EULA.txt \

  wrestool -x -t 14 -o . FIGHT_N_RAGE.exe
  icotool -x -o . FIGHT_N_RAGE.exe_14_32512_0.ico
}

build() {
  _config_fmod

  # This is a stub version of GOG Galaxy with no functionality
  csc -target:library -out:"GalaxyCSharp.dll" GalaxyCSharp.cs

  # This is an imitation of the Windows GDI32 lib
  gcc $(sdl2-config --cflags) -shared -o "libgdi32.so" gdi32.c

  # Remappings and fixes for using FMOD 2.x
  gcc -shared -o "fmod_fix.so" fmod_fix.c \
    -lfmod \
    -Ifmodstudioapi${_fmod_version}linux/api/core/inc \
    -Lfmodstudioapi${_fmod_version}linux/api/core/lib/$fmod_arch
}
            
package() {
  _config_fmod

  mkdir -p "${pkgdir}/opt/${_pkgname}/"{lib,data} "${pkgdir}/usr/bin"

  install -t "${pkgdir}/opt/${_pkgname}" \
    fightn-rage \
    FIGHT_N_RAGE.exe

  install -m644 -t "${pkgdir}/opt/${_pkgname}" \
    FIGHT_N_RAGE.exe.config \
    gamecontrollerdb.txt \
    SDL2-CS.dll \
    lib/net20/OpenTK.dll \
    content/OpenTK.dll.config \
    GalaxyCSharp.dll

  install -t "${pkgdir}/opt/${_pkgname}/lib" \
    fmodstudioapi${_fmod_version}linux/api/core/lib/$fmod_arch/libfmod.so.13 \
    libgdi32.so \
    fmod_fix.so

  cp -R data/* "${pkgdir}/opt/${_pkgname}/data"

  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}" 

  for res in "256x256" "48x48" "32x32" "24x24" "16x16"; do
    install -Dm644 FIGHT_N_RAGE.exe_14_32512_0_?_${res}x32.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    tmp/EULA.txt \
    "fmodstudioapi${_fmod_version}linux/doc/LICENSE.TXT"
}

_config_fmod() {
  case "$CARCH" in
    aarch64)
      fmod_arch=arm64
      ;;

    armv7h)
      fmod_arch=arm
      ;;

    i686)
      fmod_arch=x86
      ;;

    *)
      fmod_arch=$CARCH
  esac
}
