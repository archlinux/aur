# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Daniel Dias <dias AT archlinux DOT info>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Slash <yahoo.com: demodevil5>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# To speed up package creation. If you are planning to distribute
# This on some custon repo, you might want to use the defaut slow but
# much better xz compression.
PKGEXT=.pkg.tar

pkgname=hon
pkgver=3.9.5
pkgrel=2
pkgdesc="Heroes of Newerth is a Real Time Strategy game heavily influcenced by DotA"
arch=('i686' 'x86_64')
url="http://www.heroesofnewerth.com/"
license=('custom:HoN')
depends=('alsa-lib' 'gconf' 'gtk2'  'nss' 'libxss' 'libjpeg-turbo' 'cgmanager' 'ncurses5-compat-libs' 'libgcrypt15')
makedepends=('unzip')
options=(!strip)
install=hon.install
source=('hon.desktop' 'license' "http://dl.heroesofnewerth.com/HoNClient-${pkgver}.sh")
noextract=("HoNClient-${pkgver}.sh")
md5sums=('25fb5ab8c49be0f1269c79520ccee789'
         'dd2c8cd0f5bcafa25cfb583a92e21aec'
         'e7e689acb05de2d924a2f0829fe0cc59')

package() {
    ## Thx to messo8080 for reminding us about the /tmp dir,
    ## on new installs this dir is in ram by default.

    if `pwd | grep -q "/tmp"`; then
	echo \
"You are trying to build this pkg in /tmp dir.
This is not so good idea as /tmp dir is in RAM
by default. If you know that you have lots of
ram (>8G) and swap and want to continue building in
the current directory write yes and press ENTER.
Otherwise write no and press ENTER. (You might
consider changing the temporary directory, e.g.
using --tmp for yaourt.)
Continue?"
	read answer
		if [ "${answer}" == "no" ]; then
			false
		fi
    fi
    
    #mv HoNClient-${pkgver}-${pkgrel}.sh HoNClient-${pkgver}.sh

    # Create Destination Directory
    mkdir -p "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

    # Extract Files
    sh -c "unzip \"${srcdir}/HoNClient-${pkgver}.sh\" \"data/*\" -d \"${pkgdir}/opt/\"; true"    
    mv "${pkgdir}"/opt/{data,hon}

    # Install License
    cp "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Install Desktop Shortcut
    install -D -m 0644 "${srcdir}/hon.desktop" \
        "${pkgdir}/usr/share/applications/hon.desktop"

    # Install Client Launcher
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/hon/hon.sh "${pkgdir}/usr/bin/hon"

    # Set Ownership to root:games
    chown -R root:games "${pkgdir}/opt/hon"
    chmod -R g+w "${pkgdir}/opt/hon"

    # remove some unwanted libraries
    # (some info: http://forums.heroesofnewerth.com/showthread.php?546434-Crash-HoN-is-unable-to-start-with-xorg-edge-amd-(how-to-fix-also))
    rm -f "${pkgdir}"/opt/hon/libs-x86_64/{libstdc++.so.6,libspeex.so.1,libspeexdsp.so.1,libgcrypt.so.11,libgcc_s.so.1,libfreetype.so.6,libcurl.so.4,libbz2.so.1.0}
}

