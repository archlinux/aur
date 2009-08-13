# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=nwn-diamond
pkgver=1.69
pkgrel=2
pkgdesc="Neverwinter Nights is an RPG from Bioware. This requires the Diamond Collection DVD Release."
url="http://nwn.bioware.com/"
license=('custom')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
    depends=('binkplayer' 'lib32-libelf' 'lib32-libgl' 'lib32-libstdc++5' 'lib32-libxcursor' 'lib32-mesa' 'perl' 'lib32-sdl_mixer')
else
    depends=('binkplayer' 'libelf' 'libgl' 'libstdc++5' 'libxcursor' 'mesa' 'perl' 'sdl_mixer')
fi
makedepends=('unzip' 'p7zip' 'perl')
provides=('nwn')
conflicts=('nwn')
install=nwn.install
source=("http://nwdownloads.bioware.com/neverwinternights/linux/gold/nwclientgold.tar.gz" \
"http://nwdownloads.bioware.com/neverwinternights/linux/161/nwclienthotu.tar.gz" \
"http://files.bioware.com/neverwinternights/updates/linux/169/English_linuxclient169_xp2.tar.gz" \
"http://home.roadrunner.com/~nwmovies/nwuser/nwuser-latest.tar.gz" \
"http://home.roadrunner.com/~nwmovies/nwmovies/nwmovies-latest.tar.gz" \
"http://home.roadrunner.com/~nwmovies/nwmouse/nwmouse-latest.tar.gz" \
"http://home.roadrunner.com/~nwmovies/nwlogger/nwlogger-latest.tar.gz" \
"http://home.roadrunner.com/~nwmovies/cursors.tar.gz" \
"nwn.launcher" "nwn.desktop" "nwn.install" "nwmouse.nwlogger.patch")
md5sums=('0a059d55225fc32f905e86191d88a11f'
         '376cdece07106ea058d42b531f3146bb'
         'b021f0da3b3e00848521926716fdf487'
         '0ff1296e4afb43844b6eb2544e40cab9'
         '2225a729051290fd2e1789b40d270f03'
         '099627511d9d4d2a062c4f81ad508f3f'
         '981d5cd5ec13aa888e4c0a2ba7f9a231'
         '7be935418f0ececb5660f53b7a902b38'
         'd28e09031cc8f56406f6878e36683e36'
         'bd7f80f5faa5ee1203371b4e8ec40638'
         'e7b2a5b92d5ef05b89946b69d325d152'
         '95d96bf43557405586c7dab01ffc8d8c')

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

    # Patch nwmouse and nwlogger so they build properly
    patch -p1 < $srcdir/nwmouse.nwlogger.patch

    # Movies in Linux Client Support for NWN
    ./nwmovies_install.pl /usr/lib/libSDL.so
    install -D -m 755 -t $pkgdir/opt/nwn/ \
        $srcdir/nwmovies/{nwmovies.so,nwmovies.pl}
    install -D -m 755 $srcdir/nwmovies/binklib.so \
        $pkgdir/opt/nwn/nwmovies/binklib.so
    install -D -m 755 $srcdir/nwmovies/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmovies/libdis/libdisasm.so

    # SymLink BinkPlayer to the NWN Directory so the Movie Launcher (nwmovies.pl) can find it
    ln -s /usr/bin/binkplayer $pkgdir/opt/nwn/BinkPlayer

    # Per-User Settings Support for NWN
    ./nwuser_install.pl
    install -D -m 755 $srcdir/nwuser/nwuser.so \
        $pkgdir/opt/nwn/nwuser.so

    # Hardware Mouse Cursors Support for NWN
    ./nwmouse_install.pl
    install -D -m 755 $srcdir/nwmouse/nwmouse.so \
        $pkgdir/opt/nwn/nwmouse.so
    install -D -m 755 $srcdir/nwmouse/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwmouse/libdis/libdisasm.so

    # Client-Side Chat Window Logging Support for NWN
    ./nwlogger_install.pl
    install -D -m 755 $srcdir/nwlogger/nwlogger.so \
        $pkgdir/opt/nwn/nwlogger.so
    install -D -m 755 $srcdir/nwlogger/libdis/libdisasm.so \
        $pkgdir/opt/nwn/nwlogger/libdis/libdisasm.so

    # Install Cursors
    install -d $pkgdir/opt/nwn/nwmouse/cursors/
    tar -zxvf $srcdir/cursors.tar.gz -C $pkgdir/opt/nwn/nwmouse/cursors/

    # Install Custom License
    install -D -m 644 $_dvdpath/EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/EULA.txt

    # Install Launcher (Client)
    install -D -m 755 $startdir/nwn.launcher \
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

