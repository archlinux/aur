# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=linx-server-git
_srcname=${pkgname%-git}
pkgver=2.3.8.r107.g084ac23
pkgrel=1
pkgdesc="Self-hosted file/code/media sharing website."
arch=('x86_64')
url="https://github.com/ZizzyDizzyMC/linx-server"
license=('GPL3')
makedepends=('go' 'go.rice' 'git')
provides=('linx-server')
conflicts=('linx-server')
backup=('etc/linx-server.conf')
source=("git+https://github.com/ZizzyDizzyMC/linx-server.git"
        linx-server.{service,sysusers,tmpfiles}
        linx-cleanup.{service,timer})
sha256sums=('SKIP'
            '7a368d45d94141b1b37b726616d12c67eec166f10d70519de10665f31fc8ddca'
            '9286814c8958d152727ad72eaa6c547c26749d8c028b31f352602956354672b7'
            '37aa12795f2e2481d3d2092001c813351552d70c27451cfa8e07a20d8be230b3'
            'b891ce7334903fdcb7d6a5b575cd9316b5d6525a2b1f2cbb985cc63c3830313f'
            '04779bd3a81b49417f95558542135548e836cf5eb36bd14952fb58f95920b1f4')

pkgver() {
    cd "$_srcname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$_srcname"
    mkdir bin
    rice embed-go
    go build -o bin/linx-server

    for cmd in linx-{cleanup,genkey}
    do
        go build -o "bin/$cmd" "./$cmd"
    done
}

package() {
    cd "$_srcname"
    install -Dt "$pkgdir/usr/bin" -m755 bin/linx-{server,cleanup,genkey}
    install -Dm640 linx-server.conf.example "$pkgdir/etc/linx-server.conf"

    cd ..
    install -dm750 "$pkgdir"/var/lib/linx-server
    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 linx-server.service linx-cleanup.{service,timer}
    install -Dm644 linx-server.sysusers "$pkgdir/usr/lib/sysusers.d/linx-server.conf"
    install -Dm644 linx-server.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/linx-server.conf"
}
