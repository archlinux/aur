# $Id: PKGBUILD 204582 2017-01-03 04:27:30Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>

_pkgname=rclone
pkgname="${_pkgname}-git"
pkgver=v1.35.r131.g12aa03f
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage"
arch=('i686' 'x86_64')
url="http://rclone.org/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'python2' 'pandoc' 'go')
source=("${_pkgname}::git+https://github.com/ncw/${_pkgname}.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

prepare() {
    cd ${_pkgname}

    sed -i "1s/python$/&2/" bin/make_manual.py

    mkdir -p .gopath/src/github.com/ncw
    ln -sf "$PWD" .gopath/src/github.com/ncw/${_pkgname}
    export GOPATH="$PWD/.gopath"

    go get github.com/go-ini/ini github.com/jmespath/go-jmespath
    go get github.com/ncw/${_pkgname}
}

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}

    go build # -gccgoflags "$CFLAGS $LDFLAGS"
    PATH="$GOPATH/bin:$PATH" make doc
}

check() {
    cd ${_pkgname}

    mkdir -p "$GOPATH/src/_/build/${_pkgname}/src"
    ln -s "$srcdir/${_pkgname}" "$GOPATH/src/_/build/${_pkgname}/src/${_pkgname}"
    make test || warning "Tests failed"
}

package() {
    cd ${_pkgname}
    make DESTDIR="$pkgdir" install

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -Dm644 ${_pkgname}.1 "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 MANUAL.html MANUAL.txt
}
