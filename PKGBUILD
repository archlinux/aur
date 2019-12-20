# Maintainer: Timo Wilken <timo dot 21 dot wilken plus aur at gmail dot com>
_pkgname=Kimi
_pkgvariant=dark
pkgname=kimi-dark-gtk-theme-git
pkgrel=1
pkgver=r67.1224d14
pkgdesc='Kimi is a Gtk3.20+ theme'
arch=(any)
url='https://github.com/EliverLara/Kimi'
license=('GPL3')
depends=('gtk3')
makedepends=('python' 'inkscape' 'optipng')
source=("$_pkgname::git+https://github.com/EliverLara/$_pkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%d.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    git checkout "$_pkgvariant"
    rm -r Art
    pushd gtk-2.0
    ./render-assets.sh
    popd
    pushd src
    {
        ./render-gtk3-assets-hidpi.py &
        ./render-gtk3-assets.py &
        ./render-wm-assets-hidpi.py &
        ./render-wm-assets.py &
        wait
    } | sed '/^\.$/d'
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 -d "$pkgdir/usr/share/themes/$_pkgname-$_pkgvariant"
    find . -type f -print0 | xargs -0 chmod -x
    cp -at "$pkgdir/usr/share/themes/$_pkgname-$_pkgvariant/" *
}
