# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=telegram-cli-git
pkgver=r1357.3da0e4a
pkgrel=1
pkgdesc="Telegram messenger CLI"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/kenorb-contrib/tg"
license=('GPL2')
depends=('libconfig' 'libevent' 'lua' 'jansson' 'zlib')
makedepends=('git')
conflicts=('telegram-cli')
provides=('telegram-cli')

source=("$pkgname"::'git+https://github.com/kenorb-contrib/tg')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive --force
}

build() {
    cd "$srcdir/$pkgname"
    ./configure CFLAGS="-w" LDFLAGS="-Wl,--allow-multiple-definition"
    make
    gzip -f debian/telegram-cli.8
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 tg-server.pub ${pkgdir}/etc/telegram-cli/server.pub
    install -Dm755 bin/telegram-cli ${pkgdir}/usr/bin/telegram-cli
    install -Dm755 bin/telegram-cli ${pkgdir}/usr/bin/telegram-cli
    install -Dm644 debian/telegram-cli.8.gz ${pkgdir}/usr/share/man/man8/telegram-cli.8.gz 
}
