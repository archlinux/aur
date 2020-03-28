# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-gen-git
_pkgname=${pkgname/-git}
pkgver=1170.git.c1a9db8
pkgrel=1
pkgdesc="A mod of OpenRA based on Command & Conquer: Generals"
arch=('any')
url="https://github.com/MustaphaTR/Generals-Alpha"
license=('GPL3')
install=${_pkgname}.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=("${_pkgname}")
options=(!strip)
source=("git+${url}.git"
# The following file needs to be downloaded manually from
# Maxmind, see https://dev.maxmind.com/geoip/geoip2/geolite2/
# for details
"local://GeoLite2-Country.mmdb.gz"
"fetch-engine.patch"
"Makefile.patch"
"${_pkgname}"
"${_pkgname}.appdata.xml"
"${_pkgname}.desktop")
md5sums=('SKIP'
         'efb8c043dfa095146f373fec367aef64'
         '711019044fbb1c1e3aa5edc58b54343d'
         'feae017ba5765215cd151a892362e6b1'
         '8974b3935a56e8fd957ee5dc9404595c'
         'd3c7476b79a6b07522e597f05eaa8ae7'
         '40267bdbbcde926b3524e99cce966592')

pkgver() {
    cd $srcdir/Generals-Alpha
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Generals-Alpha
    dos2unix *.md
    patch -Np1 -i $srcdir/fetch-engine.patch
}

build() {
    cd $srcdir/Generals-Alpha
    make version VERSION="${pkgver}"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at ${url}/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/Generals-Alpha
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/${_pkgname}
    cp $srcdir/GeoLite2-Country.mmdb.gz $pkgdir/usr/lib/${_pkgname}
    cp -r generals-alpha-engine/{glsl,lua,AUTHORS,COPYING,*.dll*,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/${_pkgname}
    cp -r mods/gen $pkgdir/usr/lib/${_pkgname}/mods
    cp -r generals-alpha-engine/mods/{common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    cp -r $srcdir/${_pkgname}.appdata.xml $pkgdir/usr/share/appdata/${_pkgname}.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    install -Dm644 mods/gen/icon.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
    for i in 16x16 32x32 48x48 64x64 128x128 256x256
    do
         install -Dm644 packaging/linux/mod_$i.png ${pkgdir}/usr/share/icons/hicolor/$i/apps/${_pkgname}.png
    done
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
