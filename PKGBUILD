# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio
_pkgname=FamiStudio
pkgver=4.2.0
pkgrel=1
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
    "${pkgname}.desktop" "${_pkgname}.svg"
    "https://github.com/glfw/glfw/archive/refs/tags/3.3.10.tar.gz")
noextract=()

md5sums=('d7c0c6329263af515f7139564cdbb94c'
         '7cecbef97612ec8cf56a84e966382c87'
         'a1156aa440fcc359acc3d43dbfd2d6f9'
         'f6e72e39141fb7f9e71017d52781ee42')
sha256sums=('5ffb0bf62b891bd0396d66f0842303a6d1be999287eb65782c7487b5fb3bf779'
            '2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537'
            'f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8'
            '4ff18a3377da465386374d8127e7b7349b685288cb8e17122f7e1179f73769d5')

validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
    find -name \*.so -delete

    # famistudio only works with glfw 3.3, so build glfw from source
    cmake -B build \
    -S "glfw-3.3.10" \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    cmake --build build
    mv build/src/libglfw.so.3.3 "$_pkgname-$pkgver/$_pkgname/libglfw.so"

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
#      rm ${_pkgname}/bin/Release/net7.0/libglfw.so
    rm ${_pkgname}/bin/Release/net7.0/librtmidi.so

    cp -r "Setup/Demo Songs" ${_pkgname}/bin/Release/net7.0/* \
        "$pkgdir/usr/share/${pkgname}"

    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

    ln -s /usr/lib/libopenal.so $pkgdir/usr/share/${pkgname}/libopenal32.so
#      ln -s /usr/lib/libglfw.so $pkgdir/usr/share/${pkgname}/libglfw.so
    ln -s /usr/lib/librtmidi.so $pkgdir/usr/share/${pkgname}/librtmidi.so

    echo -e "#!/bin/sh\n\ndotnet /usr/share/${pkgname}/${_pkgname}.dll \$*" \
        > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}
