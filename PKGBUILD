# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Todd Partridge <toddrpartridge@gmail.com>

pkgname=worldofgoo
pkgver=1.41
pkgrel=6
pkgdesc="A physics based puzzle/construction game (requires copy of the full game)."
arch=(i686 x86_64)
url="http://2dboy.com/games.php"
license=(custom)
depends=(gtk-update-icon-cache sdl_mixer hicolor-icon-theme)
optdepends=("worldofgoo-gootool: for creating and installing fan levels")
install=$pkgname.install
source=(hib://WorldOfGooSetup.1.41.tar.gz
        $pkgname.desktop)
md5sums=(f5afa40893d0fbcc37885191404f6d8c
         706ff492ea8096e1a2a7ee9a4d171aca)
options=(!strip)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    cd "$srcdir"/WorldOfGoo

    # cleanup
    rm -r libs{32,64}
    [ $CARCH = i686 ] \
        && rm WorldOfGoo.bin64 \
        && find -name "*.binltl64" -exec rm {} \; \
        || true
    [ $CARCH = x86_64 ] \
        && rm WorldOfGoo.bin32 \
        && find -name "*.binltl" -exec rm {} \; \
        || true
}

package()
{
    cd "$srcdir"

    # data
    find WorldOfGoo -type f -name "WorldOfGoo*" -exec install -Dm755 {} "$pkgdir"/opt/{} \; \
        -o -type f -exec install -Dm644 {} "$pkgdir"/opt/{} \;

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/WorldOfGoo/WorldOfGoo "$pkgdir"/usr/bin/worldofgoo

    # desktop integration
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    for i in 16x16 22x22 32x32 48x48 64x64 128x128
    do
        install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps
        ln -s /opt/WorldOfGoo/icons/$i.png "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
    done
    install -d "$pkgdir"/usr/share/icons/hicolor/scalable/apps
    ln -s /opt/WorldOfGoo/icons/scalable.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

    # doc
    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/WorldOfGoo/{linux-issues.txt,readme.html} 

    # legal
    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/WorldOfGoo/eula.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:et:sw=4:sts=4
