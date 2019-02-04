pkgname=terasology-devbuild
pkgver=2270
_omega_ver=1032
pkgrel=1
pkgdesc="Yet another high resolution game with blocks like Minecraft! (Last succesful development build)"
arch=('x86_64' 'i686')
license=('Apache')
url="http://terasology.org"
options=('!strip')
depends=('java-environment-openjdk>=8' 'openal' 'libxcursor' 'libxxf86vm' 'libxrandr' 'lwjgl2')
makedepends=('unzip')
source=(
    "${pkgname}.sh"
    "${pkgname}.desktop"
    "rendering.cfg"
    "TerasologyOmega${_omega_ver}.zip::https://jenkins.terasology.org/job/DistroOmega/${_omega_ver}/artifact/distros/omega/build/distributions/TerasologyOmega.zip"
)
sha512sums=('9d2562e769aee38a09de315f9900754827ec2720400e10553f0cbf78c0834bf325220c42c249f17999bc764aa4a0c12aa7abe162d43ea5327672c2fa88fa2669'
            '9ecacc34ae0a17cfe1031f32ee4f25e4e840bed072445ac0a8ffc1b2a012a7b60fed739fcc2ceab8083293a31e7409406bc190c4295022df82815f48c5541d19'
            '43625b793236742cf6297d435567a9019f69a0852eb728f71462aad64aac85046708812f4f033b6d717b5eacdad65f4725c037d5f61a02fe88dfc14830705faf'
            '0655d889005ff6128a487cfd3d94a6070174d228df82b29da86ad01c03c81a36214ea7280fcec6313e34a30beb3e0dbda236478b8a3283261bb4f75c8b6b90f8')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}.sh" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega${_omega_ver}.zip"

    #extract and install icons
    unzip -u libs/engine-* "org/terasology/icons/*"
    pushd org/terasology/icons
    for icon in *
    do
        size=${icon##*_}        #gooey_sweet_XX.png -> XX.png
        size=${size/.png/}      #XX.png -> XX
        install -Dm 644 "$icon" "${pkgdir}/usr/share/icons/${size}x${size}/apps/${pkgname}.png"
    done
    install -Dm 644 "${pkgdir}/usr/share/icons/64x64/apps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    popd
    rm -r org

    #remove files/dirs for other operating systems and native libraries
    rm run_macosx.command Terasology.{x86,x64}.exe
    rm -r natives
    mkdir -p natives/linux

    #link the lwjgl libraries
    ln -sf /usr/share/lwjgl2/native/linux/liblwjgl64.so natives/linux
    ln -sf /usr/share/lwjgl2/native/linux/libjinput-linux64.so natives/linux
    ln -sf /usr/share/lwjgl2/native/linux/liblwjgl.so natives/linux
    ln -sf /usr/share/lwjgl2/native/linux/libjinput-linux.so natives/linux

    cp -ra "$srcdir" "${pkgdir}/usr/share/${pkgname}"

    # Copy this file (not entirely sure about this, but doesn't start without it)
    install -Dm 644 "${srcdir}/rendering.cfg" "${pkgdir}/usr/share/${pkgname}/configs/engine/rendering.cfg"
    rm "${pkgdir}/usr/share/${pkgname}/rendering.cfg"

    #clean source directory to avoid problems on next build
    rm -r ./*
}
