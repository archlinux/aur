pkgname=terasology-devbuild
pkgver=2086
_omega_ver=844
pkgrel=1
pkgdesc="Yet another high resolution game with blocks like Minecraft! (Last succesful development build)"
arch=('x86_64' 'i686')
license=('Apache')
url="http://terasology.org"
options=('!strip')
depends=('java-environment-openjdk=8' 'openal' 'libxcursor' 'libxxf86vm' 'libxrandr' 'lwjgl2')
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "TerasologyOmega${_omega_ver}.zip::http://jenkins.terasology.org/job/DistroOmega/${_omega_ver}/artifact/distros/omega/build/distributions/TerasologyOmega.zip"
)
sha512sums=('9d2562e769aee38a09de315f9900754827ec2720400e10553f0cbf78c0834bf325220c42c249f17999bc764aa4a0c12aa7abe162d43ea5327672c2fa88fa2669'
            '9ecacc34ae0a17cfe1031f32ee4f25e4e840bed072445ac0a8ffc1b2a012a7b60fed739fcc2ceab8083293a31e7409406bc190c4295022df82815f48c5541d19'
            '1db206493291046077f20ee10ece216c5c922b1745a11e178067581e0df559098d82015d382d7852d64d65e405ab1f8de449791228d503ab1df1ec07349476e1')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega${_omega_ver}.zip"

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

    #clean source directory to avoid problems on next build
    rm -r ./*
}
