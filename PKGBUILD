# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio
_pkgname=FamiStudio
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(mono gtk-sharp-2 openal libcanberra rtmidi ffmpeg)
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

md5sums=("b81503890f9e277ce84b731ed04cbb82"
         "7cecbef97612ec8cf56a84e966382c87"
         "a1156aa440fcc359acc3d43dbfd2d6f9")
sha256sums=("3397dabbefc869fbcc08fff4963d9065033488626a90ba4f769cb5ad943dbacc"
            "2c25b53b8a287ef5c29a1f32c32ad8cc56f093cb08f02cf0d09550a1bcd19537"
            "f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8")

validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"

    find -name \*.so -delete

    cd NotSoFatso && ./build_linux.sh && cd ..
    cp NotSoFatso/libNotSoFatso.so ${_pkgname}/

    cd NesSndEmu && ./build_linux.sh && cd ..
    cp NesSndEmu/libNesSndEmu.so ${_pkgname}/

    if [ -d ShineMp3 ]; then
        cd ShineMp3 && ./build_linux.sh && cd ..
        cp ShineMp3/libShineMp3.so ${_pkgname}/
    fi

    touch ${_pkgname}/libopenal32.so ${_pkgname}/librtmidi.so
#     ln -s /usr/lib/libopenal.so ${_pkgname}/libopenal32.so
#     ln -s /usr/lib/librtmidi.so ${_pkgname}/librtmidi.so

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

    rm ${_pkgname}/bin/Release/libopenal32.so \
        ${_pkgname}/bin/Release/librtmidi.so

    cp -r "Setup/Demo Songs" ${_pkgname}/bin/Release/* \
        "$pkgdir/usr/share/${pkgname}"

    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

    ln -s /usr/lib/libopenal.so $pkgdir/usr/share/${pkgname}/libopenal32.so
    ln -s /usr/lib/librtmidi.so $pkgdir/usr/share/${pkgname}/librtmidi.so

    echo -e "#!/bin/sh\n\nmono /usr/share/${pkgname}/${_pkgname}.exe" \
        > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}
