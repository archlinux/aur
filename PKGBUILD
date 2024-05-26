# Maintainer: Sam S <smls75@gmail.com>
# Based on the 'community/openttd' PKGBUILD by: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=openttd-jgrpp-git
_installname=openttd
pkgver=14.0+20240224+gddb3914074+528aae3f3b
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack"
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
makedepends=('go-yq' 'ninja')
conflicts=('openttd')
install=openttd-jgrpp.install
optdepends=('openttd-opengfx: free graphics' 
            'openttd-opensfx: free soundset')

_gitname=OpenTTD-patches

# If you want the latest *stable* release of the patch pack, uncomment this line:
# _fragment="#tag=jgrpp-0.15.1"

source=("git+https://github.com/JGRennison/$_gitname.git$_fragment"
        "http://cdn.openttd.org/latest.yaml")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$_gitname"

    # This may not be the final method of version string construction.
    #---

    # Extract the 'testing' version string and the nightly revision string from latest.yaml
    
    # Please note that, since the JGRPP patches' trunk version may not be the
    # same as OpenTTD's official 'testing' version, the actual version string
    # may be an inaccurate reflection of the actual current version of JGRPP;
    # although it may indirectly indicate the time period of this version,
    # using the 'then latest' OpenTTD testing version as a reference point.
    _openttdver="$(yq '.latest[] | select(.category == "openttd" and .name == "testing").version' $srcdir/latest.yaml)" # eg 14.0-RC1
    _openttdrev="$(yq '.latest[] | select(.category == "openttd" and .name == "master").version' $srcdir/latest.yaml)" # eg 20240224-master-gddb3914074

    # Take only the base of the version string, without suffixes like '-RCx'
    _basever="$(sed 's/-.*//' <<<$_openttdver)" # e.g. 14.0

    # Take the date part of the nightly revision string, as well as the commit SHA1
    _datever="$(sed 's/-.*//' <<<$_openttdrev)" # e.g. 20240224
    _commitsha="$(sed 's/.*-//g' <<<$_openttdrev)" # e.g. gddb39140747

    # Take the latest JGRPP revision string
    _patchrev=$(LC_ALL=C git log -1 --format="%h") # e.g. 528aae3f3b

    # Construct the full package version string
    echo "$_basever+$_datever+$_commitsha+$_patchrev" # e.g. 14.0+20240224+gddb3914074+528aae3f3b
}

build() {
    cd $_gitname

    cmake \
        -B build \
        -D BINARY_NAME="$pkgname" \
        -D CMAKE_INSTALL_BINDIR="bin" \
        -D CMAKE_INSTALL_DATADIR="/usr/share" \
        -D CMAKE_INSTALL_PREFIX="/usr" \
        -D PERSONAL_DIR=".$pkgname" \
        -D CMAKE_BUILD_TYPE="None" \
        -G Ninja
    
    ninja -C build
}

package() {
    cd $_gitname
    mkdir -p "$pkgdir"/usr/share/$_installname/{data,game}

    DESTDIR="$pkgdir" ninja -C build install

    cp -rT bin/game "$pkgdir"/usr/share/$_installname/game
}
