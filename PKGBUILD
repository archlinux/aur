# Contributor: parovoz <andrey.android7890 at gmail dot com>

pkgbase=meridius-bin-git
pkgname=("${pkgbase}" "${pkgbase}-electron")
pkgver=v2.9.7
pkgrel=1
pkgdesc="Free and modern music player for VK. Meridius - it is a beautiful music player for vk.com"
arch=('x86_64')
url="https://purplehorrorrus.github.io/meridius"
license=('custom')
makedepends=('git' 'asar')
options=('!strip' '!emptydirs')
source=(git+https://github.com/PurpleHorrorRus/Meridius.git)
md5sums=('SKIP')

sourceUrl="https://github.com/PurpleHorrorRus/Meridius"

pkgver(){
    cd "Meridius"
    releases=(`git tag --sort=-refname`) # sadly not every release has linux version
    for i in ${releases[*]}
    do
        _url="$sourceUrl/releases/download/$i/meridius-${i//v}.tar.gz"
        [[ "$i" == "$pkgver" ]] && break
        curl -o /dev/null --silent --head --fail "$_url" && break
    done
    
    echo $i
}         
         
build(){
    cd $srcdir
    
    _file=meridius-${pkgver//v}.tar.gz
    _url="$sourceUrl/releases/download/$pkgver/$_file"
    
    # it failes when file exists and is fully downloaded already
    curl -qgb "" -fLC - --retry 3 --retry-delay 3 -o $_file $_url
    bsdtar -xf $_file 
}
    
package_meridius-bin-git(){
    depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
    optdepends=('libappindicator-gtk3')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (Built-in Electron)"
    provides=('meridius')
    conflicts=('meridius')
        install -dm755 "$pkgdir/opt"
        cp -r "meridius-${pkgver//v}" "${pkgdir}/opt/Meridius"
        install -Dm644 "${pkgdir}/opt/Meridius/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        
        cd $srcdir/meridius-${pkgver//v}/
        
        sed -i "s!Exec=.*!Exec=/opt/Meridius/meridius!"         io.github.purplehorrorrus.Meridius.desktop
        sed -i "s!AudioVideo;!Audio;Music;Player;AudioVideo;!"  io.github.purplehorrorrus.Meridius.desktop
        
        install -Dm644 builder/icons/linux/256x256.png ${pkgdir}/usr/share/pixmaps/io.github.purplehorrorrus.Meridius.png 
                
        install -Dm644 -t "$pkgdir/usr/share/applications" io.github.purplehorrorrus.Meridius.desktop
}

package_meridius-bin-git-electron() {
    depends=('electron' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (System Electron)"
    provides=('meridius')
    conflicts=('meridius')
        cd $srcdir/meridius-${pkgver//v}/resources
        
        msg2 "unpacking app..."
        asar e app.asar app
        rm app.asar
        
        msg2 "changing resource search path"
        sed -i "s!builder/icons!meridius/icons!" app/dist/main/index.js
        
        msg2 "repacking app..."
        asar p app app.asar --unpack-dir '**'
        rm -r app

        cd ..
        
        sed -i "s!Exec=.*!Exec=electron /usr/share/meridius/app.asar!" io.github.purplehorrorrus.Meridius.desktop
        sed -i "s!AudioVideo;!Audio;Music;Player;AudioVideo;!"         io.github.purplehorrorrus.Meridius.desktop

        install -dm755 ${pkgdir}/usr/share/{meridius,applications}
        
        cp -dr --preserve=ownership             \
                builder/icons                   \
                resources/app.asar              \
                resources/app.asar.unpacked     \
            ${pkgdir}/usr/share/meridius
        
        install -Dm644 builder/icons/linux/256x256.png            ${pkgdir}/usr/share/pixmaps/io.github.purplehorrorrus.Meridius.png 
        install -Dm644 io.github.purplehorrorrus.Meridius.desktop ${pkgdir}/usr/share/applications/
}
