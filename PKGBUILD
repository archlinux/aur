# Maintainer: Jason Stryker < inbox at jasonstryker dot com >
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>

_gopkgname='github.com/WedgeServer/wedge'

pkgname=wedge
pkgver=0.10.9
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS, forked from Caddy to remove sponsored headers.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/WedgeServer/wedge'
license=('Apache')
backup=('etc/wedge/wedge.conf')
install='wedge.install'
makedepends=('go>=1.8.1' 'git')

source=("https://$_gopkgname/archive/v$pkgver-w.tar.gz"
        'wedge.service'
        'wedge.tmpfiles'
        'wedge.conf')
sha256sums=('4d0bfd8ad261b394b834533a092e88412333f6ff0083140637c0ce2bc1d2c268'
            '342ce058f32619d8f1b56a13882d510e9dc7a92bd985e1e48ff01060123f0264'
            '451c923df576005248e0a6728a9aa1b3aea862d46890e61994ab36278f297b03'
            'fd0ab44d2bc43faf80f2e3b35a59fabfa607bf39659c5a821c45c00588e16c83')

prepare() {
    export GOPATH="$srcdir/build"
    rm -rf "$GOPATH/src/$gopkgname"
    mkdir --parents `dirname "$GOPATH/src/$_gopkgname"`
    mv -Tv "$srcdir/$pkgname-$pkgver-w" "$GOPATH/src/$_gopkgname"
}

build() {
    export GOPATH="$srcdir/build"
    go build -v -o $srcdir/wedge -ldflags "-X $_gopkgname/caddy/caddymain.gitTag=v$pkgver" $_gopkgname/caddy
}

package() {
    install -D -m 0755 wedge "$pkgdir/usr/bin/wedge"
    install -D -m 0644 wedge.service "$pkgdir/usr/lib/systemd/system/wedge.service"
    install -D -m 0644 wedge.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/wedge.conf"
    install -D -m 0644 wedge.conf "$pkgdir/etc/wedge/wedge.conf"
    install -d -m 0755 "$pkgdir/etc/wedge/wedge.conf.d"
}
