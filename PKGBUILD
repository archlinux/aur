# Maintainer: Onur BÜBER <onurbuber@engineer.com>
# Developer: Ari Archer <ari.web.xyz@gmail.com>

pkgname=kos
pkgver=0.0.37
pkgrel=2
pkgdesc='A simple SUID tool written in C++'
arch=('x86_64')
url='https://github.com/TruncatedDinosour/kos'
license=('GPL3')
provides=('kos')
conflicts=('kos')
optdepends=('bash'
            'bash-completion')
_bash_completions_dir='/usr/share/bash-completion/completions'
depends=('libxcrypt')
makedepends=('clang'
             'pkgconf')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/TruncatedDinosour/kos/archive/refs/tags/v$pkgver.tar.gz"
    "kos.sysusers")
sha256sums=('747d44cc259d1ba47e63d31d8ef55c5f9e5fac03b051f8186c4d3bfaeb728554'
    'c0517250baf3457b4429f24a370711b331945c5cdb23dc983fcd9daf7b73b05c')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    clang++ \
        -std=c++11 \
        -Wall -Wextra -Wpedantic -Wshadow -Werror -pedantic \
        -march=native -pipe -D_KOS_VERSION_="\"$pkgver\"" \
        ./src/main.cpp -o "${DESTDIR}kos" $(pkg-config --cflags --libs libxcrypt)
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 2

    install -Dm4755 -o root "$srcdir/$pkgname-$pkgver/kos" "$pkgdir/usr/bin/kos"
    install -Dm644 "${srcdir}"/kos.sysusers "${pkgdir}"/usr/lib/sysusers.d/kos.conf
    install -Dm644 "$srcdir/$pkgname-$pkgver/kos.1" "$pkgdir/usr/share/man/man1/kos.1"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/kos/LICENSE"

    [ -d "$_bash_completions_dir" ] && install -Dm644 "$srcdir/$pkgname-$pkgver/completions/kos.bash" "$pkgdir$_bash_completions_dir/kos"
}
