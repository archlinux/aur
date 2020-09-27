# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.20
pkgrel=1
pkgdesc="A graphical tool to edit video (filter/re-encode/split), legacy version"
arch=(i686 x86_64)
url=http://fixounet.free.fr/avidemux/
license=(GPL2)
depends=(twolame qt5-tools opencore-amr jack flac x264 x265 xvidcore sqlite libpulse libva libvdpau faac faad2 lame libdca fribidi libvpx fontconfig glu qt5-base)
makedepends=(cmake yasm sdl libxv jack libsamplerate freetype2 libxext libxml2 pkg-config clang)
optdepends=(libvorbis sdl alsa-lib libxv)
conflicts=('avidemux' 'avidemux-cli' 'avidemux-core' 'avidemux-gtk' 'avidemux-qt' 'avidemux-git')
provides=($pkgname=$pkgver)
options=('!makeflags')
source=("https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}.tar.gz"
    "missing-includes.patch"
    "check-x264.patch"
    "include-qrubberband.patch"
    "libdir.patch"
    )
# From upstream:
# md5sums=('52be64ae608c9195454b5393ba684fc0' 'SKIP' 'SKIP' 'SKIP')
sha512sums=('d01d0fc24a3004770bd3923c2debc4fa2752eb71df08cfe423746b9c44a2562ca01d82965ed2563b99572a4bed8034b79487199ce330208b51a3b7f87ccf7103'
'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd $srcdir/"$_pkgname"_"$pkgver"
    # Clang doesn't understand -fvar-tracking-assignments
    # -Wno-reserved-user-defined-literal fixes some issues because it builds (old) ffmpeg with clang++, and not clang
    export CXXFLAGS="${CXXFLAGS//-fvar-tracking-assignments} -Wno-reserved-user-defined-literal"
    export CFLAGS="${CFLAGS//-fvar-tracking-assignments} -Wno-reserved-user-defined-literal"
    sed -i -e 's/-j 2/-j 1/g' bootStrap.bash
    sed -i -e 's/pow10f(x)/powf(10.0,x)/g' avidemux/common/ADM_audioFilter/src/audiofilter_normalize.cpp

    for p in ../*.patch; do
         patch -p1 -i "$p"
    done

    bash bootStrap.bash \
        --with-system-libass --with-system-liba52 --with-system-libmad --with-system-libmp4v2 \
        --with-clang # it has a lot of old "fixes"/hacks for gcc that doesn't work anymore, so just use clang
    sed -i -e 's/avidemux2_gtk/avidemux3_qt5/g' "$_pkgname"2.desktop
    sed -i -e 's/avidemux2/avidemux/g' "$_pkgname"2.desktop
}

package() {
    cd $srcdir/"$_pkgname"_"$pkgver"/install
    cp -R usr/ "$pkgdir"/
    cd $srcdir/"$_pkgname"_"$pkgver"
    install -Dm644 "$_pkgname"_icon.png "$pkgdir"/usr/share/pixmaps/avidemux.png
    install -Dm644 "$_pkgname"2.desktop "$pkgdir"/usr/share/applications/avidemux.desktop

}
