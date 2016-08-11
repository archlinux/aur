# -*- shell-script -*-
# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=mulet-nightly-bin
pkgver=51.0a1@20160808224700
pkgrel=1
pkgdesc="A customized version of Firefox designed for testing B2G OS"
arch=('i686' 'x86_64')
url="https://wiki.mozilla.org/Mulet"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'mime-types' 'dbus-glib' 'alsa-lib')
makedepends=('curl')
optdepends=()
source=()
md5sums=()

pkgver() {
    _version=$(sed -n 's/^Version=\(.*\)$/\1/p' $srcdir/firefox/application.ini)
    _buildid=$(sed -n 's/^BuildID=\(.*\)$/\1/p' $srcdir/firefox/application.ini)


    echo "$_version@$_buildid"
}

prepare() {
    cd $srcdir

    _taskid=$(curl "https://index.taskcluster.net/v1/task/gecko.v1.mozilla-central.latest.linux.mulet.opt" | sed -n 's/^.*"taskId":\s*"\(.*\)".*$/\1/p')
    _file="mulet-$_taskid.tar.bz2"
    if [ ! -f $_file ]; then
        curl -L -o $_file "https://queue.taskcluster.net/v1/task/$_taskid/artifacts/public/build/target.tar.bz2"
    fi

    tar -jxf $_file
}

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    cp -rp "$srcdir/firefox" "$pkgdir/opt/mulet-nightly-bin"
    ln -s "/opt/mulet-nightly-bin/firefox" "$pkgdir/usr/bin/mulet"
}
