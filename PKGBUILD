# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: Premysl Janouch <warriant@gmail.com>

pkgname=quake2
pkgver=r0.16.2
pkgrel=4
pkgdesc="Quake 2 engine. You need the retail .pak files to play."
url="http://www.icculus.org/quake2/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libjpeg' 'sdl' 'libxxf86vm' 'libxxf86dga')
makedepends=('patch' 'unzip')
install="quake2.install"
source=("http://www.icculus.org/quake2/files/quake2-$pkgver.tar.gz" \
'http://cesium.di.uminho.pt/pub/games/quake2/source/xatrixsrc320.shar.Z' \
'http://cesium.di.uminho.pt/pub/games/quake2/source/roguesrc320.shar.Z' \
'ftp://ftp.idsoftware.com/idstuff/quake2/q2-3.20-x86-full-ctf.exe' \
'http://www.icculus.org/quake2/files/maxpak.pak' \
'http://www.icculus.org/quake2/files/pak10.pak' \
'http://www.icculus.org/quake2/files/pak11.pak' \
'http://www.icculus.org/quake2/files/pak12.pak' \
'http://www.icculus.org/quake2/files/pak13.pak' \
'http://www.icculus.org/quake2/files/pak14.pak' \
'http://www.icculus.org/quake2/files/pak16.pak' \
'http://www.icculus.org/quake2/files/pak17.pak' \
'http://www.icculus.org/quake2/files/pak19.pak' \
'quake2.sh' 'q2ded.sh' 'xatrix.sh' 'rogue.sh' 'ctf.sh' 'snd_alsa.c' 'gnusource.patch')
md5sums=('872fee27fb13a2a4c8876d5973c3c691'
         '41fc4ecc4f25c068e7d1f488bd4a1e1a'
         '7d5e052839c9e629bad0a6570aa70554'
         '490557d4a90ff346a175d865a2bade87'
         '04d3f1fb7fb4dada7175a41f4595c7eb'
         'fc2de3c33c23cca5f0e6fcec068ce616'
         '221019679613a13c6d7e5f9e21701d85'
         '0c8b49c303014e535394168aed9b668a'
         '9628c82566535e48c59caaee5281b963'
         '5d47605de09c458c7f1c69d8e6fea6a7'
         '94b18e1f2d76fb7e7d0c5bd0ae8d7c69'
         'e24d79286ba3c1f3da1f9642a78c49af'
         '070a4d00b93a2a427ca92adee2736000'
         'db757415bd3736cad2d52691e8cf7d55'
         '50c72cc1ded252ee86db31ac8fa5b569'
         '1a63caa4b66e6dbc63ed5c5fb15b9777'
         '2deb322d859490f9178393abf74a3a27'
         '3fe30c3a48f93f431ea191f13d49ea22'
         'c16644a6ddf93159ccc71e4c06e312c4'
         '5788ed0d1bde8b00fa8b91a0c865f427')

