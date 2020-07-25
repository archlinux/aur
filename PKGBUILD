# Maintainer: Code Monad <code@lab-11.org>

pkgname=geph-client-patched
_pkgname=geph-client
pkgver=r215.fcc2ff5
pkgrel=1
pkgdesc='A command-line Geph client with external bypass filter patch'
arch=('x86_64')
url="https://github.com/code-monad/geph2"
license=('GPL3')
groups=('geph2')
depends=('glibc')
makedepends=('go-pie' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "geph-client.service")
sha512sums=('SKIP'
            '9d891f84b424d0ff534b0af23f5e3d8d40934a6b1dba400e4e1ea77acc20e9e0f6b0884d8782399be8ba821fdd5f832091c47c17100add60e52f92d187d3e88b')


pkgver() {
    cd "$srcdir/geph2/"
    git checkout origin/pacs
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/geph2/cmd/$_pkgname"
    go build
}

package() {
    install -Dm 755 "$srcdir/geph2/cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -d "$pkgdir/etc/geph2"
    "$pkgdir/usr/bin/$_pkgname" -dumpflags > "$pkgdir/etc/geph2/$_pkgname.ini"
    
    install -Dm 775 "$srcdir/geph2/cmd/$_pkgname/example/list.ini" "$pkgdir/etc/geph2/external-list.ini"
    install -Dm 644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    sed 's/geph-client.ini/%i.ini/' "$srcdir/$_pkgname.service" -i
    install -Dm 644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}
sha512sums=('SKIP'
            '18bc351bd7391fe99bf40f73028d321d63bad481775239672734299ac22b6714db042e4bc7b7755faf4ef40dd6bbd1b8b12961549c8702c127c2b709ec04bf6d')
