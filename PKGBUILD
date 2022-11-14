# Contributor: parov0z <andrey.android7890 at gmail dot com>

pkgbase=meridius-bin-git
pkgname=("${pkgbase}" "${pkgbase}-electron")
pkgver=v2.4.24
pkgrel=1
pkgdesc="Free and modern music player for VK. Meridius - it is a beautiful music player for vk.com"
arch=('x86_64')
url="https://purplehorrorrus.github.io/meridius"
license=('custom')
makedepends=('git' 'gendesk')
options=('!strip' '!emptydirs')
source=(git+https://github.com/PurpleHorrorRus/Meridius.git)
md5sums=('SKIP')

pkgver(){
    cd "Meridius"
    git tag --sort=committerdate | tail -1
}  

file=meridius-${pkgver//v}.tar.gz
url=https://github.com/PurpleHorrorRus/Meridius/releases/download/$pkgver/$file
         
build(){
    cd $srcdir
    curl -qgb "" -fLC - --retry 3 --retry-delay 3 -o $file $url
}
    
package_meridius-bin-git(){
    depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
    optdepends=('libappindicator-gtk3')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (Built-in Electron)"
    provides=('meridius')
    conflicts=('meridius')
        bsdtar -xf $file
    
        install -dm755 "$pkgdir/opt"
        mv "meridius-${pkgver//v}" "${pkgdir}/opt/Meridius"
        install -Dm 644 "${pkgdir}/opt/Meridius/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        
        gendesk -f --pkgname "meridius"                         \
                --exec "/opt/Meridius/meridiusreborn %U"        \
                --icon "/opt/Meridius/build/icons/256x256.png"  \
                --categories "Audio;Music;Player;AudioVideo;"   \
                --comment $pkgdesc
                
        install -Dm 644 -t "$pkgdir/usr/share/applications" meridius.desktop
}

# (not working)
package_meridius-bin-git-electron() {
    depends=('electron' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (System Electron)"
    provides=('meridius')
    conflicts=('meridius')
        bsdtar -xf $file "./meridius-${pkgver//v}/build/icons/256x256.png" "./meridius-${pkgver//v}/resources/app.asar"
    
        mkdir -p ${pkgdir}/usr/share/Meridius
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps
        mkdir -p ${pkgdir}/usr/share/applications

        gendesk -f --pkgname "meridius"                             \
                --exec "electron /usr/share/Meridius/app.asar %U"   \
                --icon "meridiusreborn"                             \
                --categories "Audio;"                               \
                --comment $pkgdesc
        
        
        mv "meridius-${pkgver//v}/build/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/meridiusreborn.png"
        mv meridius.desktop "${pkgdir}/usr/share/applications"
        mv "meridius-${pkgver//v}/resources/app.asar" "${pkgdir}/usr/share/Meridius"
}
