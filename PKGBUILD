# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=nwn-diamond
pkgver=1.69
pkgrel=6
pkgdesc="Neverwinter Nights is an RPG from Bioware. This requires the Diamond Collection DVD Release."
url="http://nwn.bioware.com/"
license=('custom')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
    depends=('binkplayer' 'lib32-elfutils' 'lib32-libgl' 'lib32-libstdc++5' 'lib32-libxcursor' 'lib32-libxdamage' 'lib32-mesa' 'perl' 'lib32-sdl_mixer')
else
    depends=('binkplayer' 'elfutils' 'libgl' 'libstdc++5' 'libxcursor' 'mesa' 'perl' 'sdl_mixer')
fi
makedepends=('unzip' 'p7zip' 'perl')
provides=('nwn')
conflicts=('nwn')
install=nwn.install
source=("http://nwdownloads.bioware.com/neverwinternights/linux/gold/nwclientgold.tar.gz" \
"http://nwdownloads.bioware.com/neverwinternights/linux/161/nwclienthotu.tar.gz" \
"http://files.bioware.com/neverwinternights/updates/linux/169/English_linuxclient169_xp2.tar.gz" \
"http://home.roadrunner.com/~nwmovies/nwlinux-beta.tar.bz2" \
"http://home.roadrunner.com/~nwmovies/cursors.tar.gz" \
"nwn.launcher" "nwn.desktop")
noextract=('nwclientgold.tar.gz' 'nwclienthotu.tar.gz' 'English_linuxclient169_xp2.tar.gz')
md5sums=('0a059d55225fc32f905e86191d88a11f'
         '376cdece07106ea058d42b531f3146bb'
         'b021f0da3b3e00848521926716fdf487'
         '3961f7464d3d5b7ac9f097aa9aa2f4d3'
         '7be935418f0ececb5660f53b7a902b38'
         '7fd0497f55856edf50480b5acd3136d3'
         'bd7f80f5faa5ee1203371b4e8ec40638')
PKGEXT='.pkg.tar'

# Directory where the NWN Diamond DVD is Mounted
_dvdpath=/media/dvd

# NWN Diamond CD-Keys (Neverwinter Nights, Shadows of Undrentide, and Hordes of the Underdark)
_key_nwn=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
_key_sou=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
_key_hou=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx

build()
{
    cd $srcdir/

    # Create Destination Directory
    install -d $pkgdir/opt/nwn

    # Extract Data Files from DVD ROM
    unzip $_dvdpath/Data_Shared.zip -d $pkgdir/opt/nwn/ || return 1
    unzip $_dvdpath/Data_linux.zip  -d $pkgdir/opt/nwn/ || return 1
    unzip -o $_dvdpath/data/XP1.zip -d $pkgdir/opt/nwn/ || return 1
    unzip -o $_dvdpath/data/XP2.zip -d $pkgdir/opt/nwn/ || return 1

    # Extract Game Clients
    tar -zxvf $srcdir/nwclientgold.tar.gz -C $pkgdir/opt/nwn/
    tar -zxvf $srcdir/nwclienthotu.tar.gz -C $pkgdir/opt/nwn/

    # Extract Kingmaker Files
    7z x $_dvdpath/KingmakerSetup.exe -xr0\!*PLUGINSDIR* -xr\!*.exe -xr\!*.dat \
        -o$srcdir/kingmakertmp/

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

    # Install CD Key File
    cat << EOF > $pkgdir/opt/nwn/nwncdkey.ini
;These are your CD Keys for Neverwinter Nights.
;DO NOT share these CD Keys with ANYONE.
;Apart from this installation, or when registering with the Official Neverwinter Nights Community Site [http://nwn.bioware.com], BioWare and Infogrames will NEVER ask you for this CD Key.

[CDKEY]
Key3=$_key_hou
Key2=$_key_sou
Key1=$_key_nwn
EOF

    cd $srcdir/

    ###########################################################################
    #
    # nwmovies:
    #
    #     Movies in Linux Client Support for NWN
    #
    ###########################################################################

    # Compile nwmovies using the appropriate SDL library
    if [ "$CARCH" = "x86_64" ]; then
        ./nwmovies_install.pl /usr/lib32/libSDL-1.2.so.0
    else
        ./nwmovies_install.pl /usr/lib/libSDL-1.2.so.0
    fi

    # Install nwmovies binaries
    install -D -m 755 -t $pkgdir/opt/nwn/ \
        $srcdir/nwmovies/{nwmovies.so,nwmovies.pl}

    # Install binkplayer binaries
    install -D -m 755 $srcdir/nwmovies/binklib.so \
        $pkgdir/opt/nwn/nwmovies/binklib.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwmovies/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmovies/libdis/libdisasm.so

    # SymLink BinkPlayer to the NWN Directory so the Movie Launcher (nwmovies.pl) can find it
    ln -s /usr/bin/binkplayer $pkgdir/opt/nwn/BinkPlayer

    ###########################################################################
    #
    # nwuser:
    #
    #     Per-User Settings Support for NWN
    #
    ###########################################################################

    # Compile nwuser
    ./nwuser_install.pl

    # Install nwuser binaries
    install -D -m 755 $srcdir/nwuser/nwuser.so \
        $pkgdir/opt/nwn/nwuser.so

    # Install 64bit binaries if Arch64
    if [ "$CARCH" = "x86_64" ]; then
        install -D -m 755 $srcdir/nwuser/nwuser64.so \
            $pkgdir/opt/nwn/nwuser64.so
    fi

    ###########################################################################
    #
    # nwmouse:
    #
    #     Hardware Mouse Cursors Support for NWN
    #
    ###########################################################################

    # Patch file so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' $srcdir/nwmouse/nwmouse_cookie.c

    # Compile nwmouse
    ./nwmouse_install.pl

    # Install nwmouse binaries
    install -D -m 755 $srcdir/nwmouse/nwmouse.so \
        $pkgdir/opt/nwn/nwmouse.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwmouse/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmouse/libdis/libdisasm.so

    ###########################################################################
    #
    # nwlogger:
    #
    #     Client-Side Chat Window Logging Support for NWN
    #
    ###########################################################################

    # Patch file so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' $srcdir/nwlogger/nwlogger_cookie.c

    # Compile nwlogger
    ./nwlogger_install.pl

    # Install nwlogger binaries
    install -D -m 755 $srcdir/nwlogger/nwlogger.so \
        $pkgdir/opt/nwn/nwlogger.so

    # Install libdis binaries
    install -D -m 755 $srcdir/nwlogger/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwlogger/libdis/libdisasm.so

    ###########################################################################

    # Install Cursors
    install -d $pkgdir/opt/nwn/nwmouse/cursors/
    tar -zxvf $srcdir/cursors.tar.gz -C $pkgdir/opt/nwn/nwmouse/cursors/

    # Install Custom License
    install -D -m 644 $_dvdpath/EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/EULA.txt

    # Install Launcher (Client)
    install -D -m 755 $srcdir/nwn.launcher \
        $pkgdir/usr/bin/nwn

    # Install Desktop File
    install -D -m 644 $srcdir/nwn.desktop \
        $pkgdir/usr/share/applications/nwn.desktop

    # Install Icon File
    install -D -m 644 $_dvdpath/nwn.ico \
        $pkgdir/usr/share/pixmaps/nwn.ico

    # Fix Whacky Permissions
    chown -R root:root $pkgdir/
    chmod -R o+r $pkgdir/
}

