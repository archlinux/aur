#maintainer: Lennart Martens monkeynator78@gmail.com
pkgname=coreusage-git
pkgver=V1.0.5.r0.gb23bd84
pkgrel=1
pkgdesc="Lightweight CPU core usage information tool written in C"
arch=('x86_64')
url="https://github.com/Lennart1978/coreusage"
license=('MIT')
depends=('lm_sensors')
makedepends=('git' 'gcc' 'make' 'lm_sensors')
provides=('coreusage')
conflicts=('coreusage')

source=("coreusage::git+https://github.com/Lennart1978/coreusage.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/coreusage"

    # Mit Tag → verwenden
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long \
        | sed 's/^v//; s/-/.r/; s/-/./'
    else
        # Ohne Tag → Fallback
        printf "0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/coreusage"
    make
}

package() {
    cd "$srcdir/coreusage"

    install -Dm755 coreusage "$pkgdir/usr/bin/coreusage"

    if [[ -f coreusage.1 ]]; then
        install -Dm644 coreusage.1 "$pkgdir/usr/share/man/man1/coreusage.1"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
