# vim:set ft=sh:
# Maintainer: gitaarik <gitaarik@posteo.net>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Dmitriy Q atsip-help <at> yandex <dot> ru

# Upstream tarball/source-tree name; pkgbase must stay doublecmd-gtk2 to match the AUR repo.
_pkgbase=doublecmd
pkgname=doublecmd-gtk2
pkgver=1.2.8
pkgrel=1
pkgdesc="twin-panel (commander-style) file manager (gtk2)"
url="https://doublecmd.sourceforge.io/"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later' 'MIT' 'MPL-1.1' 'MPL-2.0' 'Apache-2.0' 'BSD-2-Clause' 'Zlib')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info')
makedepends=('lazarus' 'imagemagick' 'ffmpegthumbnailer')
provides=("$_pkgbase")
conflicts=('doublecmd-qt5' 'doublecmd-qt6' 'doublecmd-gtk')
replaces=('doublecmd-qt' 'doublecmd-qt4')
optdepends=(
    'lua: scripting'
    'unzip: support extracting zip archives'
    'zip: support packing zip archives'
    'p7zip: support for 7zip archives'
    'libunrar: support for rar archives'
    'imagemagick: preview xcf files'
    'ffmpegthumbnailer: preview video files'
    'mplayer: to make use of the wlxmplayer plugin'
)
source=(
    "https://downloads.sourceforge.net/project/$_pkgbase/Double%20Commander%20Source/$_pkgbase-$pkgver-src.tar.gz"
)
sha512sums=('55432468baae690e58f3ae90d4a4a6bcd91233aee38225813f833b743d2ff1c19bc1f5d413e411c36a9480254d90336a75da7655daf857156cd3105de2586e7b')

prepare() {
    cp -a /usr/lib/lazarus ./

    cd "$_pkgbase-$pkgver"
    sed -e 's/LIB_SUFFIX=.*/LIB_SUFFIX=/g' -i install/linux/install.sh
    sed -e "s@=\$(which lazbuild)@=\"\$(which lazbuild) --lazarusdir=$srcdir/lazarus\"@" -i build.sh
    sed -e '/doublecmd.zdli/d' -i install/linux/install.sh
}

build() {
    cd "$srcdir"

    cp -a "$_pkgbase-$pkgver" "$_pkgbase-gtk2"

    # build gtk2
    cd "$srcdir/$_pkgbase-gtk2"
    ./build.sh components gtk2
    ./build.sh plugins gtk2
    ./build.sh doublecmd gtk2
}

package() {
    cd "$srcdir/$_pkgbase-gtk2"
    ./install/linux/install.sh --install-prefix="$pkgdir"

    # install.sh only puts license texts under /usr/share/doublecmd/doc, which
    # namcap does not accept for the non-standard identifiers in license=().
    local _licdir="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE.md                                "$_licdir/LICENSE.md"
    install -Dm644 components/kascrypt/Docs/MIT_license.txt  "$_licdir/MIT.txt"
    install -Dm644 components/kascrypt/Hashes/Private/COPYING.txt "$_licdir/Zlib.txt"
    install -Dm644 components/Image32/LICENSE.txt            "$_licdir/BSL-1.0.txt"
    install -Dm644 components/gifview/LICENSE.txt            "$_licdir/MPL-2.0.txt"
    install -Dm644 components/chsdet/Licence.txt             "$_licdir/LGPL-2.1.txt"
}
