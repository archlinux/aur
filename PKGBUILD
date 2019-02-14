# Maintainer: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch
_gourl=cwtch.im/$_pkgname
pkgname=$_pkgname-git
pkgver=r339.d15585e
pkgrel=1
pkgdesc="Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications"
arch=('x86_64' 'i686')
url="https://cwtch.im/"
license=('MIT')
depends=('tor')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
#options=('!strip' '!emptydirs')
source=("cwtch-server.service" "cwtch.sysusers" "cwtch.tmpfiles")
sha256sums=('b1c4ad9738f517317e1b5a373590469575dcc10044ece1ce551e483498d66caa'
            'beab74c0441b6532c1f4b7365038f595372f7e7a3a4b3587d36a3cb9dc8605fb'
            '399bacb458e108df49dda328258ba0653506393cef465dd794efa3b371fba902')

prepare() {
    export GOPATH="$srcdir/go"
    mkdir -p "$GOPATH"

    # "Fails" because no $project/main.go exists
    # https://go-review.googlesource.com/c/vgo/+/120995
    go get -u -v -d "$_gourl" || true

    project="$GOPATH/src/$_gourl"

    cd "$project/app/cli"
    go fix
    go get -fix -u -v

    cd "$project/server/app"
    go fix
    go get -fix -u -v
}

pkgver() {
    export GOPATH="$srcdir/go"
    project="$GOPATH/src/$_gourl"
    cd "$project"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    export GOPATH="$srcdir/go"
    project="$GOPATH/src/$_gourl"

    cd "$project/app/cli"
    go build -v -ldflags "-s -w"

    cd "$project/server/app"
    go build -v -ldflags "-s -w"
}

check() {
    export GOPATH="$srcdir/go"
    project="$GOPATH/src/$_gourl"

    cd "$project"
    bash "testing/tests.sh"
}

package() {
    export GOPATH="$srcdir/go"
    project="$GOPATH/src/$_gourl"

    install -Dm0755 "$GOPATH/bin/cli" "$pkgdir/usr/bin/$_pkgname-cli"
    install -Dm0755 "$GOPATH/bin/app" "$pkgdir/usr/bin/$_pkgname-server"
    install -Dm0644 "$srcdir/$_pkgname-server.service" \
                    "$pkgdir/usr/lib/systemd/system/$_pkgname-server.service"
    install -Dm0644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    # Create /var/lib/cwtch/ owned by cwtch user
    install -Dm0644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm0644 "$project/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: set ts=4 sw=4 tw=79 et :
