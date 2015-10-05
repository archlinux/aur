# Maintainer: Sam S <smls75@gmail.com>
# Based on the 'community/openttd' PKGBUILD by: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=openttd-jgrpp-git
_installname=openttd
pkgver=1.5.2rc1+r27403+p0.5.3
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack"
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
conflicts=openttd
install=openttd-jgrpp.install
optdepends=('openttd-opengfx: free graphics' 
            'openttd-opensfx: free soundset')

_gitname=OpenTTD-patches

# If you want the latest *stable* release of the patch pack, uncomment this line:
# _fragment="#tag=jgrpp-0.5.3"

source=("git+https://github.com/JGRennison/$_gitname.git$_fragment"
        "http://finger.openttd.org/tags.txt")
sha256sums=(SKIP SKIP)

pkgver() {
    cd "$_gitname"
    _openttdrev="$(./findversion.sh | cut -f2)"
    _openttdver="$(cat "$srcdir"/tags.txt |
                   awk '$1<='"$_openttdrev"' {print $3; exit}' |
                   sed -e 's/[^0-9a-z.]//ig' -e 's/./\L&/g')"
    _patchtag="$(git describe --abbrev=0 --tags)"
    _patchver="$(echo $_patchtag  | sed -e 's/^[a-z-]*//')"
    _patchcommits="$(git log "$_patchtag".. --pretty=oneline | wc -l)"
    _patchrev=$(LC_ALL=C git log -1 --format="%h")
    _patchsuffix=""
    [[ $_patchcommits -ne 0 ]] && _patchsuffix="+r$_patchcommits.$_patchrev"
    echo "$_openttdver+r$_openttdrev+p$_patchver$_patchsuffix"
}

build() {
    cd $_gitname

    ./configure \
        --prefix-dir=/usr \
        --binary-name=$_installname \
        --binary-dir=bin \
        --data-dir=share/$_installname \
        --install-dir=$pkgdir \
        --doc-dir=share/doc/$_installname \
        --menu-name="OpenTTD" \
        --personal-dir=.$_installname
#        --without-libbfd

    make
}

package() {
    cd $_gitname
    mkdir -p "$pkgdir"/usr/share/$_installname/{data,game}

    make install

    cp -rT bin/game "$pkgdir"/usr/share/$_installname/game
}
