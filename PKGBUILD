# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.12
pkgrel=2
pkgdesc="A graphical tool to edit video (filter/re-encode/split)"
arch=(i686 x86_64)
url=http://fixounet.free.fr/avidemux/
license=(GPL2)
depends=(twolame qt5-tools opencore-amr jack flac x264 x265 xvidcore sqlite libpulse libva libvdpau faac faad2 lame libdca fribidi libvpx fontconfig glu qt5-base)
makedepends=(cmake yasm sdl libxv jack libsamplerate freetype2 libxext libxml2 pkg-config)
optdepends=(libvorbis sdl alsa-lib libxv)
conflicts=('avidemux' 'avidemux-cli' 'avidemux-gtk' 'avidemux-qt' 'avidemux-git')
provides=($pkgname=$pkgver)
options=('!makeflags')
source=('https://dl.dropboxusercontent.com/u/26513012/'$_pkgname'_'$pkgver'.tar.gz'
        'avidemux-2.6.12-gcc6.patch'
        'avidemux-2.6.12-narrowing.patch'
        'avidemux-2.6.12-qt.patch')
sha512sums=('ca5a03eae6bb583d20499da68400645cc7b66c27255fc77f18ffe311d3d27eaaf3ca813aff25a54934d76fe5d10d9fb48b2ad30d662377764f3ec1b620d5a824'
            '9912bc0c7978f7ec673c39389483b15947f36c9de374ed712602809fffc973c11f77873a9029ab1d767ff9d6f83986860debf8b8d38bd790ad0448a38a497cef'
            'e60915887645a61e5aacabe32a7bf8bd455c136e3f4bbeae42b159a4039ade9bf9e37759db4ff34f184f12a3292671bf8490fbd98d0fbb25acfbf0b5e3079228'
            '99f44822d6ada63cccd7e799a5c6edf403273e535dd8a6e005909f4286e6d399a26fc45d790ce00f68a5e11fdba6470e13db99468ecbcff71aa6cc96815dbe7c')

prepare() {
  cd $srcdir/"$_pkgname"_"$pkgver"
  patch -p1 -i "${srcdir}/avidemux-2.6.12-gcc6.patch"
  patch -p1 -i "${srcdir}/avidemux-2.6.12-narrowing.patch"
  patch -p1 -i "${srcdir}/avidemux-2.6.12-qt.patch"
}

build() {
    cd $srcdir/"$_pkgname"_"$pkgver"
    sed -i -e 's/-j 2/-j 1/g' bootStrap.bash
    bash bootStrap.bash   --without-gtk --enable-qt5
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