build() {
    cd $srcdir

    # Computer Architecture Variable used by Quake2
    [ "$CARCH" = "i686" ] && _dirarch=i386
    [ "$CARCH" = "x86_64" ] && _dirarch=x86_64

    # Create Temporary Directories
    install -d $pkgname-$pkgver/src/xatrix $pkgname-$pkgver/src/rogue

    # Decompress and patch The Reckoning (xatrix) and Ground Zero (rouge) Expansions
    for _addon in xatrix rogue; do
        _shar=${_addon}src320.shar

        cp $srcdir/${_shar}.Z $srcdir/$pkgname-$pkgver/src/${_addon}
        cd $srcdir/$pkgname-$pkgver/src/${_addon}

        # Decompress
        msg "Unpacking ${_shar}.Z"
        uncompress ${_shar}.Z

        # Remove Prompts
        /bin/sed -i -e 's:^read ans:ans=yes :' ${_shar}
        /bin/sed -i -e 's:^more <<EOF:cat <<EOF:' ${_shar}

        # Run Installer
        msg "Running ${_shar}"
        sh ${_shar}

        msg "Patching ${_addon}"

        # Patch (rogue-only)
        if [ ${_addon} = "rogue" ]; then
            /bin/sed -e "s/#include <nan.h>/#include <bits\/nan.h>/" -i g_local.h
        fi

        # Patches (Both Expansions)
        /bin/sed -e "s/extern\tint\tjacket_armor_index/static\tint\tjacket_armor_index/" -i g_local.h
        /bin/sed -e "s/extern\tint\tcombat_armor_index/static\tint\tcombat_armor_index/" -i g_local.h
        /bin/sed -e "s/extern\tint\tbody_armor_index/static\tint\tbody_armor_index/" -i g_local.h
    done

    msg "The Reckoning and Ground Zero Expansion install complete"

    cd $srcdir/$pkgname-$pkgver/

    # Patch from SVN
    cp $srcdir/snd_alsa.c ./src/linux/snd_alsa.c

    # x86_64 patch from Gentoo
    patch -p1 < $srcdir/gnusource.patch

    # libjpeg Fix
    /bin/sed -i -e 's:jpeg_mem_src:_&:' \
        $srcdir/$pkgname-$pkgver/src/ref_candygl/gl_image.c

    msg "Compiling Quake 2"

    # Compile Quake 2
    make -s BUILD_XATRIX=YES BUILD_ROGUE=YES BUILD_DEDICATED=YES BUILD_CTF=YES BUILD_QMAX=YES build_release

    cd $srcdir/$pkgname-$pkgver/release$_dirarch

    # Create Destination Directories
    install -d $pkgdir/opt/quake2/{baseq2,ctf,xatrix,rogue}

    # Install Binary
    install -m 755 quake2 $pkgdir/opt/quake2/quake2

    # Install Binary (SDL)
    install -m 755 sdlquake2 $pkgdir/opt/quake2/sdlquake2

    # Install Base Game Library
    install -m 755 game$_dirarch.so $pkgdir/opt/quake2/baseq2/

    # Install CTF Library
    install -m 755 ctf/game$_dirarch.so $pkgdir/opt/quake2/ctf/

    # Install Xatrix Library
    install -m 755 xatrix/game$_dirarch.so $pkgdir/opt/quake2/xatrix/

    # Install Rogue Library
    install -m 755 rogue/game$_dirarch.so $pkgdir/opt/quake2/rogue/

    # Install Additional Libraries
    cp ref_*.so $pkgdir/opt/quake2/

    cd $srcdir

    # Decompress and Install CTF Patch Data
    mkdir $srcdir/q2
    cp $srcdir/q2-3.20-x86-full-ctf.exe $srcdir/q2
    cd $srcdir/q2
    unzip -L q2-3.20-x86-full-ctf.exe
    cp baseq2/pak1.pak baseq2/pak2.pak $pkgdir/opt/quake2/baseq2/
    cp -r baseq2/players $pkgdir/opt/quake2/baseq2/
    cp ctf/* $pkgdir/opt/quake2/ctf/

    # Install Q2Max Pak File
    install $srcdir/maxpak.pak $pkgdir/opt/quake2/baseq2/

    # Install Additional pak Files
    for i in {10,11,12,13,14,16,17,19}; do
        install -m 644 $srcdir/pak${i}.pak $pkgdir/opt/quake2/baseq2/pak${i}.pak
    done;

    # Install Game Launchers
    install -D -m 755 $startdir/quake2.sh $pkgdir/usr/bin/quake2
    install -D -m 755 $startdir/q2ded.sh  $pkgdir/usr/bin/q2ded
    install -D -m 755 $startdir/xatrix.sh $pkgdir/usr/bin/quake2-the-reckoning
    install -D -m 755 $startdir/rogue.sh  $pkgdir/usr/bin/quake2-ground-zero
    install -D -m 755 $startdir/ctf.sh    $pkgdir/usr/bin/quake2-ctf
}

