# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=unreal-tournament-goty-steam
_pkgname=unreal-tournament-goty
pkgver=469d
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
makedepends=('steamcmd' 'icoutils')
depends=('lib32-libgl'
         'lib32-libpulse'
         'lib32-sdl')
source=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2" "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2" "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-arm64.tar.bz2" "${_pkgname}.desktop" "${_pkgname}.png")
pkgdesc="Unreal Tournament GOTY Linux with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/13240/Unreal_Tournament_Game_of_the_Year_Edition/'
sha256sums=('d49b052ae0008ff2ed62f3943c5bb41e7fb3bd8deb896d189496cb77852768a5'
            '6a81b35ae6a4c0dfce2f8fb152af16129776735aeb34dfc391f7c8daf0d51a3b'
            'd9ef651c1d768cb4d1f146287cb58bee0834a9bd88a8593a78d0f74f956a031d'
            '842987c1380e304c87d1b3909f1aa10a732c1206d8083beda448844fe0d6d1ed'
            '69c9c5eb9ff8f6ee5cbfd9df5d16f68461d682fbb15c75a34627eaff2474190e')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update 13240 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}
    mkdir -p $pkgdir/usr/bin

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/installscript.vdf
    tar --extract --file "OldUnreal-UTPatch${pkgver}-Linux-arm64.tar.bz2" --directory "$pkgdir/opt/${_pkgname}"
    tar --extract --file "OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2" --directory "$pkgdir/opt/${_pkgname}"
    tar --extract --file "OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2" --directory "$pkgdir/opt/${_pkgname}"
    chmod 666 $pkgdir/opt/${_pkgname}/System/{UnrealTournament,User}.ini 

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/${_pkgname}.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install game binary link.
    ln -s /opt/${_pkgname}/System64/ut-bin \
             $pkgdir/usr/bin/${_pkgname}
}
