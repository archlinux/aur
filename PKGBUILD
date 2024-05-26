# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio
_pkgname=FamiStudio
pkgver=4.2.1
pkgrel=2
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(dotnet-runtime dotnet-runtime-7.0 openal libcanberra rtmidi libvorbis ffmpeg glfw)
makedepends=(dotnet-sdk)
checkdepends=()
optdepends=()
provides=()
conflicts=('famistudio-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/BleuBleu/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.desktop" "${_pkgname}.svg")
noextract=()

md5sums=('674f62bd882874e08c7dc2d3364c1487'
         '7cecbef97612ec8cf56a84e966382c87'
         'a1156aa440fcc359acc3d43dbfd2d6f9')
sha256sums=('412c4e4dfa4008ab751cac124dd2d836fc2a5cd428db1f81bac7ba25a5a7095e'
            '2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537'
            'f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8')

validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
    find -name \*.so -delete

	cd "$_pkgname-$pkgver"

    cd ThirdParty/NotSoFatso && ./build_linux.sh && cd -
    cp ThirdParty/NotSoFatso/libNotSoFatso.so FamiStudio/

    cd ThirdParty/NesSndEmu && ./build_linux.sh && cd -
    cp ThirdParty/NesSndEmu/libNesSndEmu.so FamiStudio/

    cd ThirdParty/ShineMp3 && ./build_linux.sh && cd -
    cp ThirdParty/ShineMp3/libShineMp3.so FamiStudio/

    cd ThirdParty/Vorbis && ./build_linux.sh && cd -
    cp ThirdParty/Vorbis/libVorbis.so FamiStudio/

    cd ThirdParty/GifDec && ./build_linux.sh && cd -
    cp ThirdParty/GifDec/libGifDec.so FamiStudio/

    cd ThirdParty/Stb && ./build_linux.sh && cd -
    cp ThirdParty/Stb/libStb.so FamiStudio/

    touch ${_pkgname}/libopenal32.so
    touch ${_pkgname}/libglfw.so
    touch ${_pkgname}/librtmidi.so 

    dotnet build -c:Release ${_pkgname}/${_pkgname}.Linux.csproj
}

package() {
    mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/${pkgname} \
        $pkgdir/usr/bin $pkgdir/usr/share/licenses/${pkgname}
    cp ${pkgname}.desktop $pkgdir/usr/share/applications/
    cp ${_pkgname}.svg "$pkgdir/usr/share/${pkgname}"
    cd ${_pkgname}-${pkgver}

    rm ${_pkgname}/bin/Release/net7.0/libopenal32.so
    rm ${_pkgname}/bin/Release/net7.0/libglfw.so
    rm ${_pkgname}/bin/Release/net7.0/librtmidi.so

    cp -r "Setup/Demo Songs" ${_pkgname}/bin/Release/net7.0/* \
        "$pkgdir/usr/share/${pkgname}"

    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

    ln -s /usr/lib/libopenal.so $pkgdir/usr/share/${pkgname}/libopenal32.so
    ln -s /usr/lib/libglfw.so $pkgdir/usr/share/${pkgname}/libglfw.so
    ln -s /usr/lib/librtmidi.so $pkgdir/usr/share/${pkgname}/librtmidi.so

    echo -e "#!/bin/sh\n\nXDG_SESSION_TYPE="x11" dotnet /usr/share/${pkgname}/${_pkgname}.dll \$*" \
        > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}
