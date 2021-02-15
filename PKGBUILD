# Maintainer: Feakster <feakster at posteo dot eu>

# Notes: http://ric.uthscsa.edu/mango/mango.html
# User guide: http://ric.uthscsa.edu/mango/userguide.html

pkgname=java-mango
_pkgname=${pkgname/java-/}
pkgver=4.1
pkgrel=3
pkgdesc='A viewer for medical research images'
arch=('any') # x86_64
url='http://ric.uthscsa.edu/mango/index.html'
license=('custom:RII-UTHSCSA')
depends=('jre7-openjdk')
options=(!strip)
source=(
    "${pkgname}-${pkgver}.zip::http://ric.uthscsa.edu/$_pkgname/downloads/${_pkgname}_unix.zip"
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
    "${_pkgname}.png::http://ric.uthscsa.edu/$_pkgname/images/app_icon.png"
    'LICENSE'
)
b2sums=(
    '34ed9385f51cc29560a333abd0509bf2a41ef3db73d5b56d73df9ac8a446575f65f403b62daa8e9d589b9fe1dd720dac66fb56e6c345b9929b5b3f725eee7c0e'
    'fefa71e6cbf9bce2f09293d9eb1d7018d041dca7e3feec7eb4d2e077b142f459800749925f68b8a259326d7b41226e688efa6df1957a170fd1c16165d44b9bca'
    '72399e3a7fb5499bc8448fd61109d039faf7efe1364882579916e5839e677705c592b0f394a463aa2b900ef7cd58a154fe12136e52156eeb458dc7e10c0d2be0'
    '19c51a8fff8cda94117fd64db54d23105a9e1850db1016f391230118edc0c6430bbbc0b0e5a74a60b7c572ab4f7b59b21de8d6a77391267e63a42e17aab7e59a'
    'afef46bb3cefe57f95f6fa321d3686e15a95848298a1839f4932910f93ad4eb6542da118d9cb115df20b59e2c02b9ec80d3ddbba01c839c2ce68e4ee66d8eedb'
)

### Prepare() ###
prepare() {
    ## Rename Directory ##
    mv "$srcdir"/Mango "$srcdir"/$_pkgname

    ## Remove Unnecessary Directories/Files ##
    rm -rf $_pkgname/{.DS_Store,jre7,$_pkgname,README}
}

### Package() ###
package() {
    ## Move Core Contents to /opt/mango/ ##
    install -dm0755 "$pkgdir"/opt/$_pkgname
    cp -RLT "$srcdir"/$_pkgname "$pkgdir"/opt/$_pkgname

    ## Move Additional Files to /opt/mango/ ##
    install -m0755 "$srcdir"/${_pkgname}.sh -t "$pkgdir"/opt/$_pkgname
    install -m0644 "$srcdir"/{${_pkgname}.png,${_pkgname}.desktop,LICENSE} -t "$pkgdir"/opt/$_pkgname

    ## Symlink Desktop File ##
    install -dm0755 "$pkgdir"/usr/share/applications
    ln -fs /opt/$_pkgname/${_pkgname}.desktop "$pkgdir"/usr/share/applications/${_pkgname}.desktop

    ## Symlink Executable to System PATH ##
    install -dm0755 "$pkgdir"/usr/bin
    ln -fs /opt/$_pkgname/${_pkgname}.sh "$pkgdir"/usr/bin/$_pkgname

    ## Symlink License ##
    install -dm0755 "$pkgdir"/usr/share/licenses/$_pkgname
    ln -fs /opt/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
