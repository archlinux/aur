# Maintainer: jakob <grandchild@gmx.net>

pkgname=ninjam-server-git
_srcpkgname=ninjam
pkgver=0.080.r344.44c21b9
pkgrel=1
pkgdesc='Make real music together via the Internet.'
arch=('i686' 'x86_64')
url='https://www.cockos.com/ninjam/'
license=('GPL')
depends=()
makedepends=()
provides=(ninjam-server)
conflicts=(ninjam-server)
source=(
    'git+https://github.com/justinfrankel/ninjam.git'
    'ninjam-server.service'
    'ninjam-server.sysusers'
    'ninjam-server.tmpfiles'
)
sha256sums=(
    'SKIP'
    '848d991ab17df459e960246d12f29a6e6599444bf671ca1e63c69a1cb0b75e3f'
    'b80b2c57471a2de0ce980cbd3195f929904abc8f248c7c3c6299f2415566a708'
    'f354185c5b615cd8a1493506d762e0f0efc7e29b5d4497ae89db194e52343321'
)
backup=('etc/ninjam.cfg')

pkgver() {
    cd "$srcdir/$_srcpkgname/ninjam/server/"
    last_version_commit=$(
        git blame ninjamsrv.cpp | grep "#define VERSION" | cut -d ' ' -f 1
    )
    last_version=$(
        sed -nr '/#define VERSION/s/#define VERSION "v(.+)"$/\1/p' ninjamsrv.cpp
    )
    printf "%s.r%s.%s" \
        "$last_version" \
        "$(git rev-list --count $last_version_commit..HEAD)" \
        ${last_version_commit:0:7}
}

build() {
    cd "$srcdir/$_srcpkgname/ninjam/server/"
    make
}

package() {
    cd "$srcdir/$_srcpkgname/ninjam/server/"
    # application
    install -Dm755 ninjamsrv "$pkgdir/usr/bin/ninjamsrv"
    install -Dm644 example.cfg "$pkgdir/etc/ninjam.cfg"
    install -Dm644 "cclicense.txt" "$pkgdir/usr/share/ninjam/cclicense.txt"
    # users, dirs & services
    install -Dm644 "$srcdir/ninjam-server.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/ninjam-server.conf"
    install -Dm644 "$srcdir/ninjam-server.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/ninjam-server.conf"
    install -Dm644 "$srcdir/ninjam-server.service" \
        "$pkgdir/usr/lib/systemd/system/ninjam-server.service"
    # edit paths in config
    sed -i "s:# LogFile ninjamserver.log:LogFile /var/log/ninjam/ninjam-server.log: ;\
            s:SessionArchive \\.:SessionArchive /var/log/ninjam/: ;\
            s:ServerLicense cclicense\\.txt:ServerLicense /usr/share/ninjam/cclicense.txt:" \
        "$pkgdir/etc/ninjam.cfg"
}
