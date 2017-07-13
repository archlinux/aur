# Maintainer: Thomas Crider <gloriouseggroll@protonmail.com>

# This package is the pre-compiled alpha release version of Unreal Tournament on Unreal Engine 4 posted regularly on the Unreal Tournament forums.
# The newest release is always at the top of the announcements section, which can be found here:
# https://www.epicgames.com/unrealtournament/forums/forumdisplay.php?55-Announcements
# It is advised to download a snapshot of this package and use makepkg and pacman -U PACKAGENAME.pkg.tar.xz, as the package is larger than the default /tmp size
# Please also note that extracting the zip and compressing the package can take quite a long time, as the zip file is over 10GB.
# The source code can be found here on their github:
# https://github.com/EpicGames/UnrealTournament/tree/release
# Please note in order to view the Epic Games github you must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='unrealtournament4'
pkgver=3525360
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4.'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealTournament')
source=(
  "https://s3.amazonaws.com/unrealtournament/ShippedBuilds/%2B%2BUT%2BRelease-Next-CL-${pkgver}/UnrealTournament-Client-XAN-${pkgver}-Linux.zip"
  'UnrealTournament4.desktop'
  'LICENSE.pdf'
  'ut4'
)
noextract=("UnrealTournament-Client-XAN-${pkgver}-Linux.zip")
sha512sums=(
  'ad721074726bb108719b9a2ff1060f2f1b6fbe5eb27b5d95488505848aeb497c33db32e0e2dfbf9ab22ef3d1e06a7e3f9e156873025e6e21942154f3fcaed542'
  '135f8635aec1a1c1edb6183c362233aef337e5a8a73911835344abcacf57b0e8d86966334999e2882e5c6c4bef2842d5fa70a010384e5d1473375cc9d6bd4d4b'
  '0182493a86ee18274c77a4d89776425e1a1e0d0b40c2a797f0fee75bdaad8d9c4511ccab7ad2dd39fbd2fb1aa811d7706677b08a09c553b1348822c1265aa846'
  '44088e2eb5231d509fe943bd72afad80df7ae63200df190097e78a02c6e0412f61fdea465ebf1a6a29025a1b7e65fbb6bab06ca83f43543d273246bfe736858d'
)
options=(!strip staticlibs)

package() {
    # First create directories for bsdtar, the game icon, and the Saved folder
    install -d "$pkgdir"{/opt/$pkgname/LinuxNoEditor/UnrealTournament/Saved/,/usr/share/pixmaps/}

    # Next extract the game files from the zip directly into pkgdir
    bsdtar -xf "UnrealTournament-Client-XAN-${pkgver}-Linux.zip" -C "${pkgdir}/opt/${pkgname}/"

    # Next install the game shortcuts and license
    cd ${pkgdir}
    install -Dm644 "${srcdir}/UnrealTournament4.desktop" -t "usr/share/applications/"
    install -Dm644 "${srcdir}/ut4" -t "usr/bin/"
    install -Dm644 "${srcdir}/LICENSE.pdf" -t "usr/share/licenses/$pkgname/"
    install -Dm644 "opt/${pkgname}/LinuxNoEditor/Engine/Content/Slate/Icons/DefaultAppIcon.png" "usr/share/pixmaps/UnrealTournament.png"


    # Set permissions
    chgrp -R games "opt/${pkgname}"
    chmod -R a+rw "opt/${pkgname}/LinuxNoEditor/UnrealTournament/Saved"
    chmod +x "opt/${pkgname}/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Shipping"
    chmod +x "opt/${pkgname}/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Test"
    chmod +x "usr/bin/ut4"
}

# vim:set ts=2 sw=2 et:
