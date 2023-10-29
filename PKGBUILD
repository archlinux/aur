# vim: set ts=8 sw=8 expandtab:
#
# Maintainer: dosssman <dosssman@hotmail.fr>
_pkgname=projecteur
_gitname=Projecteur
pkgname=projecteur-git
pkgver=1.0alpha.202.r648.eb9ff49
pkgrel=1
pkgdesc="Linux Desktop Application for the Logitech Spotlight device."
arch=('x86_64')
url="https://github.com/jahnf/Projecteur"
license=('MIT')
depends=('qt5-graphicaleffects>=5.7' 'udev')
install='projecteur.install'
makedepends=('git' 'cmake' 'make')
provides=('projecteur')
conflicts=('projecteur')
source=("git+https://github.com/jahnf/Projecteur.git"
        "projecteur.install")
md5sums=('SKIP'
         '658b29f7bc92ece81acfe5601d8ef21c')

pkgver() {
        cd "$srcdir/$_gitname"
        printf "%s.r%s.%s" "$(cat $srcdir/build/version-string.archlinux)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        mkdir -p "$srcdir/build"
        cd "$srcdir/build"
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPROJECTEUR_QT_VERSION:STRING="5" "$srcdir/$_gitname"
}

build() {
        cd "$srcdir/build"
        make
}

package() {
        # PKG
        cd "$srcdir/build"
        make DESTDIR="$pkgdir/" install

        # LICENSE
        install -D -m644 "$srcdir/$_gitname/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
