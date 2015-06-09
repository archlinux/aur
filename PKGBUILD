# Maintainer: Evilandi666 <evilandi.aur(at)googlemail.com>
# Contributor:   Chase <sky[no_spam]<AT>[no_spam]skystrife<DOT>com>

arch=('i686' 'x86_64')
pkgname=aacgain-cvs
pkgver=20130814
pkgrel=2
conflicts=('aacgain')
provides=('aacgain')
makedepends=('cvs')
depends=('gcc-libs')
pkgdesc="Adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm."
url="http://altosdesign.com/aacgain"
license=('GPL')
source=(http://mp4v2.googlecode.com/files/mp4v2-1.9.1.tar.bz2
        http://downloads.sourceforge.net/sourceforge/faac/faad2-2.7.tar.bz2)

sha256sums=('5c381caeab2326fc48cfda0fe202bdb8ba0ae624d9c97ad7680a2b07e2c2e3b4'
            '14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5')

build() {
    cd $srcdir
    msg "Connecting to cvs server for mp3gain..."
    if [[ -d mp3gain ]]; then
        cd mp3gain
        cvs -z3 update -d
    else
        cvs -z3 -d:pserver:anonymous@mp3gain.cvs.sourceforge.net:/cvsroot/mp3gain co -P mp3gain
    fi
    cd $srcdir
    msg "Connecting to cvs server for aacgain..."
    if [[ -d aacgain ]]; then
        cd aacgain
        cvs -z3 update -d
    else
        cvs -z3 -d:pserver:anonymous@mp3gain.cvs.sourceforge.net:/cvsroot/mp3gain co -P aacgain
    fi

    msg "Done checking out..."
    msg "Starting builds..."
    cd $srcdir
    rm -rf mp4v2 faad2
    mv mp4v2-1.9.1 mp4v2
    mv faad2-2.7 faad2
    cd aacgain

    msg "Building mp4v2..."
    patch -d ../ -p1 <mp4v2.patch
    cd ../mp4v2
    ./configure
    make libmp4v2.la

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
