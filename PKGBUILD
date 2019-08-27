# Maintainer: Allan M. de Azevedo <4lln.medeiros@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=lib32-pcsxr
pkgver=1.9.93
pkgrel=5
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df project (lib32)'
arch=('x86_64')
url='http://pcsxr.codeplex.com/'
license=('GPL')
depends=('lib32-libcdio' 'lib32-libxv' 'lib32-sdl' 'lib32-gtk3')
makedepends=('lib32-mesa')
optdepends=('lib32-libpulse: Pulseaudio support'
            'lib32-alsa-plugins: ALSA support')
provides=("pcsxr")
conflicts=("pcsxr" "pcsxr-git")

# Accessible through /srv/ftp/other/community on nymeria.
source=("https://sources.archlinux.org/other/community/pcsxr/pcsxr-${pkgver}.tar.bz2")

prepare() {
    cd "$srcdir/pcsxr"
    sed -i 's/uncompress2/uncompress2_internal/' libpcsxcore/cdriso.c
}

build() {
    cd "$srcdir/pcsxr"

    export CC="gcc"
    export CXX="g++"
    export CFLAGS+=" -m32 -I/usr/include/harfbuzz"
    export CXXFLAGS+=" -m32 -I/usr/include/harfbuzz"
    export LDFLAGS+=" -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    autoreconf -f -i
    intltoolize --force

    ./configure --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-dynarec=x86 \
        --enable-libcdio \
        --enable-opengl
    make
}

package() {
    cd "$srcdir/pcsxr"
    make DESTDIR="$pkgdir" install
}

md5sums=('d75725b4c3fcb2cb11d39b3ace10dc31')
