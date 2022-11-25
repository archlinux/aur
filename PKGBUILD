# Maintainer: valoq <valoq@mailbox.org>

pkgname=zypak
pkgver=v2022.04
pkgrel=1
_commit='55a60d110301e8dd37b631503c3524ab7baaf7aa'
pkgdesc="Redirect natively sandboxed applications to use a custom sandbox environment"
arch=('x86_64')
url="https://github.com/refi64/zypak"
license=('BSD')
depends=('systemd' 'dbus')
makedepends=()
provides=('zypak')
source=("$pkgname-$pkgver::git+https://github.com/refi64/zypak")

## using git commit hash
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    git checkout ${_commit}
    git submodule init 
    git submodule update --init --recursive

}

build() {
    cd "$pkgname-$pkgver"
    ## upstreams configure does not do anything yet
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/usr/" FLATPAK_DEST="$pkgdir/usr/" install
    cd $pkgdir/usr/bin/
    ln -sf zypak-wrapper.sh zypak-wrapper
}
