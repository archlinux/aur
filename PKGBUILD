pkgname=caddy
pkgver=0.9.3
pkgrel=5
pkgdesc='A configurable, general-purpose HTTP/2 web server for any platform'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
install='caddy.install'
makedepends=('go>=1.6' 'git')
conflicts=('caddy-all-features' 'caddy-git' 'caddy-full-bin')

gopkgname='github.com/mholt/caddy'
source=("git+https://github.com/mholt/caddy")
md5sums=('SKIP')

prepare() {
    cd $srcdir
    export GOPATH="$srcdir/build"
    rm -rf "$GOPATH/src/$gopkgname"
    mkdir -p "$GOPATH/src/$gopkgname"
    mv -Tv "$srcdir/caddy" "$GOPATH/src/$gopkgname"
    echo 'download dependencies'
    go get -d $gopkgname/...
}

build() {
    export GOPATH="$srcdir/build"
    cd $srcdir/build/src/$gopkgname/caddy
    echo 'compile'
    bash build.bash
}

package() {
    builddir="$srcdir/build/src/github.com/mholt/caddy"
    install -Dm755 "$builddir/caddy/caddy" "${pkgdir}/usr/local/bin/caddy"
    install -Dm644 "$builddir/dist/init/linux-systemd/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
