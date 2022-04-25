# Maintainer: Alastair Pharo <me@asph.dev>
# Based on info in:
# - https://magazine.odroid.com/article/playing-modern-fna-games-on-the-odroid-platform/
# - https://github.com/pixelomer/Celeste-ARM64/issues/2
#
# Check the README for more info

pkgname=celeste-arm
pkgver=1.4.0.0
pkgrel=2
pkgdesc="Help Madeline survive her journey to the top of Celeste Mountain in this super-tight, hand-crafted platformer from the creators of TowerFall (patched to work on ARM)"
arch=("i686" "x86_64" "aarch64" "armv7h")
url="http://www.celestegame.com/"
license=("custom:commercial")
depends=("mono" "sdl2" "faudio")
makedepends=("cmake")
options=(!strip)

_fmod_sdl_version=21.10
_fmodstudio_version=20206
source=("file://celeste-linux.zip"
        "celeste"
        "celeste.desktop"
        "Celeste.exe.config"
        "git+https://github.com/FNA-XNA/FNA3D.git#tag=22.03"
        "FMOD_SDL-${_fmod_sdl_version}.tar.gz::https://github.com/flibitijibibo/FMOD_SDL/archive/refs/tags/${_fmod_sdl_version}.tar.gz"
        "file://fmodstudioapi${_fmodstudio_version}linux.tar.gz"
        "fmodstudio_fix.c"
        "FMOD_SDL.c.patch")
md5sums=("518ea69d60079109a2575d428eff8a53"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "1ba7e1f21e7da6cfd6f30ee4199e7d3c"
         "63c26ec0e73dec37e3039c88a8d0abef"
         "SKIP" # "1c94ef6abe07dc8a5593264a2c9aabb8")
         "SKIP")
noextract=("celeste-linux.zip")

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
  _config_fmodstudio
  
  # Build FMOD_SDL
  sed -i -e "s/^FMOD_VERSION = .*$/FMOD_VERSION = $fmodstudio_abi_version/" "FMOD_SDL-${_fmod_sdl_version}/Makefile"
  patch --forward "FMOD_SDL-${_fmod_sdl_version}/FMOD_SDL.c" "FMOD_SDL.c.patch"
  cp "$fmodstudio/api/studio/inc/"* \
    "$fmodstudio/api/core/inc/"* \
    "$fmodstudio/api/core/lib/$fmodstudio_arch/libfmod.so.$fmodstudio_abi_version" \
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
  _config_fmodstudio
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
    "$fmodstudio/api/core/lib/$fmodstudio_arch/libfmod.so.$fmodstudio_abi_version" \
    "$fmodstudio/api/studio/lib/$fmodstudio_arch/libfmodstudio.so.$fmodstudio_abi_version" \
    "FMOD_SDL-${_fmod_sdl_version}/libfmod_SDL.so" \
    "FNA3D-build/libFNA3D.so.0" \
    fmodstudio_fix.so

  mkdir  -p "${pkgdir}/usr/bin"
  ln -s "${dest}/celeste" "${pkgdir}/usr/bin/celeste"

  install -D -m644 Celeste.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/celeste.png
  install -D -m644 -t "$pkgdir"/usr/share/applications/ celeste.desktop 

  install -D -m644 fmodstudioapi${_fmodstudio_version}linux/doc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.fmodstudio
}

_config_fmodstudio() {
  case "$CARCH" in
    aarch64)
      fmodstudio_arch=arm64
      ;;

    armv7h)
      fmodstudio_arch=arm
      ;;

    i686)
      fmodstudio_arch=x86
      ;;

    *)
      fmodstudio_arch=$CARCH
  esac

  fmodstudio="$srcdir/fmodstudioapi${_fmodstudio_version}linux"
  fmodstudio_abi_version=13
}
