# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
# Contributor: Babets
# Contributor: Paolo Bolzoni

pkgname=doom3
pkgver=1.3.1.1304
pkgrel=13
pkgdesc='Doom 3 Engine. You need the retail .pk4 files to play.'
url='https://doom.com/'
license=('custom:"DOOM 3"')
arch=('i686' 'x86_64')
depends_i686=('libgl' 'alsa-lib' 'openal' 'libxxf86vm' 'libstdc++5')
makedepends_i686=('scons2' 'zip')
optdepends_i686=(
    'alsa-plugins: pulseaudio-support'
    'libpulse: pulseaudio support'
)
depends_x86_64=('lib32-libgl' 'lib32-alsa-lib' 'lib32-openal' 'lib32-libxxf86vm' 'lib32-libstdc++5')
makedepends_x86_64=('scons2' 'gcc-multilib' 'zip')
optdepends_x86_64=(
    'lib32-alsa-plugins: pulseaudio-support'
    'lib32-libpulse: pulseaudio support'
)
install=doom3.install
source=('doom3.launcher' 'doom3-dedicated.launcher' 'doom3.desktop' \
    'doom3.launcher64' 'doom3-dedicated.launcher64' 'doom3.png' 'sound.patch' 'math.patch' \
    'http://www.gamers.org/pub/idgames/idstuff/source/idtech4-doom3-source-GPL.zip' \
    "http://www.gamers.org/pub/idgames/idstuff/doom3/linux/${pkgname}-linux-${pkgver}.x86.run")
provides=('doom3')
conflicts=('doom3-bin' 'iodoom3' 'iodoom3-git' 'iodoom3-bin')
sha256sums=('ea9fe17fdb19cfe8a22e2b7859093f7a76eeaa51fd2571507b6dc37462515f21'
            'f7aa055489f581e3da3001b23becef68586b0994da70ee138425926fc580b204'
            'f9199b09981bb1fffba0f17a71e01021e4ea4aae6d99e553aa00c74d576e812b'
            '718378f2c3c42d56b916e9341e01261a2cfad5fb60ef15cc57954d1a4ce2a94e'
            'e6654e29773b5ed01f897294ecbc21a84dcb59afc30cb60eb0d5a3c03c7d3de1'
            'c9a701498a7b0f923182bf9f11aac8d2193026e509ae3643a5bc118b1a458c6b'
            'a407c385c2a0a013c2bc464fd590e2b976f337e3ee04d769b238168bb5610f76'
            'ac0abb77d44ceb28d7dbe40e2187ee5bc81a8a0314c7f08af17aea7156b6bf3c'
            '18b5e0b5dcbdce60e5f006e7995bc30c9ef7f606c2aa08c5f0a76eb6a6657ad0'
            '2f90dff20f2d3c0c47f17b3d6d45c4f0e7d27b986bf6084f21b85180cd1e03b4')

build() {
    cd "${srcdir}/doom3.gpl/neo"

    # Apply patches
    patch -p3 -i "${srcdir}/sound.patch"
    patch -p3 -i "${srcdir}/math.patch"

    # Build Binaries from Source
    scons2 NOCURL=1 BUILD=release BUILD_GAMEPAK=1

    cd "${srcdir}"

    # Make Installer Executable
    chmod +x "${srcdir}/doom3-linux-${pkgver}.x86.run"

    # Extract Game Files
    ./doom3-linux-${pkgver}.x86.run --tar xf
}

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/doom3/"{base,d3xp}

    # Install Game Binaries
    install -m 755 "${srcdir}/doom3.gpl/neo/doom.x86" \
        "${pkgdir}/opt/doom3"

    # Install Game Files
    install -m 644 base/pak00*.pk4 "${pkgdir}/opt/doom3/base"
    install -m 644 d3xp/pak00*.pk4 "${pkgdir}/opt/doom3/d3xp"
    install -m 644 {CHANGES,README,version.info} "${pkgdir}/opt/doom3"
    install -m 644 "${srcdir}/doom3.gpl/neo/game01-base.pk4" \
        "${pkgdir}/opt/doom3/base/game01.pk4"
    install -m 644 "${srcdir}/doom3.gpl/neo/game01-d3xp.pk4" \
        "${pkgdir}/opt/doom3/d3xp/game01.pk4"

    if [ "$CARCH" == "i686" ]; then
        # Install Game Launcher (Client)
        install -D -m 755 "${srcdir}/doom3.launcher" \
            "${pkgdir}/usr/bin/doom3"

        # Install Game Launcher (Server)
        install -D -m 755 "${srcdir}/doom3-dedicated.launcher" \
            "${pkgdir}/usr/bin/doom3-dedicated"
    else
        # Install Game Launcher (Client)
        install -D -m 755 "${srcdir}/doom3.launcher64" \
            "${pkgdir}/usr/bin/doom3"

        # Install Game Launcher (Server)
        install -D -m 755 "${srcdir}/doom3-dedicated.launcher64" \
            "${pkgdir}/usr/bin/doom3-dedicated"
    fi

    # Install License (DOOM 3)
    install -D -m 644 "${srcdir}/License.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

    # Install Icon
    install -D -m 644 "${srcdir}/doom3.png" \
        "${pkgdir}/usr/share/pixmaps/doom3.png"

    # Install Desktop File
    install -D -m 644 "${srcdir}/doom3.desktop" \
        "${pkgdir}/usr/share/applications/doom3.desktop"
}

