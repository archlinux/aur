# Maintainer: John Beard <john dot j dot beard at gmail dot com>
# Author: Jonathan Lebon

pkgname=firefox-extension-textern-native-git
pkgver=0.7.r6.g5e10500
pkgrel=1
url="https://github.com/jlebon/textern"
license=('GPL')
pkgdesc='Native component of Textern Firefox extension'
arch=('any')
source=("git+https://github.com/jlebon/textern"
        "git+https://github.com/chrisjbillington/inotify_simple")
depends=('python' 'firefox')
makedepends=('git')
md5sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/textern"

    git submodule init
    git config submodule.native/inotify_simple.url "$srcdir/inotify_simple"
    git -c protocol.file.allow=always submodule update

    # fix lib64/lib issue
    sed 's/lib64/lib/g' -i Makefile
}

package() {
    cd "$srcdir/textern"

    make LIBEXEC="/usr/lib" DESTDIR="$pkgdir" native-install

    # correct the json file - refers to pkgbuild dir, should be installed dir
    sed -i -e "s|$pkgdir||g" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/textern.json"
}

pkgver() {
    cd "$srcdir/textern"
    git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

