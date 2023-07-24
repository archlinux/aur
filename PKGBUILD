#Maintainer: ubervison <vis0n at protonmail dot com>
# Contributor: Stephen Baker <baker dot stephen dot e at gmail dot com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=nwn-gog
pkgver=2.1.0.21
pkgrel=7
pkgdesc="Neverwinter Nights is an RPG from Bioware. This requires the GOG version."
url="https://www.gog.com/game/neverwinter_nights_enhanced_edition_pack"
license=('custom')
arch=('i686' 'x86_64')
depends=('binkplayer-bin' 'perl' 'elfutils' 'icoutils')
depends_x86_64=('lib32-libelf' 'lib32-libstdc++5' 'lib32-libgl' 'lib32-glu' 'lib32-libxcursor' 'lib32-libxdamage' 'lib32-sdl_mixer' 'gcc-multilib')
depends_i686=('libgl' 'glu' 'libstdc++5' 'libxcursor' 'sdl_mixer')
makedepends=('git' 'innoextract' 'p7zip' 'perl' 'unzip' 'unrar' 'rsync')
optdepends=('xdg-utils: xdg .desktop file support')
provides=('nwn')
conflicts=('nwn')
install=nwn.install

PKGEXT='.pkg.tar'

source=("setup_nwn_diamond_$pkgver.exe::gogdownloader://neverwinter_nights_diamond_edition/en1installer0" \
        "setup_nwn_diamond_$pkgver-1.bin::gogdownloader://neverwinter_nights_diamond_edition/en1installer1" \
        "nvn_KingmakerSetup.zip::gogdownloader://neverwinter_nights_diamond_edition/9213" \
        "https://lutris.net/files/games/neverwinter-nights/nwclientgold.tar.gz" \
        "https://lutris.net/files/games/neverwinter-nights/nwclienthotu.tar.gz" \
        "https://lutris.net/files/games/neverwinter-nights/English_linuxclient169_xp2.tar.gz" \
        "libz.patch" \
        "nwn.launcher" \
        "nwn.desktop" \
        "git+https://github.com/nwnlinux/nwmouse.git" \
        "git+https://github.com/nwnlinux/nwuser.git" \
        "git+https://github.com/nwnlinux/nwlogger.git" \
        "git+https://github.com/nwnlinux/nwmovies.git")
noextract=("nwclientgold.tar.gz" "nwclienthotu.tar.gz" "English_linuxclient169_xp2.tar.gz" "setup_nwn_diamond_$pkgver-1.bin" "nvn_KingmakerSetup.zip")

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

