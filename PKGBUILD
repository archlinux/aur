# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=nwn-diamond
pkgver=1.69
pkgrel=9
pkgdesc='Neverwinter Nights RPG from Bioware. Requires the Diamond Collection DVD. Update PKGBUILD with path to your DVD.'
url='http://nwn.bioware.com/'
license=('custom:EULA')
arch=('i686' 'x86_64')
if [ "$CARCH" = 'x86_64' ]; then
    depends=('binkplayer-bin' 'elfutils' 'lib32-elfutils' 'lib32-libgl' 'lib32-libstdc++5' 'lib32-libxcursor' 'lib32-libxdamage' 'lib32-mesa' 'perl' 'lib32-sdl_mixer')
else
    depends=('binkplayer-bin' 'elfutils' 'libgl' 'libstdc++5' 'libxcursor' 'mesa' 'perl' 'sdl_mixer')
fi
makedepends=('git' 'unzip' 'p7zip' 'perl')
provides=('nwn')
conflicts=('nwn')
install='nwn.install'
backup=('opt/nwn/nwncdkey.ini')
source=(
    'https://lutris.net/files/games/neverwinter-nights/nwclientgold.tar.gz'
    'https://lutris.net/files/games/neverwinter-nights/nwclienthotu.tar.gz'
    'https://lutris.net/files/games/neverwinter-nights/English_linuxclient169_xp2.tar.gz'
    'git+https://github.com/nwnlinux/nwlogger.git#commit=3bfa7aa5'
    'git+https://github.com/nwnlinux/nwmouse.git#commit=6df8b96f'
    'git+https://github.com/nwnlinux/nwmovies.git#commit=61fb3645'
    'git+https://github.com/nwnlinux/nwuser.git#commit=3fbbf546'
    'nwn.launcher'
    'nwn.desktop'
    'nwn.key'
)
noextract=(
    'English_linuxclient169_xp2.tar.gz'
    'nwclientgold.tar.gz'
    'nwclienthotu.tar.gz'
)
sha256sums=('6aea73cee2f6c9733ef4a121888cb3451d8a31b968a02e1ec897242df53395f3'
            '0a4ace1aacd69fb166d09bd249ce5ae98dd28f580765f52e0147bb85f7dfcfd7'
            '09715e2b95c025ef7f00d218deec1b1edce501530d8cba51d61097c69699763f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bcaa399db7fdaba64535cc79ee9b8e0c02851fe6c06a72c47abe98530eff63e7'
            '50f6272eebd8de19c018a24a5b3ce4ca15bd1fff0aef818ec1036f249faa612c'
            'SKIP')
PKGEXT='.pkg.tar'

# Directory where the NWN Diamond DVD is mounted
# Tip: Create an ISO from your DVD to speed up the process
_dvdpath=/media/dvd

prepare()
{
    # Extract Data Files from DVD
    unzip -o "${_dvdpath}/Data_Shared.zip" -d "${srcdir}/gametmp/"
    unzip -o "${_dvdpath}/Data_linux.zip"  -d "${srcdir}/gametmp/"
    unzip -o "${_dvdpath}/data/XP1.zip"    -d "${srcdir}/gametmp/"
    unzip -o "${_dvdpath}/data/XP2.zip"    -d "${srcdir}/gametmp/"

    # Extract Game Clients
    tar -zxvf "${srcdir}/nwclientgold.tar.gz" -C "${srcdir}/gametmp/"
    tar -zxvf "${srcdir}/nwclienthotu.tar.gz" -C "${srcdir}/gametmp/"

    # Extract Latest Patch
    tar -zxvf "${srcdir}/English_linuxclient169_xp2.tar.gz" -C \
        "${srcdir}/gametmp/"

    # Extract Kingmaker Files
    7z x "${_dvdpath}/KingmakerSetup.exe" -xr0\!*PLUGINSDIR* -xr\!*.exe -xr\!*.dat \
        -o"${srcdir}/kingmakertmp/" -aoa

    # Copy License, Icon off DVD
    cp -f "${_dvdpath}/"{EULA.txt,nwn.ico} "${srcdir}"

    # Patch nwmouse so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' \
        "${srcdir}/nwmouse/nwmouse/nwmouse_cookie.c"

    # Patch nwlogger so it can find user.h
    /bin/sed -i 's|linux/user.h|sys/user.h|1' \
        "${srcdir}/nwlogger/nwlogger/nwlogger_cookie.c"
}

