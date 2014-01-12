# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=wolf
pkgver=1.41b
pkgrel=5
pkgdesc="Return to Castle Wolfenstein is a single and multiplayer first person shooter. You need the retail game files to play."
arch=('i686' 'x86_64')
url="http://zerowing.idsoftware.com/linux/wolf/"
license=('custom')
[ "${CARCH}" = "i686" ] && depends=('libgl' 'libxext')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-libgl' 'lib32-libxext')
optdepends=('xdg-utils: for opening urls'
            'et-sdl-sound: for sdl/alsa support')
install='wolf.install'
source=('wolfsp.desktop' 'wolfmp.desktop' \
'wolf.launcher' 'wolfsp.launcher' 'wolfmp.launcher' 'wolfded.launcher' \
'http://www.slashbunny.com/aur/wolf/libstdc++-libc6.2-2.so.3' \
"ftp://ftp.internat.freebsd.org/pub/FreeBSD/distfiles/wolf-linux-${pkgver}.x86.run")
sha256sums=('20adb799ec0e1adef579acc02ecbd63486dc9bfe90ef48a72e1ea9049d017558'
            'f8dc16a01bf3c5fc7d3914315ffec570f5ae4f148fccffdd05326a589dabf060'
            '7fca88d5c2ca1ad9d5f782f7a7c092246f91112db8918a032234f827de123a7e'
            'ed85d6984e73a33e153269d964e7077eea7333aa6894737248119374bda02c65'
            '7fca88d5c2ca1ad9d5f782f7a7c092246f91112db8918a032234f827de123a7e'
            'b9fc003949be3b5b5265aa94611df087f0aa11c4036050cdb14ee33f5548b776'
            'cadd9a1d2bf0f991f0a0f8977c76701cbcc9a3e8ffeaba2838c98969fee340e6'
            '2921425c1b429147c1bc6f0c6a8664bec502ae86a2d6bccfaa1162f75dce89f3')

package() {
    # Create Destination Directories
    install -d "${pkgdir}/opt/wolf/" "${pkgdir}/usr/bin/" "${srcdir}/wolf/"

    # Set Install Files to Executable
    chmod +x "${srcdir}/wolf-linux-${pkgver}.x86.run"

    # Extract Linux Game Files
    cd "${srcdir}/wolf/"
    "${srcdir}/wolf-linux-${pkgver}.x86.run" --noexec --tar xf --group=root --owner=root

    # Move Binaries to Main Directory
    cp "${srcdir}/wolf/bin/Linux/x86/"{wolf.x86,wolfded.x86,wolfsp.x86} \
        "${srcdir}/wolf/"

    # Remove Unneeded Files and Directories
    rm -r "${srcdir}/wolf/"{bin,setup.data,setup.sh,CHANGES~}

    # Fix Permissions (Owner, Directory, and File Permissions)
    /bin/chown -R root:root "${srcdir}/wolf/"
    /bin/chmod 0755 "${srcdir}/wolf/Docs/PunkBuster"
    /bin/chmod 0644 "${srcdir}/wolf/"{Docs/{PunkBuster/{admins/index.htm,players/index.htm},Update_readme.htm},RTCW-README-1.4.txt}

    # Move Data to Package Directory
    mv "${srcdir}/wolf/" "${pkgdir}/opt/"

    # Install Launcher Script (Single Player Client)
    install -D -m 755 "${srcdir}/wolfsp.launcher" \
        "${pkgdir}/usr/bin/wolfsp"

    # Install Launcher Script (Multiplayer Client)
    install -D -m 755 "${srcdir}/wolf.launcher" \
        "${pkgdir}/usr/bin/wolf"

    # Install Launcher Script (Multiplayer Client)
    install -D -m 755 "${srcdir}/wolfmp.launcher" \
        "${pkgdir}/usr/bin/wolfmp"

    # Install Launcher Script (Multipler Server)
    install -D -m 755 "${srcdir}/wolfded.launcher" \
        "${pkgdir}/usr/bin/wolfded"

    # Install old libstdc++ library needed for Wolf to run
    install -D -m 644 "${srcdir}/libstdc++-libc6.2-2.so.3"  \
        "${pkgdir}/opt/wolf/libstdc++-libc6.2-2.so.3"

    # Install License (Return to Castle Wolfenstein)
    install -D -m 644 "${pkgdir}/opt/wolf/Docs/License.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"

    # Install License (PunkBuster)
    install -D -m 644 "${pkgdir}/opt/wolf/pb/PB_EULA.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/PB_EULA.txt"

    # Install Desktop File (Single Player)
    install -D -m 644 "${srcdir}/wolfsp.desktop" \
        "${pkgdir}/usr/share/applications/wolfsp.desktop"

    # Install Desktop File (Multi Player)
    install -D -m 644 "${srcdir}/wolfmp.desktop" \
        "${pkgdir}/usr/share/applications/wolfmp.desktop"

    # Install Icon File (Single Player)
    install -D -m 644 "${pkgdir}/opt/wolf/WolfSP.xpm" \
        "${pkgdir}/usr/share/pixmaps/WolfSP.xpm"

    # Install Icon File (Multi Player)
    install -D -m 644 "${pkgdir}/opt/wolf/WolfMP.xpm" \
        "${pkgdir}/usr/share/pixmaps/WolfMP.xpm"

    # Remove Licenses from Data Directory
    rm "${pkgdir}/opt/wolf/Docs/License.txt"
    rm "${pkgdir}/opt/wolf/pb/PB_EULA.txt"

    # Use a more modern way for opening urls
    rm "${pkgdir}/opt/wolf/openurl.sh"
    ln -sf /usr/bin/xdg-open "${pkgdir}/opt/wolf/openurl.sh"
}

