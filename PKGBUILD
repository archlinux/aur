# Maintainer: Thomas Crider <gloriouseggroll@protonmail.com>

# This package is the pre-compiled alpha release version of Unreal Tournament on Unreal Engine 4 posted regularly on the Unreal Tournament forums.
# The newest release is always at the top of the announcements section, which can be found here:
# https://www.epicgames.com/unrealtournament/forums/forumdisplay.php?55-Announcements
# It is advised to download a snapshot of this package and use makepkg -i and pacman -U, as the package is larger than the default /tmp size
# Please also note that extracting the zip and compressing the package can take quite a long time, as the zip file is over 10GB.
# The source code can be found here on their github:
# https://github.com/EpicGames/UnrealTournament/tree/release
# Please note in order to view the Epic Games github you must register at unrealengine.com and link your github account to access this private repo.
# @see https://wiki.archlinux.org/index.php/Unreal_Engine_4

pkgname='unrealtournament4'
pkgver=3395761
pkgrel=1
pkgdesc='A first-person shooter by Epic Games based on Unreal Engine 4.'
arch=('x86_64')
url='https://www.epicgames.com/unrealtournament/'
depends=('icu' 'xdg-user-dirs' 'sdl2' 'qt4' 'python')
license=('custom:UnrealTournament')
source=(
  "https://s3.amazonaws.com/unrealtournament/UnrealTournament-Client-XAN-${pkgver}-Linux.zip"
  'UnrealTournament4.desktop'
  'LICENSE.pdf'
  'ut4'
)
noextract=("UnrealTournament-Client-XAN-${pkgver}-Linux.zip")
sha512sums=(
  'b38c0d7682ed96725799057a7096f6fe846ebaf1c55a2f1fdab44e194ac989e0b96e8a0a01060f99c62917f8cfda287c811fccebdb680eabc9edd14ad5c86e30'
  '27666828f8eeee115166fe867143c1dcc8e1ca8d243d2471c2f832daa24372135a705fb97d645148f7fd92e013febe6e16d30202ce57eaf2e21b0549f14966f3'
  '0182493a86ee18274c77a4d89776425e1a1e0d0b40c2a797f0fee75bdaad8d9c4511ccab7ad2dd39fbd2fb1aa811d7706677b08a09c553b1348822c1265aa846'
  '5283964cc6985956d88e4044203067f1f4ac886b6dfb2c7b35a5f3721f9a4f2dd5a5a5abf941fac3bb2f01244434d6a2be18e856bab4150ecebcd58c2d732bfc'
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
