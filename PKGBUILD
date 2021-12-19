# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio
_pkgname=FamiStudio
pkgver=3.2.2
pkgrel=1
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(mono gtk-sharp-2 openal libcanberra rtmidi libvorbis ffmpeg)
makedepends=(mono-msbuild mono-msbuild-sdkresolver nuget)
checkdepends=()
optdepends=()
provides=()
conflicts=('famistudio-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/BleuBleu/${_pkgname}/archive/${pkgver}.tar.gz"
    "${pkgname}.desktop" "${_pkgname}.svg")
noextract=()

md5sums=('3b2ea8f586e6d7ef74c7ba1c7e9ba0c5'
         '7cecbef97612ec8cf56a84e966382c87'
         'a1156aa440fcc359acc3d43dbfd2d6f9')
sha256sums=('e43ae88366a1106f4940314e147007b06575afe2256583e21495e4ea865fa894'
            '2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537'
            'f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"

    # this application is incompatible with rtmidi 5, so we'll use rtmidi 4
    # which is packaged with it for now.
    find \( -name \*.so -a ! -name librtmidi.so \) -delete

    cd ThirdParty/NotSoFatso && ./build_linux.sh && cd -
    cp ThirdParty/NotSoFatso/libNotSoFatso.so FamiStudio/

    cd ThirdParty/NesSndEmu && ./build_linux.sh && cd -
    cp ThirdParty/NesSndEmu/libNesSndEmu.so FamiStudio/

    cd ThirdParty/ShineMp3 && ./build_linux.sh && cd -
    cp ThirdParty/ShineMp3/libShineMp3.so FamiStudio/

    cd ThirdParty/Vorbis && ./build_linux.sh && cd -
    cp ThirdParty/Vorbis/libVorbis.so FamiStudio/

#     touch ${_pkgname}/libopenal32.so ${_pkgname}/librtmidi.so ${_pkgname}/libVorbis.so
    touch ${_pkgname}/libopenal32.so ${_pkgname}/libVorbis.so

    msbuild -restore ${_pkgname}.Linux.sln
    msbuild -p:Configuration=Release -p:Platform=x64 ${_pkgname}.Linux.sln
    rm ${_pkgname}/bin/Release/*.pdb
}

package() {
    mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/${pkgname} \
        $pkgdir/usr/bin $pkgdir/usr/share/licenses/${pkgname}
    cp ${pkgname}.desktop $pkgdir/usr/share/applications/
    cp ${_pkgname}.svg "$pkgdir/usr/share/${pkgname}"
    cd ${_pkgname}-${pkgver}

    rm ${_pkgname}/bin/Release/libopenal32.so # \
#         ${_pkgname}/bin/Release/librtmidi.so

    cp -r "Setup/Demo Songs" ${_pkgname}/bin/Release/* \
        "$pkgdir/usr/share/${pkgname}"

    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

    ln -s /usr/lib/libopenal.so $pkgdir/usr/share/${pkgname}/libopenal32.so
#     ln -s /usr/lib/librtmidi.so $pkgdir/usr/share/${pkgname}/librtmidi.so

    echo -e "#!/bin/sh\n\nmono /usr/share/${pkgname}/${_pkgname}.exe \$*" \
        > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}