build()
{
    cd "${srcdir}/nwmovies"
    # Compile nwmovies using the appropriate SDL library
    if [ "$CARCH" = "x86_64" ]; then
        ./nwmovies_install.pl /usr/lib32/libSDL-1.2.so.0
    else
        ./nwmovies_install.pl /usr/lib/libSDL-1.2.so.0
    fi

    # Compile nwuser
    cd "${srcdir}/nwuser"
    ./nwuser_install.pl

    # Compile nwmouse
    cd "${srcdir}/nwmouse"
    ./nwmouse_install.pl

    # Compile nwlogger
    cd "${srcdir}/nwlogger"
    ./nwlogger_install.pl
}

package()
{
    # Create Destination Directory
    install -d "${pkgdir}/opt/"

    # Install Base Game Files
    mv "${srcdir}/gametmp/" \
        "${pkgdir}/opt/nwn"

    # Install Kingmaker Files
    cp -r "${srcdir}/kingmakertmp/\$0/"* \
        "${pkgdir}/opt/nwn/"

    # Check the Installation
    cd "${pkgdir}/opt/nwn/"
    ./fixinstall

    # Install Addons (nwmovies, nwuser, nwmouse, and nwlogger)
    _install_addons

    # Install CD Key File
    install -D -m 0644 "${srcdir}/nwn.key" \
        "${pkgdir}/opt/nwn/nwncdkey.ini"

    # Install Custom License
    install -D -m 0644 "${srcdir}/EULA.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"

    # Install Launcher (Client)
    install -D -m 0755 "${srcdir}/nwn.launcher" \
        "${pkgdir}/usr/bin/nwn"

    # Install Desktop File
    install -D -m 0644 "${srcdir}/nwn.desktop" \
        "${pkgdir}/usr/share/applications/nwn.desktop"

    # Install Icon File
    install -D -m 0644 "${srcdir}/nwn.ico" \
        "${pkgdir}/usr/share/pixmaps/nwn.ico"

    # Remove Unneeded Files & Directories
    rm -r "${pkgdir}/opt/nwn/SDL-1.2.5/"

    # Fix Whacky Permissions
    chown -R root:root "${pkgdir}"
    chmod -R o+r "${pkgdir}"
}

_install_addons()
{
    cd "${srcdir}"

    # Install nwmovies binaries
    install -D -m 0755 -t "${pkgdir}/opt/nwn/" \
        "${srcdir}/nwmovies/"{nwmovies.so,nwmovies.pl}

    # Install binkplayer binaries
    install -D -m 0755 "${srcdir}/nwmovies/nwmovies/binklib.so" \
        "${pkgdir}/opt/nwn/nwmovies/binklib.so"

    # Install libdis binaries
    install -D -m 0755 "${srcdir}/nwmovies/nwmovies/libdis/libdisasm.so" \
        "${pkgdir}/opt/nwn/nwmovies/libdis/libdisasm.so"

    # SymLink BinkPlayer to the NWN Directory so the Movie Launcher (nwmovies.pl) can find it
    ln -s /usr/bin/binkplayer "${pkgdir}/opt/nwn/BinkPlayer"

    # Install nwuser binaries
    install -D -m 0755 "${srcdir}/nwuser/nwuser/nwuser.so" \
        "${pkgdir}/opt/nwn/nwuser.so"

    # Install 64bit binaries if Arch64
    if [ "$CARCH" = "x86_64" ]; then
        install -D -m 0755 "${srcdir}/nwuser/nwuser/nwuser64.so" \
            "${pkgdir}/opt/nwn/nwuser64.so"
    fi

    # Install nwmouse binaries
    install -D -m 0755 "${srcdir}/nwmouse/nwmouse/nwmouse.so" \
        "${pkgdir}/opt/nwn/nwmouse.so"

    # Install libdis binaries
    install -D -m 0755 "${srcdir}/nwmouse/nwmouse/libdis/libdisasm.so" \
        "${pkgdir}/opt/nwn/nwmouse/libdis/libdisasm.so"

    # Install nwlogger binaries
    install -D -m 0755 "${srcdir}/nwlogger/nwlogger/nwlogger.so" \
        "${pkgdir}/opt/nwn/nwlogger.so"

    # Install libdis binaries
    install -D -m 0755 "${srcdir}/nwlogger/nwlogger/libdis/libdisasm.so" \
        "${pkgdir}/opt/nwn/nwlogger/libdis/libdisasm.so"

    # Install Cursors
    install -d "${pkgdir}/opt/nwn/nwmouse/cursors/"
    tar -zxvf "${srcdir}/nwmouse/nwmouse/cursors.tar.gz" -C \
        "${pkgdir}/opt/nwn/nwmouse/cursors/"
}

