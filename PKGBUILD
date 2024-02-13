# Maintainer: Feakster <feakster at posteo dot eu>

# Notes: https://mangoviewer.com/mango.html
# User guide: https://mangoviewer.com/userguide.html

### Info ###
pkgname=java-mango
_pkgname=${pkgname#java-}
pkgver=4.1
pkgrel=8
pkgdesc='A viewer for medical research images'
arch=('any')
url="https://${_pkgname}viewer.com/${_pkgname}.html"
license=('custom:RII-UTHSCSA')
changelog=ChangeLog
depends=(hicolor-icon-theme jre8-openjdk)
makedepends=(imagemagick)
options=(!strip)
source=("${pkgname}-${pkgver}.zip::http://${_pkgname}viewer.com/downloads/${_pkgname}_unix.zip"
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png::http://${_pkgname}viewer.com/images/app_icon.png"
        'ChangeLog'
        'LICENSE')
b2sums=('34ed9385f51cc29560a333abd0509bf2a41ef3db73d5b56d73df9ac8a446575f65f403b62daa8e9d589b9fe1dd720dac66fb56e6c345b9929b5b3f725eee7c0e'
        'd53e92c1f91cef43008bec5178dd4e1fdf08063d066f046f8ba8957f2cfb659f9b639147658cf090efffd76f72138c74d400937a58ce938e641cab425bb19817'
        'db3bc9fc702cd693a25f0f95554de3603bbac2442c19c1e73194cef53b7fac6f222a99f208bd31bd8add5b4ec999e8d2cddf5c57baf896c6c3ee7fa2e12f487e'
        '19c51a8fff8cda94117fd64db54d23105a9e1850db1016f391230118edc0c6430bbbc0b0e5a74a60b7c572ab4f7b59b21de8d6a77391267e63a42e17aab7e59a'
        'd728e4524476b858d3f43796e340cfbcf9287ca6cc011f93eac94290b4739f9c885e939ac6057e6d309416bbe2722ae31f3a2fb90b11511e6d02c1262d54ff01'
        'afef46bb3cefe57f95f6fa321d3686e15a95848298a1839f4932910f93ad4eb6542da118d9cb115df20b59e2c02b9ec80d3ddbba01c839c2ce68e4ee66d8eedb')

### Prepare ###
prepare() {
    ## Rename Directory ##
    mv "$srcdir"/Mango "$srcdir"/$_pkgname

    ## Remove Unnecessary Directories/Files ##
    rm -rf "$srcdir"/$_pkgname/{.DS_Store,jre7,$_pkgname,README}

    ## Convert Icons ##
    for res in 16 22 24 32 48 64 128 256; do
        convert "$srcdir"/$_pkgname.png \
            -resize ${res}x${res} \
            "$srcdir"/$_pkgname/$_pkgname-${res}x${res}.png
    done
}

### Package ###
package() {
    ## Move Core Contents to /opt/mango/ ##
    install -dm0755 "$pkgdir"/opt/$_pkgname
    cp -RLT "$srcdir"/$_pkgname "$pkgdir"/opt/$_pkgname

    ## Move Additional Files to /opt/mango/ ##
    install -m0755 "$srcdir"/${_pkgname}.sh -t "$pkgdir"/opt/$_pkgname
    install -m0644 "$srcdir"/{${_pkgname}.desktop,LICENSE} -t "$pkgdir"/opt/$_pkgname

    ## Symlink Desktop File ##
    install -dm0755 "$pkgdir"/usr/share/applications
    ln -fs \
        /opt/$_pkgname/${_pkgname}.desktop \
        "$pkgdir"/usr/share/applications/${_pkgname}.desktop

    ## Symlink Executable to System PATH ##
    install -dm0755 "$pkgdir"/usr/bin
    ln -fs \
        /opt/$_pkgname/${_pkgname}.sh \
        "$pkgdir"/usr/bin/$_pkgname

    ## Symlink Icons ##
    for res in 16 22 24 32 48 64 128 256; do
        install -dm0755 "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps
        ln -fs \
            /opt/$_pkgname/$_pkgname-${res}x${res}.png \
            "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png
    done

    ## Symlink License ##
    install -dm0755 "$pkgdir"/usr/share/licenses/$_pkgname
    ln -fs \
        /opt/$_pkgname/LICENSE \
        "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
