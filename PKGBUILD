# Maintainer: Stephen Baker <baker dot stephen dot e at gmail dot com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=nwn-gog
pkgver=2.0.0.15
pkgrel=4
pkgdesc="Neverwinter Nights is an RPG from Bioware. This requires the GOG version."
url="http://nwn.bioware.com/"
license=('custom')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
    depends=('binkplayer' 'elfutils' 'lib32-elfutils' 'lib32-libgl' 'lib32-glu' 'lib32-libstdc++5' 'lib32-libxcursor' 'lib32-libxdamage' 'perl' 'lib32-sdl_mixer')
else
    depends=('binkplayer' 'elfutils' 'libgl' 'glu' 'libstdc++5' 'libxcursor' 'perl' 'sdl_mixer')
fi
makedepends=('git' 'icoutils' 'innoextract' 'p7zip' 'perl' 'unzip')
optdepends=('xdg-utils: xdg .desktop file support')
provides=('nwn')
conflicts=('nwn')
install=nwn.install
source=("gog://neverwinter_nights_diamond_edition/setup_nwn_diamond_${pkgver}.exe" \
        "gog://neverwinter_nights_diamond_edition/setup_nwn_diamond_${pkgver}-1.bin" \
        "gog://neverwinter_nights_diamond_edition/setup_nwn_diamond_${pkgver}-2.bin" \
        "gog://neverwinter_nights_diamond_edition/extras/nvn_KingmakerSetup.zip" \
        "http://nwdownloads.bioware.com/neverwinternights/linux/gold/nwclientgold.tar.gz" \
        "http://nwdownloads.bioware.com/neverwinternights/linux/161/nwclienthotu.tar.gz" \
        "http://files.bioware.com/neverwinternights/updates/linux/169/English_linuxclient169_xp2.tar.gz" \
        "nwn.launcher" \
        "nwn.desktop" \
        "git+https://github.com/nwnlinux/nwmouse.git#commit=6df8b96f" \
        "git+https://github.com/nwnlinux/nwuser.git#commit=3fbbf546" \
        "git+https://github.com/nwnlinux/nwlogger.git#commit=3bfa7aa5" \
        "git+https://github.com/nwnlinux/nwmovies.git#commit=61fb3645")
