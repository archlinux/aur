pkgname="unblockneteasemusic-golang-git"
pkgver=0.2.13.r16.g92b59c9
pkgrel=1
pkgdesc="Revive unavailable songs for Netease Cloud Music (Golang)"
arch=("x86_64")
url="https://github.com/cnsilvan/UnblockNeteaseMusic"
license=("GPL")
depends=("openssl")
makedepends=("git" "go")
source=(
    "git+$url.git"
    "UnblockNeteaseMusic.service"
    "UnblockNeteaseMusic-ensure-keys"
    "UnblockNeteaseMusic.hook"
    "UnblockNeteaseMusic-post-install"
    "UnblockNeteaseMusic.tmpfiles"
)
sha256sums=('SKIP'
            'a08261e75c01af4a99fbab13a4c511b0424e589b7598069993621d7b128e3897'
            '3c62339a361583ba87d29cd07bdef4eb630b40450714da1a79bb97d42a599fbf'
            'e378e61dab90b8fecd87edfaf0140fc2dc2e139b2185960faaf8d9cfc1bff981'
            '0c5dda43b23ad79cbf8bcf7e4bd8fd9b033d24b3e2f00cda498881431afa35c3'
            '5818b2fec2979571b88083ba515d62c2c755ae3bfab1b898e59d614fe5486042')
conflicts=("unblockneteasemusic-golang")
provides=("unblockneteasemusic-golang")

pkgver(){
    cd "$srcdir/UnblockNeteaseMusic"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "$srcdir/UnblockNeteaseMusic"
    version_info=github.com/cnsilvan/UnblockNeteaseMusic/version
    go build -ldflags \
        "-X '$version_info.Version=${pkgver%%.r*}' \
         -X '$version_info.BuildTime=$(date "+%Y-%m-%d %H:%M:%S")' \
         -X '$version_info.GoVersion=$(go version)' \
         -X '$version_info.GitCommit=${pkgver#*.g*}' \
         -w -s" -o UnblockNeteaseMusic
}
package(){
    cd "$srcdir/UnblockNeteaseMusic"
    install -Dm755 UnblockNeteaseMusic "$pkgdir/usr/bin/UnblockNeteaseMusic"
    install -Dm755 "$srcdir/UnblockNeteaseMusic-ensure-keys" "$pkgdir/usr/bin/UnblockNeteaseMusic-ensure-keys"
    install -Dm755 "$srcdir/UnblockNeteaseMusic-post-install" "$pkgdir/usr/share/libalpm/scripts/UnblockNeteaseMusic-post-install"
    install -Dm644 "$srcdir/UnblockNeteaseMusic.service" "$pkgdir/usr/lib/systemd/system/UnblockNeteaseMusic.service"
    install -Dm644 "$srcdir/UnblockNeteaseMusic.hook" "$pkgdir/usr/share/libalpm/hooks/UnblockNeteaseMusic.hook"
    install -Dm644 "$srcdir/UnblockNeteaseMusic.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/UnblockNeteaseMusic.conf"
}
