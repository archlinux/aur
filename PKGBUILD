# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=quake4
pkgver=1.4.2
pkgrel=3
pkgdesc="Quake 4 Engine. You need the retail .pk4 files to play."
url="https://web.archive.org/web/20061205073314/http://www.idsoftware.com/games/quake/quake4/"
license=('custom:"Quake 4"' \
         'custom:"PunkBuster"')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-glibc' 'lib32-sdl' 'lib32-libx11' 'lib32-libxext' 'lib32-zlib')
    optdepends=('lib32-nvidia-utils: Accelerated 3D with the NVIDIA binary blob video driver'
                'lib32-catalyst-utils: Accelerated 3D with the AMD/ATI binary blob video driver')
else
    depends=('gcc-libs' 'libgl' 'sdl' 'zlib')
fi
arch=('i686' 'x86_64')
install=quake4.install
source=('quake4.desktop' 'quake4.launcher' 'quake4-dedicated.launcher' 'quake4-smp.launcher' \
"http://www.slashbunny.com/aur/quake4/quake4-linux-${pkgver}.x86.run")
sha256sums=('8d2ff5eb71ebf7ffef321097bc74e97755e5e510985df75863dd22cdf5a3ec2e'
            '667992139f08d3496c96ac02d15b830370ae14bcc15cc8e65ded4c58036d3f23'
            'cfb3353c8c9d8be8a9a32ba05a48dca7c2125cef20159b85de7135c78a950e73'
            '62ba170609ca961430e39f7a24e23e1a3b28376e42f779e7e28714868d7758d1'
            '9203b387b1a4075a1b9ad1eb7be32b49a88141a448d9330d9cbe1f40a145bd6a')

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/"

    # Make Installer Executable
    chmod +x "${srcdir}/quake4-linux-${pkgver}.x86.run"

    # Extract Files from Installer
    "${srcdir}/quake4-linux-${pkgver}.x86.run" --noexec --target quake4

    # Move pk4 files to correct location
    mv "${srcdir}/quake4/us/q4base/"*.pk4 \
        "${srcdir}/quake4/q4base/"

    # Move Executables and Libraries
    install -m 755 -t "${srcdir}/quake4/" \
        "${srcdir}/quake4/bin/Linux/x86/"{lib*,q4ded*,quake4*}

    # Make Everything World-Readable
    chmod -R a+r "${srcdir}/quake4/"

    # Remove Unneeded Files
    rm -rf "${srcdir}/quake4/"{germany/,setup.data/,setup.sh,us/,bin/}

    # Move Quake4 to Destination Directory
    mv "${srcdir}/quake4" "${pkgdir}/opt/"

    # Install Launcher (Client)
    install -D -m 755 "${srcdir}/quake4.launcher" \
        "${pkgdir}/usr/bin/quake4"

    # Install Launcher (Client - SMP)
    install -D -m 755 "${srcdir}/quake4-smp.launcher" \
        "${pkgdir}/usr/bin/quake4-smp"

    # Install Launcher (Server)
    install -D -m 755 "${srcdir}/quake4-dedicated.launcher" \
        "${pkgdir}/usr/bin/quake4-dedicated"

    # Install License (Quake 4)
    install -D -m 644 "${pkgdir}/opt/quake4/License.txt" \
        "${pkgdir}/usr/share/licenses/quake4/License.txt"

    # Install License (PunkBuster)
    install -D -m 644 "${pkgdir}/opt/quake4/pb/PBEULA.txt" \
        "${pkgdir}/usr/share/licenses/quake4/PBEULA.txt"

    # Install Desktop File
    install -D -m 644 "${srcdir}/quake4.desktop" \
        "${pkgdir}/usr/share/applications/quake4.desktop"

    # Install Icon File
    install -D -m 644 "${pkgdir}/opt/quake4/q4icon.bmp" \
        "${pkgdir}/usr/share/pixmaps/quake4.bmp"
}