noextract=('nwclientgold.tar.gz' 'nwclienthotu.tar.gz' 'nwmovies-latest.tar.gz')
md5sums=('e7d063a2c892519dc431fc84c3611a65'
         '2b6bec0df8d2f1755876407069f6ae43'
         'db2c1e75b087e43fa5895bcc70fca8b9'
         '57be8c593db88db6b6ee78ba9201ec53'
         '0a059d55225fc32f905e86191d88a11f'
         '376cdece07106ea058d42b531f3146bb'
         'b021f0da3b3e00848521926716fdf487'
         '7fd0497f55856edf50480b5acd3136d3'
         '26c5f221589ba84af13039c805ac1210'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
PKGEXT='.pkg.tar'

prepare()
{
    # Extract gog setup
    innoextract -e $srcdir/setup_nwn_diamond_2.0.0.15.exe -d $srcdir || return 1

    # Move the original cd key so it doesn't get overwritten
    mv $srcdir/app/nwncdkey.ini $srcdir/nwncdkey.ini

    # Extract Game Icons
    mkdir $srcdir/icons
    icotool -x -p 0 $srcdir/app/gfw_high.ico -o $srcdir/icons

    # Extract Kingmaker Files
    7z x $srcdir/KingmakerSetup.exe -xr0\!*PLUGINSDIR* -xr\!*.exe -xr\!*.dat \
        -o$srcdir/kingmakertmp/

    # Patch nwmouse so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' $srcdir/nwmouse/nwmouse/nwmouse_cookie.c

    # Patch nwlogger so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' $srcdir/nwlogger/nwlogger/nwlogger_cookie.c
}

build()
{
    # Compile nwmovies using the appropriate SDL library
    cd $srcdir/nwmovies
    if [ "$CARCH" = "x86_64" ]; then
        ./nwmovies_install.pl /usr/lib32/libSDL-1.2.so.0
    else
        ./nwmovies_install.pl /usr/lib/libSDL-1.2.so.0
    fi

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
    cd $srcdir/

    # Create Destination Directory
    install -d $pkgdir/opt/nwn

    # Move game files to directory
    cp -R $srcdir/app/* $pkgdir/opt/nwn

    # Extract Game Clients
    tar -zxvf $srcdir/nwclientgold.tar.gz -C $pkgdir/opt/nwn/
    tar -zxvf $srcdir/nwclienthotu.tar.gz -C $pkgdir/opt/nwn/

    # Install Kingmaker Files
    cp -r $srcdir/kingmakertmp/\$0/* \
        $pkgdir/opt/nwn/

    # Extract Latest Patch
    tar -zxvf $srcdir/English_linuxclient169_xp2.tar.gz -C $pkgdir/opt/nwn

    # Check the Installation
    cd $pkgdir/opt/nwn/
    ./fixinstall

    # Remove Unneeded Files & Directories
    rm -r $pkgdir/opt/nwn/SDL-1.2.5/

    # Install nwmovies binaries
    install -D -m 755 -t $pkgdir/opt/nwn/ \
        $srcdir/nwmovies/{nwmovies.so,nwmovies.pl}

    # Install binkplayer binaries
    install -D -m 755 $srcdir/nwmovies/nwmovies/binklib.so \
        $pkgdir/opt/nwn/nwmovies/binklib.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwmovies/nwmovies/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmovies/libdis/libdisasm.so

    # SymLink BinkPlayer to the NWN Directory so the Movie Launcher (nwmovies.pl) can find it
    ln -s /usr/bin/binkplayer $pkgdir/opt/nwn/BinkPlayer

    # Install nwuser binaries
    install -D -m 755 $srcdir/nwuser/nwuser/nwuser.so \
        $pkgdir/opt/nwn/nwuser.so

    # Install 64bit binaries if Arch64
    if [ "$CARCH" = "x86_64" ]; then
        install -D -m 755 $srcdir/nwuser/nwuser/nwuser64.so \
            $pkgdir/opt/nwn/nwuser64.so
    fi

    # Install nwmouse binaries
    install -D -m 755 $srcdir/nwmouse/nwmouse/nwmouse.so \
        $pkgdir/opt/nwn/nwmouse.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwmouse/nwmouse/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmouse/libdis/libdisasm.so

    # Install nwlogger binaries
    install -D -m 755 $srcdir/nwlogger/nwlogger/nwlogger.so \
        $pkgdir/opt/nwn/nwlogger.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwlogger/nwlogger/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwlogger/libdis/libdisasm.so

    ###########################################################################

    # Copy the original licence file
    cp $srcdir/nwncdkey.ini $pkgdir/opt/nwn/nwncdkey.ini

    # Install Cursors
    install -d $pkgdir/opt/nwn/nwmouse/cursors/
    tar -zxvf $srcdir/nwmouse/nwmouse/cursors.tar.gz -C $pkgdir/opt/nwn/nwmouse/cursors/

    # Install Custom License
    install -D -m 644 $srcdir/tmp/EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/EULA.txt

    # Install Launcher (Client)
    install -D -m 755 $srcdir/nwn.launcher \
        $pkgdir/usr/bin/nwn

    # Install Desktop File
    install -D -m 644 $srcdir/nwn.desktop \
        $pkgdir/usr/share/applications/nwn.desktop

    # Install Icon Files
    install -D -m 644 $srcdir/icons/gfw_high_6_256x256x32.png \
        $pkgdir/usr/share/icons/hicolor/256x256/apps/nwn.png
    install -D -m 644 $srcdir/icons/gfw_high_7_48x48x32.png \
        $pkgdir/usr/share/icons/hicolor/48x48/apps/nwn.png
    install -D -m 644 $srcdir/icons/gfw_high_8_32x32x32.png \
        $pkgdir/usr/share/icons/hicolor/32x32/apps/nwn.png
    install -D -m 644 $srcdir/icons/gfw_high_9_16x16x32.png \
        $pkgdir/usr/share/icons/hicolor/16x16/apps/nwn.png

    # Fix Whacky Permissions
    chown -R root:root $pkgdir/
    chmod -R o+r $pkgdir/
}

