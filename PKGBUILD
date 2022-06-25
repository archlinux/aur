# Maintainer: Alastair Pharo <me@asph.dev>
# Based on info in:
# - https://magazine.odroid.com/article/playing-modern-fna-games-on-the-odroid-platform/
# - https://github.com/pixelomer/Celeste-ARM64/issues/2
#
# Check the README for more info

pkgname=celeste-arm
pkgver=1.4.0.0
pkgrel=6
pkgdesc="Help Madeline survive her journey to the top of Celeste Mountain in this super-tight, hand-crafted platformer from the creators of TowerFall (patched to work on ARM)"
arch=("i686" "x86_64" "aarch64" "armv7h")
url="http://www.celestegame.com/"
license=("custom:commercial")
depends=("mono" "sdl2" "faudio")
makedepends=("cmake")
options=(!strip)

_fmod_sdl_version=22.06.16
_fmod_full_version=2.02.07
_fmod_version=$(tr -d '.' <<<"$_fmod_full_version")
_fna3d_version=22.06

source=("getceleste://celeste-linux.zip"
        "celeste"
        "celeste.desktop"
        "Celeste.exe.config"
        "git+https://github.com/FNA-XNA/FNA3D.git#tag=${_fna3d_version}"
        "FMOD_SDL-${_fmod_sdl_version}.tar.gz::https://github.com/flibitijibibo/FMOD_SDL/archive/refs/tags/${_fmod_sdl_version}.tar.gz"
        "getfmod://fmodstudioapi${_fmod_version}linux.tar.gz"
        "fmodstudio_fix.c")
noextract=("celeste-linux.zip")

b2sums=('2b253db8b2b3e9a8977d2a5a8c235856be89a2e894c6e790b05ae1210a2edde38cdda89c94d8e8c6be0682ec4ba413353d296b4e6386d73b4cca37d0a16512f7'
        '21a7bdfbcd98430df0edd77468b72137a210d45dc74a62e43fc0016c0135af75161740d318447264fb1397b4271d8d2b0b615198898a2265bf84e76e3c430447'
        'edaf338bc43db31a797b70f431853a85394f5c39b8b28327e98ac217d4fb5599a524359664312dc572fb30cd1870e789db8138074221405bf3779e11d68f55dc'
        '3bd866363258785f402e5bc40fdca80f41a56a466964fb25e3e1d240d9759fb3517f5a20df4bbd73e6b3059f343ca5bc735d3f8f59f81244f938e56b8b44d1ad'
        'SKIP'
        'db37c97f5594151bb4c752ee6c6f9be7e96c6d563871b5b7cc9f0a47074b0176c9e1e5c61da9c3e768a04cc436debc6e043111ed22eb4395586d02616c7a45e7'
        '782d8fb6a41500c3876055a77a9ea84cbfcb4ccaa15dbfc8c43f344ef895fd12089ba7c197f75e97e028c16da6b34d1bd11ae7ed49b6a5bc797d41a9436c6068'
        '445760981f6ec507bdb198621a6e00aba901062defc7601711dca8103d16eb5ca05b60c10065eeecb31c96ec2891c60ddde1d0ad79abd421ac0a5b46050af521')

# Explain how to get Celeste
DLAGENTS+=("getceleste::/usr/bin/echo To build this package you need a copy of Celeste.  The PKGBUILD has been tested with the version (celeste-linux.zip) available from https://mattmakesgames.itch.io/celeste but versions from other sources may work too.")

# Explain how to get FMOD
DLAGENTS+=("getfmod::/usr/bin/echo Please download FMOD Engine v${_fmod_full_version} for Linux from https://fmod.com/ and place the .tar.gz file in \"$(pwd)\".")

prepare() {
  bsdtar -xf celeste-linux.zip \
    Backups \
    Celeste.Content.dll \
    Celeste.Content.pdb \
    Celeste.exe \
    Celeste.pdb \
    Celeste.png \
    Content \
    FNA.dll \
    FNA.dll.config \
    gamecontrollerdb.txt
}

build() {
  _config_fmod
  
  # Build FMOD_SDL
  cp "$fmodsrc/api/studio/inc/"* \
    "$fmodsrc/api/core/inc/"* \
    "$fmodsrc/api/core/lib/$fmod_arch/libfmod.so.$fmod_abi_version" \
    "FMOD_SDL-${_fmod_sdl_version}"
  make -C "FMOD_SDL-${_fmod_sdl_version}"

  # Build FNA3D
  git -C FNA3D submodule update --init
  cmake -S FNA3D -B FNA3D-build
  make -C FNA3D-build

  # Build fix for FMOD 2.x
  gcc -shared -o fmodstudio_fix.so fmodstudio_fix.c
}

package() {
  _config_fmod
  dest="/opt/${pkgname}"

  install -D -t "${pkgdir}/${dest}" \
    Celeste.exe \
    celeste

  install -Dm644 -t "${pkgdir}/${dest}" \
    Celeste.Content.dll \
    Celeste.Content.pdb \
    Celeste.exe.config \
    Celeste.pdb \
    FNA.dll \
    FNA.dll.config \
    gamecontrollerdb.txt

  cp -a Content Backups "${pkgdir}/${dest}/"

  install -D -t "${pkgdir}/${dest}/lib" \
    "$fmodsrc/api/core/lib/$fmod_arch/libfmod.so.$fmod_abi_version" \
    "$fmodsrc/api/studio/lib/$fmod_arch/libfmodstudio.so.$fmod_abi_version" \
    "FMOD_SDL-${_fmod_sdl_version}/libfmod_SDL.so" \
    "FNA3D-build/libFNA3D.so.0" \
    fmodstudio_fix.so

  mkdir  -p "${pkgdir}/usr/bin"
  ln -s "${dest}/celeste" "${pkgdir}/usr/bin/celeste"

  install -D -m644 Celeste.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/celeste.png
  install -D -m644 -t "$pkgdir"/usr/share/applications/ celeste.desktop 

  install -D -m644 fmodstudioapi${_fmod_version}linux/doc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.fmodstudio
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

  fmodsrc="$srcdir/fmodstudioapi${_fmod_version}linux"
  fmod_abi_version=13
}
