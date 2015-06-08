# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=shadow-warrior-hib
pkgver=1428602700
pkgrel=1
pkgdesc="Shadow Warrior is a bold reimagining of the 3D Realms cult classic shooter."
arch=('i686' 'x86_64')
url="http://www.redbarrelsgames.com/"
license=('custom: commercial')
depends_i686=('sdl2')
depends_x86_64=('lib32-sdl2')
source=("hib://ShadowWarriorSetup_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=("fe6e5fb338af959879273e132774c35913735f5be0332dbfc17aad62aae955f4"
            "87b88d9dc3e287e34f1101ad9640c366906588640d7b601cc6507181c0cbda23")
# Prevent compressing final package
PKGEXT='.pkg.tar'

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
    # Unzip will produce an error code because it is unable to unzip the Mojo Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}" "ShadowWarriorSetup_${pkgver}.sh" || :
    mkdir -p "${pkgdir}/opt/${pkgname}/"

    # Launcher and Data
    cp -R "${srcdir}/data/x86/lib" "${pkgdir}/opt/${pkgname}"
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/ShadowWarrior.bin.x86" \
          "${pkgdir}/usr/bin/shadow-warrior"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/Icon.png" \
          "${pkgdir}/usr/share/pixmaps/shadow-warrior.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/ShadowWarrior.bin.x86"
}
