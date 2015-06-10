# Maintainer: Alex Szczuczko <alex at szc dot ca>

pkgname=tiberiansun
pkgver=2.03
pkgrel=1
pkgdesc="Freeware release of Westwood's classic C&C: Tiberian Sun, with Firestorm Expansion (uses Wine)"
url='http://web.archive.org/web/20000302013458/http://www.westwood.com/games/ccuniverse/tiberiansun/index.html'
arch=('any')
license=('custom:freeware')
depends=('wine'
         'winetricks')
makedepends=('unrar')
options=(!strip)
install='tiberiansun.install'
source=('tiberiansun.desktop'
        'launch-tiberiansun.sh'
        'README'
        'http://pub.zoneofgames.ru/demos/fullgames/OfficialCnCTiberianSun.rar')
noextract=('OfficialCnCTiberianSun.rar')
sha256sums=('ce9c09f9338c989d005bd8c9c425b930ad591a7ee135c5f6c4ccbce513c4199e'
            '413b214f75ed15007d7ee5a71a2c89ef04e1892237d1e59c6fa2535bc4ba67ad'
            '739ada7ac1b6b7614ad386bdd74f472a36902110daaba12cd2c7dd3d527e7e61'
            'b04219e715511de9baa2feb9827013c8e106f8d6b9b563936b8a2f650305dec5')

# Disable compression of the package
PKGEXT='.tar'

build() {
    cd "$srcdir"
    unrar x -o- OfficialCnCTiberianSun.rar
    find "EA Games/" -type f -exec chmod 644 "{}" \;
    find "EA Games/" -type d -exec chmod 755 "{}" \;
}

package() {
    cd "$srcdir"

    mkdir -p "$pkgdir/opt/$pkgname/"

    # Main files and License
    pushd 'EA Games/Command & Conquer The First Decade/Command & Conquer(tm) Tiberian Sun(tm)' >/dev/null
    cp -R "SUN" "$pkgdir/opt/$pkgname/"
    install -Dm644 SUN/LICENSE.DOC "$pkgdir/usr/share/licenses/$pkgname/LICENSE.DOC"
    popd >/dev/null

    # Online fixes
    pushd 'EA Games/Command & Conquer The First Decade' >/dev/null
    cp -R "Internet" "$pkgdir/opt/$pkgname/"
    install -Dm644 "TiberianSun_OnlinePlayInstructions.txt" "$pkgdir/opt/$pkgname/Internet/TiberianSun_OnlinePlayInstructions.txt"
    install -Dm644 "tibsun_regadd.reg" "$pkgdir/opt/$pkgname/Internet/tibsun_regadd.reg"
    popd >/dev/null

    # Launcher
    install -Dm755 "launch-$pkgname.sh" "$pkgdir/opt/$pkgname/launch-$pkgname.sh"
    mkdir -p "$pkgdir/usr/bin/"
    ln -s -T "/opt/$pkgname/launch-$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Icon
    mkdir -p "$pkgdir/usr/share/icons/"
    ln -s -T "/opt/$pkgname/SUN/SUN.ICO" "$pkgdir/usr/share/icons/$pkgname.ico"

    # .desktop File
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Docs
    install -Dm644 "README" "$pkgdir/opt/$pkgname/README"
}
