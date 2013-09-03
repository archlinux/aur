# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=quake4-demo
pkgver=1.0
pkgrel=5
pkgdesc="Quake 4 demo"
url="http://www.idsoftware.com/games/quake/quake4"
arch=('i686' 'x86_64')
license=('custom:"Quake 4 Demo"')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-glibc' 'lib32-sdl' 'lib32-libx11' 'lib32-libxext' 'lib32-zlib')
    optdepends=('lib32-nvidia-utils: Accelerated 3D with the NVIDIA binary blob video driver'
                'lib32-catalyst-utils: Accelerated 3D with the AMD/ATI binary blob video driver')
else
    depends=('gcc-libs' 'libgl' 'sdl' 'zlib')
fi
install="quake4-demo.install"
source=("${pkgname}.sh" "${pkgname}-dedicated.sh" \
    'http://www.doomwadstation.com/xtra/quake4-linux-1.0-demo.x86.run')
sha256sums=('6f0620a70380214bc57977b27e0d3584f48443e396faa136fabcb8f712b3b581'
            '57c10f7c4771c28ca2e24e5dd6671d01d93e6a5af8df99c42648b54748f7bfdd'
            '69e69e8cb22dd1496bcc98dc63f244d35c516c2e770aba64c72275827814bc73')
PKGEXT=.pkg.tar

package() {
    cd ${srcdir}

    # Create Destination Directories
    install -d ${pkgdir}/opt/ \
        ${pkgdir}/usr/bin \
        ${pkgdir}/usr/share/licenses/${pkgname}

    # Make Installer Executable
    chmod +x quake4-linux-${pkgver}-demo.x86.run

    # Run Installer
    ./quake4-linux-${pkgver}-demo.x86.run --noexec --target quake4

    # Move Executables and Libraries
    install -m 755 -t ${srcdir}/quake4/ \
        ${srcdir}/quake4/bin/Linux/x86/{lib*,q4ded*,quake4*}

    # Make Everything World-Readable
    chmod -R a+r ${srcdir}/quake4/

    # Remove Unneeded Files
    rm -rf ${srcdir}/quake4/{germany/,setup.data/,setup.sh,us/,bin/}

    # Move Quake4 to Destination Directory
    mv ${srcdir}/quake4 ${pkgdir}/opt/${pkgname}

    # Install Client Launcher
    install -m755 -D ${pkgname}.sh \
        ${pkgdir}/opt/${pkgname}/${pkgname}

    # Install Server Launcher
    install -m755 -D ${pkgname}-dedicated.sh \
        ${pkgdir}/opt/${pkgname}/${pkgname}-dedicated

    # Symlink Client Launcher
    ln -sf /opt/${pkgname}/${pkgname} \
        ${pkgdir}/usr/bin/${pkgname}

    # Symlink Server Launcher
    ln -sf /opt/${pkgname}/${pkgname}-dedicated \
        ${pkgdir}/usr/bin/${pkgname}-dedicated

    # Install Licence File
    install -D -m644 ${pkgdir}/opt/${pkgname}/License.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/License.txt
}
