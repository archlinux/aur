# Maintainer: grayarcher
pkgname=leaguedisplays-git
pkgver=1.0.992.d3731c5
pkgrel=1
pkdesc="HD League of Legends related screensavers and wallpapers, direct to your GNU/Linux desktop."
arch=('x86_64')
url="https://gitlab.com/TheFrozenWatchers/LeagueDisplays"
license=('GPL3')
depends=('gtk2' 'libx11' 'xscreensaver')
makedepends=('git' 'wget' 'curl' 'gcc' 'clang' 'cmake' 'make' 'zip')
provides=('leaguedisplays-git')
conflicts=('leaguedisplays-git' 'leaguedisplays')
source=(git+https://gitlab.com/TheFrozenWatchers/LeagueDisplays.git/)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/LeagueDisplays"
    echo "1.0.992."$(git describe --always | sed 's/-/./g')
}

build() {
    cd "$srcdir/LeagueDisplays"

    msg "Starting build... (src=$srcdir)"

    ./prepare.sh

    make ${MAKEFLAGS} all
}

package() {
    mkdir -p $pkgdir/opt/leaguedisplays/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/applications/

    cp -r $srcdir/LeagueDisplays/bin/* $pkgdir/opt/leaguedisplays/

    echo "[Desktop Entry]" > $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Encoding=UTF-8" >> $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Type=Application" >> $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Terminal=false" >> $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Exec=/usr/bin/leaguedisplays  --ld-mode=cef-app" >> $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Name=League Displays" >> $pkgdir/usr/share/applications/leaguedisplays.desktop
    echo "Icon=/opt/leaguedisplays/icon.png" >> $pkgdir/usr/share/applications/leaguedisplays.desktop

    echo "cd /opt/leaguedisplays/ && ./leaguedisplays \$@" > $pkgdir/usr/bin/leaguedisplays
    chmod +x+x+x $pkgdir/usr/bin/leaguedisplays
}
