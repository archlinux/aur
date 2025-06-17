# vim:set ft=sh:
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2
_pkgname=doublecmd
pkgver=1.1.26
pkgrel=3
url="http://doublecmd.sourceforge.net/"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later' 'MIT' 'MPL-1.1' 'MPL-2.0' 'Apache-2.0' 'BSD-2-Clause' 'Zlib')
provides=("$_pkgname")
conflicts=('doublecmd-qt5' 'doublecmd-qt6')
makedepends=('lazarus' 'imagemagick' 'ffmpegthumbnailer')
optdepends=(
    'lua: scripting'
    'unzip: support extracting zip archives'
    'zip: suport packing zip archives'
    'p7zip: support for 7zip archives'
    'libunrar: support for rar archives'
    'imagemagick: preview xcf files'
    'ffmpegthumbnailer: preview video files'
    'mplayer: to make use of the wlxmplayer plugin'
)
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-src.tar.gz")
sha512sums=('dae0b72cdf63c945b81d0c0a7356a5cb574fa437edca3dc1242b94a916ef1f78bd825ece2c4f4fdebabade0a0bbf12f4164ba2c0cefbba4ed62689788921660f')

prepare() {
    cp -a /usr/lib/lazarus ./

    cd "$_pkgname-$pkgver"
    sed -e 's/LIB_SUFFIX=.*/LIB_SUFFIX=/g' -i install/linux/install.sh
    sed -e "s@=\$(which lazbuild)@=\"\$(which lazbuild) --lazarusdir=$srcdir/lazarus\"@" -i build.sh
    sed -e '/doublecmd.zdli/d' -i install/linux/install.sh
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cd "$srcdir"

    cp -a "$_pkgname-$pkgver" "$pkgname"

    # build gtk2
    cd "$srcdir/$pkgname"
    ./build.sh components gtk2
    ./build.sh plugins gtk2
    ./build.sh doublecmd gtk2
}

package_doublecmd-gtk2() {
    pkgdesc="twin-panel (commander-style) file manager (GTK)"
    depends=('desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info')
    conflicts=('doublecmd-qt6' 'doublecmd-qt5')
    cd "$srcdir/$pkgname"
    ./install/linux/install.sh --install-prefix="$pkgdir"
}
