# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=crayonphysicsdeluxe
pkgver=55
pkgrel=5
pkgdesc="A 2D physics puzzle / sandbox game, in which your drawings are transformed into objects."
arch=(i686 x86_64)
url="http://www.crayonphysics.com/"
license=(custom)
[ $CARCH = i686 ] \
    && depends+=(glu qt4 sdl_image sdl_mixer)
[ $CARCH = x86_64 ] \
    && depends+=(lib32-glu lib32-qt4 lib32-sdl_image lib32-sdl_mixer)
options=(!strip)
source=(hib://crayon_physics_deluxe-linux-release$pkgver.tar.gz
        crayon.sh)
md5sums=(3f799bba4fbca02fcee4b866e17b193d
         4e3c5f5fe8fe1db8e36d6a83dc30625d)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    # prepare .desktop file
    cd "$srcdir"/CrayonPhysicsDeluxe
    sed -e "/Path=.*/ D" \
        -e "s/Exec=.*/Exec=crayon/" \
        -e "s/Icon=.*/Icon=kloonigames-crayon/" \
        -i kloonigames-crayon.desktop
}

package()
{
    # launch script
    cd "$srcdir"
    install -Dm755 crayon.sh "$pkgdir"/usr/bin/crayon

    # data
    cd CrayonPhysicsDeluxe
    find data -type f -exec install -Dm644 {} "$pkgdir"/opt/$pkgname/{} \;
    install -m644 autoexec.txt "$pkgdir"/opt/$pkgname/autoexec.txt
    install -m755 -t "$pkgdir"/opt/$pkgname crayon launcher

    # legal
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # doc
    install -Dm644 readme.html "$pkgdir"/usr/share/doc/$pkgname/README.html

    # desktop integration
    install -Dm644 kloonigames-crayon.desktop "$pkgdir"/usr/share/applications/kloonigames-crayon.desktop
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/kloonigames-crayon.png
}

# vim:et:sw=4:sts=4
