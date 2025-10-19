pkgname=thinkpad_utils-git
pkgver=r6.063014b
pkgrel=1
pkgdesc="Auto-save/restore ThinkPad keyboard backlight with lid detection"
arch=('x86_64' 'aarch64')
url="https://git.teto.party/pkgs/thinkpad_utils"
license=('BSD')
depends=()
makedepends=('git' 'gcc')
provides=('thinkpad_utils')
conflicts=('thinkpad_utils')
source=("git+https://git.teto.party/pkgs/thinkpad_utils.git"
        config.h)
md5sums=('SKIP' 'SKIP')
options=('!strip' '!emptydirs')

pkgver() {
    cd "$srcdir/thinkpad_utils"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/thinkpad_utils"
    if [[ -f "$srcdir/config.h" ]]; then
      cp -fv "$srcdir/config.h" $srcdir/thinkpad_utils/config.h
    fi
}

build() {
    cd "$srcdir/thinkpad_utils"
    cc -O3 -march=native -mtune=native -flto -s -std=c99 -o thinkpad_utils thinkpad_utils.c
}

package() {
    cd "$srcdir/thinkpad_utils"
    
    install -Dm755 thinkpad_utils "$pkgdir/usr/bin/thinkpad_utils"
    install -Dm644 thinkpad_utils.service "$pkgdir/usr/lib/systemd/system/thinkpad_utils.service"
    install -Dm755 thinkpad_utils.rc "$pkgdir/etc/init.d/thinkpad_utils"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -dm755 "$pkgdir/var/lib/thinkpad_utils"
}
