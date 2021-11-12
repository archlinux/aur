# Maintainer: LightDot <lightdot -a-t- g m a i l >

pkgname=openstarruler-git
pkgver=r68.f07b3cd
pkgrel=3
pkgdesc="Star Ruler 2 is a Massive scale 4X-RTS set in space. Control planets, manipulate politics, research technologies and command armies in your quest for galactic dominance."
arch=('x86_64')
url="http://starruler2.com/"
license=('MIT')
depends=('libpng' 'zlib' 'glew' 'glu' 'freetype2' 'libvorbis' 'libogg' 'openal' 'bzip2' 'libxrandr' 'curl')
makedepends=('git' 'cmake' 'gcc' 'make')
provides=('starruler2')
conflicts=('starruler2')
replaces=('starruler2')
source=('OpenStarRuler::git+https://github.com/OpenSRProject/OpenStarRuler.git'
        'OpenStarRuler-Data::git+https://github.com/OpenSRProject/OpenStarRuler-Data.git'
        'starruler2.desktop')
sha256sums=('SKIP'
            'SKIP'
            '983a5e99e67999430b56f755e24e179cf2df2286d7492e80a0635477d73b9133')

pkgver() {
    cd OpenStarRuler
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd OpenStarRuler
    LDFLAGS=-std=c++11 make -k -f source/linux/Makefile compile "-j$(nproc)"
}

package() {
    install -m 0644 -Dt "$pkgdir/usr/share/applications/" starruler2.desktop
    cd "$srcdir/OpenStarRuler"
    install -m 0644 -Dt "$pkgdir/usr/share/pixmaps/" sr2.png
    install -m 0755 -Dt "$pkgdir/opt/starruler2/" StarRuler2.sh
    cp --preserve=mode -drt "$pkgdir/opt/starruler2/" bin
    cd "$srcdir/OpenStarRuler-Data"
    cp --preserve=mode -drt "$pkgdir/opt/starruler2/" maps mods locales data scripts
}
