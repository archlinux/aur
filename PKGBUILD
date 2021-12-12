# Maintainer: poilojointur <poilojointur@hotmail.com>
#
# Note: If downloads do not work (fail with e.g. error 403), you will have
# to manually download the base package and the latest service pack from
# http://files.latticesemi.com/Radiant/3.0.0.24.1_Radiant_lin.zip
# Then put these files in the build directory and retry.

_version=3.0.0.24.1
pkgname=lattice-radiant
pkgdesc='Lattice Radiant design software'
url=http://www.latticesemi.com/
license=('custom')
pkgver=${_version}
pkgrel=1
arch=('x86_64')
install=$pkgname.install

source=("http://files.latticesemi.com/Radiant/${_version}_Radiant_lin.zip"
        "lattice-radiant.install"
        "lattice-radiant.png"
        "lattice-radiant.desktop")

sha512sums=('1337d32401ee66ed31c880d4357f048195545f1166a8de11d5601fe686e03cb7e53a8d28fa78dd125bb342f7fa4bde43419c975d32e144342e17b4045c62e083'
            '7ca5af62d5fd5cf9d0ead8c4f84bba42389340192a5a2648fc06b2674ec43b3dd060ec4aecb91f75eff7d74e2b2c630c24119ff93a81ab4e3e32b9551a6d2e68'
            '878dea16b7bc634e2bc64ddf7ea9a1ad40fa7dfbad000003a8a6737d7da557d7dd38281e885691a39db0009605393f9598e2f94f8ea541eca5489d41e5ae6a66'
            '9545ef1d8ab220b2e3497d7ee7de06163c0723a5bab960ccd810dee050e3b9669ed8496f122a1c1a020192795bd02ea466b6db6081bd6aeb913c4d3a9db16645')

# These run-time dependencies seem to be needed for proper operation
depends=(
        'fontconfig' 'gnu-free-fonts' 'nss' 'atk' 'cairo' 'pango'
        'libxcb' 'xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
        'glibc' 'libjpeg' 'libieee1284' 'libusb' 'libx11' 'libice' 'libsm' 'libxt' 'libxtst' 'libxext' 'libxrender' 'libxi' 'libxft'
        'libxkbcommon' 'libxkbcommon-x11' 'libxslt' 'libxrandr' 'libxfixes' 'libxdamage' 'libxcursor' 'libxcomposite' 'libgl' 'libxinerama' 'libxss'
        )

options=('!strip')
PKGEXT=".pkg.tar.zst"

prepare() {
    # Unzip and run the self extracting executable
    echo "Extracting archive..."
    bsdtar -xf ${_version}_Radiant_lin.zip
    echo "Running Lattice Radiant Installer"
	./${_version}_Radiant_lin.run --console --prefix usr/local/radiant/${_version}
}

package() {
    # Move everything to pkgdir
	mv ${srcdir}/usr ${pkgdir}/

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}/usr/local/radiant/3.0.0.24.1/uninstaller.dat"
    rm -r "${pkgdir}/usr/local/radiant/3.0.0.24.1/InstallationLog.txt"

    # Copy license file
    install -D -m644 "${pkgdir}/usr/local/radiant/3.0.0.24.1/data/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m644 lattice-radiant.png "${pkgdir}/usr/share/pixmaps/lattice-radiant.png"
    install -D -m644 lattice-radiant.desktop "${pkgdir}/usr/share/applications/lattice-radiant.desktop"
}
