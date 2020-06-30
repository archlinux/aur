# Maintainer: Evilandi666 <evilandi.aur(at)googlemail.com>
# Contributor:   Chase <sky[no_spam]<AT>[no_spam]skystrife<DOT>com>

arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'armv8h' 'armv6l' 'armv7l' 'armv8l')
pkgname=aacgain-cvs
pkgver=20130814
pkgrel=5
conflicts=('aacgain')
provides=('aacgain')
makedepends=('git')
depends=('gcc-libs')
pkgdesc="Adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm."
url="http://altosdesign.com/aacgain"
license=('GPL')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mp4v2/mp4v2-1.9.1.tar.bz2
        http://downloads.sourceforge.net/sourceforge/faac/faad2-2.7.tar.bz2
        git+https://github.com/elfchief/mp3gain
        git+https://aur.archlinux.org/aacgain-cvs.git)

sha256sums=('5c381caeab2326fc48cfda0fe202bdb8ba0ae624d9c97ad7680a2b07e2c2e3b4'
            '14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5'
            'SKIP'
            'SKIP')

build() {
    msg "Starting builds..."
    cd $srcdir
    rm -rf mp4v2 faad2
    mv mp4v2-1.9.1 mp4v2
    mv faad2-2.7 faad2
    mv mp3gain mp3gain-tree
    mv mp3gain-tree/aacgain ./
    mv mp3gain-tree/mp3gain ./
    cd aacgain

    msg "Building mp4v2..."
    patch -d ../ -p1 <mp4v2.patch
    cd ../mp4v2
    patch -p0 <$srcdir/aacgain-cvs/fix_missing_ptr_deref.patch
    ./configure
    make libmp4v2.la CXXFLAGS=-Wno-narrowing

    msg "Building faad2..."
    cd ../faad2
    ./configure
    cd libfaad
    make

    msg "Building aacgain..."
    cd ../../aacgain/linux
    sed "s/patch -p0 -N <mp3gain.patch/patch -d ..\/..\/ -p2 -N <mp3gain.patch/" -i prepare.sh
    chmod +x prepare.sh
    ./prepare.sh
    rm -rf build
    mkdir build
    cd build
    ../../../configure --prefix=/usr
    make || return 1
}

package() {
   cd "${srcdir}/aacgain/linux/build/"
   make prefix="$pkgdir/usr" install aacgain || return 1
}
