# Maintainer: Alastair Pharo <me@asph.dev>
# Based on info in:
# - https://magazine.odroid.com/article/playing-modern-fna-games-on-the-odroid-platform/
# - https://github.com/pixelomer/Celeste-ARM64/issues/2
#
# Check the README for more info

pkgname=celeste-arm
pkgver=1.4.0.0
pkgrel=1
pkgdesc="Help Madeline survive her journey to the top of Celeste Mountain in this super-tight, hand-crafted platformer from the creators of TowerFall (patched to work on ARM)"
arch=("aarch64" "armv7h")
url="http://www.celestegame.com/"
license=("custom:commercial")
depends=("mono" "sdl2")

_fmod_sdl_version=21.10
source=("file://celeste-linux.zip"
        "celeste.desktop"
        "git+https://github.com/FNA-XNA/FNA3D.git#tag=22.03"
        "FMOD_SDL-${_fmod_sdl_version}.tar.gz::https://github.com/flibitijibibo/FMOD_SDL/archive/refs/tags/${_fmod_sdl_version}.tar.gz")
md5sums=("518ea69d60079109a2575d428eff8a53"
         "fc762471133b0d7e7d626f07b8afd9ba"
         "SKIP"
         "1ba7e1f21e7da6cfd6f30ee4199e7d3c")
noextract=("celeste-linux.zip")

_fmodstudio_version_aarch64=20206
source_aarch64=("file://fmodstudioapi${_fmodstudio_version_aarch64}linux.tar.gz"
                "fmodstudio_fix.c")
md5sums_aarch64=("63c26ec0e73dec37e3039c88a8d0abef"
                 "1c94ef6abe07dc8a5593264a2c9aabb8")

_fmodstudio_version_armv7h=11014 # 10.14 grepped from included libs
source_armv7h=("file://fmodstudioapi${_fmodstudio_version_armv7h}linux.tar.gz")
md5sums_armv7h=("a045418d7b6512f8aecba54c0eadd37c")

prepare() {
  rm -rf celeste
  mkdir celeste
  bsdtar -C celeste -xf celeste-linux.zip
}

build() {
  if [ "$CARCH" = "aarch64" ]; then
    fmodstudio_version=$_fmodstudio_version_aarch64
    fmodstudio_abi_version=13
    fmodstudio_arch=arm64
    fmodstudio_core=core
  elif [ "$CARCH" = "armv7h" ]; then
    fmodstudio_version=$_fmodstudio_version_armv7h
    fmodstudio_abi_version=10
    fmodstudio_arch=armhf
    fmodstudio_core=lowlevel
  else
    echo "can't build for $CARCH" >&2
    exit 1
  fi
  fmodstudio="$srcdir/fmodstudioapi${fmodstudio_version}linux"

  cd celeste
  rm -rf lib{,64} mscorlib.dll System.*dll Mono.*.dll Celeste.bin.*
  mkdir lib

  cp "$fmodstudio/api/studio/lib/$fmodstudio_arch/libfmodstudio.so.$fmodstudio_abi_version" lib/
  cp "$fmodstudio/api/$fmodstudio_core/lib/$fmodstudio_arch/libfmod.so.$fmodstudio_abi_version" lib/

  cd "$srcdir/FMOD_SDL-${_fmod_sdl_version}"
  sed -i -e "s/^FMOD_VERSION = .*$/FMOD_VERSION = $fmodstudio_abi_version/" Makefile
  cp "$fmodstudio/api/studio/inc/"* \
    "$fmodstudio/api/$fmodstudio_core/inc/"* \
    "$fmodstudio/api/$fmodstudio_core/lib/$fmodstudio_arch/libfmod.so.$fmodstudio_abi_version" \
    .
  make
  cp libfmod_SDL.so "$srcdir/celeste/lib"

  cd "$srcdir/FNA3D"
  git submodule update --init
  mkdir -p build
  cd build
  cmake ..
  make
  cp libFNA3D.so.0 "$srcdir/celeste/lib"

  cd "$srcdir"

  cat > "celeste/Celeste" <<'EOF'
#!/bin/sh
cd $(dirname $(realpath $0))
export LD_LIBRARY_PATH=lib
mono Celeste.exe "$@"
EOF

  if [ "$CARCH" = "aarch64" ]; then
    gcc -shared -o "celeste/lib/fmodstudio_fix.so" fmodstudio_fix.c
    cat > "celeste/Celeste.exe.config" <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<configuration>
	<dllmap dll="fmod" os="linux" target="libfmod.so.13"/>
	<dllmap dll="fmodstudio" os="linux" target="libfmodstudio.so.13">
		<dllentry dll="fmodstudio_fix.so" name="FMOD_Studio_EventInstance_SetParameterValue" target="_FMOD_Studio_EventInstance_SetParameterValue"/>
		<dllentry dll="fmodstudio_fix.so" name="FMOD_Studio_System_Create" target="_FMOD_Studio_System_Create"/>
		<dllentry dll="fmodstudio.so.13" name="FMOD_Studio_System_GetLowLevelSystem" target="FMOD_Studio_System_GetCoreSystem"/>
		<dllentry dll="fmodstudio.so.13" name="FMOD_Studio_EventInstance_TriggerCue" target="FMOD_Studio_EventInstance_KeyOff"/>
	</dllmap>
</configuration>
EOF
  fi
}

package() {
  mkdir -p "$pkgdir"/usr/share/ "$pkgdir"/usr/bin
  cp -pr celeste "$pkgdir"/usr/share/
  ln -s ../share/celeste/Celeste "$pkgdir"/usr/bin/celeste
  install -D -m644 celeste/Celeste.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/celeste.png
  install -D -m644 -t "$pkgdir"/usr/share/applications/ celeste.desktop 

  if [ "$CARCH" = "aarch64" ]; then
    install -D -m644 fmodstudioapi${_fmodstudio_version_aarch64}linux/doc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.fmodstudio
  elif [ "$CARCH" = "armv7h" ]; then
    install -D -m644 fmodstudioapi${_fmodstudio_version_armv7h}linux/doc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.fmodstudio
  fi
}
