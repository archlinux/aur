# Maintainer: nesktf <nesktf@proton.me>

pkgname=sonic3air-git
pkgver=v25.02.15.0.test.r1416.b584686
pkgrel=1
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles, built from latest git'
arch=('x86' 'x86_64' 'aarch64')
url='https://github.com/Eukaryot/sonic3air'
license=('GPL 3.0')
makedepends=('git' 'cmake' 'alsa-lib' 'libxcomposite' 'openssl' 'libxxf86vm' 'libpulse' 'glu')
depends=('opengl-driver')
optdepends=('zenity: display script errors as a message box'
            'yad: display script errors as a message box')
provides=(sonic3air)
source=("${pkgname}::git+https://github.com/Eukaryot/sonic3air.git"
        '0001-fix-sdl-pipewire.patch'
        '0002-disable-optimizations.patch')
sha256sums=('SKIP'
            'f47713e1a79dbe8aa633fc3400a4e4b03bb3be26dc385f6ebb15fd7aeeaa6a8a'
            '061c1ed5fbc924b2db6a111f90bf3f1454b3cf8f0475ac6e1646ac9c99c5c2d9')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "v%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # Fix compilation error
  # https://github.com/libsdl-org/SDL/blob/2ffabb51500346bb0a7e621ebf4f0463b1b420b5/src/audio/pipewire/SDL_pipewire.c#L556
  patch -p1 < "${srcdir}/0001-fix-sdl-pipewire.patch"

  # When compiled with optimizations turned on using Arch's gcc, there is a problem somewhere
  # in the lemonscript code related to refcounting.
  # A temporary workaround is to just disable optimizations.
  patch -p1 < "${srcdir}/0002-disable-optimizations.patch"
}

build() {
  cd "${srcdir}/${pkgname}/Oxygen/sonic3air/build/_cmake/"
  mkdir -p build
  cd ./build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SDL_STATIC=ON \
    -DUSE_DISCORD=ON \
    -DBUILD_OXYGEN_ENGINEAPP=OFF ..
  cmake --build .
}

package() {
  install -dm755 "${pkgdir}/usr/share/applications"
  cat <<EOM > "${pkgdir}/usr/share/applications/sonic3air.desktop"
[Desktop Entry]
Name=Sonic 3 A.I.R.
Type=Application
Encoding=UTF-8
Exec=/opt/sonic3air/sonic3air_linux
Icon=/opt/sonic3air/data/icon.png
Path=/opt/sonic3air/
Terminal=false
EOM

  install -dm755 "${pkgdir}/opt/sonic3air/"
  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/opt/sonic3air/LICENSE"

  cd "./Oxygen/sonic3air"
  ./sonic3air_linux -dumpcppdefinitions # Needs to do this to generate saves/scripts.bin
  ./sonic3air_linux -pack # Generates the other data bin files
  mkdir -p _master_image_template/data/
  mv enginedata.bin _master_image_template/data/
  mv gamedata.bin _master_image_template/data/
  mv audiodata.bin _master_image_template/data/
  mv audioremaster.bin _master_image_template/data/
  cp data/metadata.json _master_image_template/data/
  cp data/images/icon.png _master_image_template/data/icon.png

  install -Dm755 sonic3air_linux "${pkgdir}/opt/sonic3air/sonic3air_linux"
  install -Dm644 "source/external/discord_game_sdk/lib/$(uname -m)/libdiscord_game_sdk.so" "${pkgdir}/opt/sonic3air/libdiscord_game_sdk.so"

  install -dm755 "${pkgdir}/opt/sonic3air/saves"
  cp -r saves/* "${pkgdir}/opt/sonic3air/saves/"

  cd "./_master_image_template"
  # install -dm755 "${pkgdir}/opt/sonic3air/bonus"
  # cp -r bonus/* "${pkgdir}/opt/sonic3air/bonus/"

  install -dm755 "${pkgdir}/opt/sonic3air/doc"
  cp -r doc/* "${pkgdir}/opt/sonic3air/doc/"

  install -dm755 "${pkgdir}/opt/sonic3air/data"
  cp -r data/* "${pkgdir}/opt/sonic3air/data/"

  install -Dm644 config.json "${pkgdir}/opt/sonic3air/config.json"
  install -Dm644 Manual.pdf "${pkgdir}/opt/sonic3air/Manual.pdf"
}
