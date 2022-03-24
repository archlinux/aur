# Maintainer: Onur BÜBER <onurbuber@engineer.com>
# Developer: Ari Archer <ari.web.xyz@gmail.com>

pkgname=kos
pkgver=0.0.12
pkgrel=1
pkgdesc='A simple SUID tool written in C++'
arch=('x86_64')
url='https://github.com/TruncatedDinosour/kos'
license=('custom:ArAr2')
provides=('kos')
conflicts=('kos')
optdepends=('bash'
            'bash-completion')
_dir='/usr/share/bash-completion/completions'
depends=('libxcrypt')
makedepends=('clang'
             'pkgconf')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/TruncatedDinosour/kos/archive/refs/tags/v$pkgver.tar.gz"
    "kos.sysusers")
sha256sums=('19abe3807a7f810b1fb0a218415eec9bd2e99864a302dcd3204adb71741511c2'
    'c0517250baf3457b4429f24a370711b331945c5cdb23dc983fcd9daf7b73b05c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    clang++ \
        -std=c++11 \
        -Wall -Wextra -Wpedantic -Wshadow -Werror -pedantic \
        -march=native -pipe \
        ./src/main.cc -o "${DESTDIR}kos" $(pkg-config --cflags --libs libxcrypt)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm4755 -o root "$srcdir/$pkgname-$pkgver/kos" "$pkgdir/usr/bin/kos"
    install -Dm644 "${srcdir}"/kos.sysusers "${pkgdir}"/usr/lib/sysusers.d/kos.conf
    install -Dm644 "$srcdir/$pkgname-$pkgver/kos.1" "$pkgdir/usr/share/man/man1/kos.1"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/kos/LICENSE"

    if [ -d "$_dir" ]; then
        install -Dm644 "$srcdir/$pkgname-$pkgver/completions/kos.bash" "$pkgdir/usr/share/bash-completion/completions/kos"
    fi
}
