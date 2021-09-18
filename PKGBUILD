# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dirtshowdown-wine-steam
_pkgname=dirtshowdown
pkgver=1.2
pkgrel=2
_steamid=201700
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "https://github.com/jm2/archlinux-package-dirtshowdown-wine-steam/raw/master/${_pkgname#dirt}.exe"
        "https://github.com/jm2/archlinux-package-dirtshowdown-wine-steam/raw/master/${_pkgname#dirt}_avx.exe"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="DiRT Showdown using WINE with data via Steam"
license=('custom')
install=dirtshowdown.install
url='https://steamdb.info/app/201700/'
sha256sums=('a97428269726324ecb4107e6bc8cb44a651edc6d23d935ad78a9523660e38729'
            '836e67420ef664f6d917e3c68a4e8c4b07195893d2375486282b4d92a2e9b59b'
            '80b9b3bc95f2e1a3c1f8a183c32bb911f1dbbb662f4e09071c0f6d70b536a9e2'
            'a62e1cb44020951d38ee4ab3c49a25fe76c77d9defd42661b81292d9ce495b7f'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/showdown.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/*.vdf
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api.dll $pkgdir/opt/${_pkgname}/
    cp $srcdir/${_pkgname#dirt}{,_avx}.exe $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/showdown.exe_14_101_2057_4_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