md5sums=('cd809b9d22022adb01b0d1d70c5afa8e'
         'ce60bf104cc6082fe79d6f0bd7b48f51'
         '57be8c593db88db6b6ee78ba9201ec53'
         '0a059d55225fc32f905e86191d88a11f'
         '376cdece07106ea058d42b531f3146bb'
         'b021f0da3b3e00848521926716fdf487'
         'd0a157cefe55daa9d06e9803ade22fdc'
         '966641dc9bfd49ff56bf1dac9fe00c3c'
         '3a7fa617a2aa8d324bb4d57dcf84cf8c'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare()
{
    # Extract gog setup
    innoextract -e $srcdir/setup_nwn_diamond_${pkgver}.exe -d $srcdir --gog || return 1

    # Extract Kingmaker installer
    unzip -o $srcdir/nvn_KingmakerSetup.zip -d $srcdir || return 1

    # Extract game icons
    if [ -d $srcdir/icons ]; then
        rm -r $srcdir/icons
    fi
    mkdir $srcdir/icons
    icotool -x -p 0 $srcdir/game/goggame-1207658890.ico -o $srcdir/icons

    # Extract Kingmaker files
    7z x -y $srcdir/KingmakerSetup.exe -xr'!$PLUGINSDIR' -xr'!*.exe' -xr'!*.dat' -o$srcdir/kingmakertmp/ || return 1
    
    # Patch nwlogger so that it finds sys/user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' $srcdir/nwlogger/nwlogger/nwlogger_cookie.c

    # Patch nwmovies to link against zlib
    cp libz.patch $srcdir/nwmovies/nwmovies
    cd $srcdir/nwmovies/nwmovies
    patch < libz.patch
}

build()
{
    # Compile mwmovies
    cd $srcdir/nwmovies
    ./nwmovies_install.pl build

    # Compile nwuser
    cd $srcdir/nwuser
    ./nwuser_install.pl

    # Compile nwmouse
    cd $srcdir/nwmouse
    ./nwmouse_install.pl

    # Compile nwlogger
    cd $srcdir/nwlogger
    ./nwlogger_install.pl
}

package()
{
    cd $srcdir

    # Create final directory
    install -d $pkgdir/opt/nwn

    # Move game files to directory
    cd game
    rsync -aR ambient data dmvault hak localvault modules movies music nwm texturepacks premium chitin.key dialog.tlk xp1.key xp2.key $pkgdir/opt/nwn

    # Extract linux clients
    tar zxfv $srcdir/nwclientgold.tar.gz --directory $pkgdir/opt/nwn
    tar zxvf $srcdir/nwclienthotu.tar.gz --directory $pkgdir/opt/nwn

    # Install Kingmaker files
    rsync -av $srcdir/kingmakertmp/\$0/ $pkgdir/opt/nwn

    # Extract latest patch
    tar zxvf $srcdir/English_linuxclient169_xp2.tar.gz --directory $pkgdir/opt/nwn

    # Check installation
    cd $pkgdir/opt/nwn
    ./fixinstall

    # Included SDL is old and buggy. Get rid of it.
    rm -r $pkgdir/opt/nwn/SDL-1.2.5/

    # Install nwmovies binaries 
    install -D -m 755 $srcdir/nwmovies/nwmovies.so $pkgdir/opt/nwn/nwmovies.so
    # Install libdis binaries 
    install -D -m 755 $srcdir/nwmovies/nwmovies/libdis/libdisasm.so $pkgdir/opt/nwn/lib/libdisasm.so

    # Install nwuser binaries
    install -D -m 755 $srcdir/nwuser/nwuser/nwuser.so $pkgdir/opt/nwn/nwuser.so
    if [ "$CARCH" = "x86_64" ]; then
        install -D -m 755 $srcdir/nwuser/nwuser/nwuser64.so $pkgdir/opt/nwn/nwuser64.so
    fi

    # Install nwmouse binaries
    install -D -m 755 $srcdir/nwmouse/nwmouse/nwmouse.so $pkgdir/opt/nwn/nwmouse.so
    # Install libdis binaries
    install -D -m 755 $srcdir/nwmouse/nwmouse/libdis/libdisasm.so $pkgdir/opt/nwn/nwmouse/libdis/libdisasm.so

    # Install nwlogger binaries
    install -D -m 755 $srcdir/nwlogger/nwlogger/nwlogger.so $pkgdir/opt/nwn/nwlogger.so
    # Install libdis binaries
    install -D -m 755 $srcdir/nwlogger/nwlogger/libdis/libdisasm.so $pkgdir/opt/nwn/nwlogger/libdis/libdisasm.so

    # Copy cdkey
    cp $srcdir/support/app/nwncdkey.ini $pkgdir/opt/nwn

    # Copy custom license
    install -D -m 644 $srcdir/game/docs/readme.txt $pkgdir/usr/share/licenses/$pkgname/PLATINUM_LICENSE.txt
    install -D -m 644 $srcdir/game/docs/HotUreadme.txt $pkgdir/usr/share/licenses/$pkgname/HOTU_LICENSE.txt
    install -D -m 644 $srcdir/game/docs/SoUreadme.txt $pkgdir/usr/share/licenses/$pkgname/SOU_LICENSE.txt

    # Install .desktop file
    install -D -m 644 $srcdir/nwn.desktop $pkgdir/usr/share/applications/nwn.desktop

    # Install launcher
    install -D -m 755 $srcdir/nwn.launcher $pkgdir/opt/nwn/nwn.sh
    install -D -m 755 $srcdir/nwn.launcher $pkgdir/usr/bin/nwn

    # Install icons files
    install -D -m 644 $srcdir/icons/goggame-1207658890_6_256x256x32.png $pkgdir/usr/share/icons/hicolor/256x256/apps/nwn.png
    install -D -m 644 $srcdir/icons/goggame-1207658890_7_48x48x32.png $pkgdir/usr/share/icons/hicolor/48x48/apps/nwn.png
    install -D -m 644 $srcdir/icons/goggame-1207658890_8_32x32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/nwn.png
    install -D -m 644 $srcdir/icons/goggame-1207658890_9_16x16x32.png $pkgdir/usr/share/icons/hicolor/16x16/apps/nwn.png

    # Fix Permissions, just to be sure
    chown -R $USER:$USER $pkgdir
    chmod -R 755 $pkgdir
}

