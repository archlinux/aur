# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>
# Contributor: Daniel Menelkir <menelkir@gmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh
pkgver=59.c
pkgrel=9
pkgdesc='MirBSD Korn Shell'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('x86_64')
depends=('glibc')
makedepends=('git')
checkdepends=('ed')
install=mksh.install
source=("$pkgname::git+https://github.com/MirBSD/mksh.git#tag=mksh-R${pkgver//./}"
        'no-ctty.patch')
sha256sums=('SKIP'
            'ded3a8a3628fd5a1c7e2eed62dfe35114aafe580077a4f6f766729714c7525b5')

check() {
    cd "$pkgname"

    PERL=/usr/bin/perl ./test.sh
}

prepare() {
    cd "$pkgname"

    sed -i 's/fgrep/grep -F/g' check.t

    if ! tty > /dev/null; then
        patch -Nsp1 -i "$srcdir/no-ctty.patch"
    fi
}

build() {
    cd "$pkgname"

    sh Build.sh -r
}

package() {
    cd "$pkgname"

    install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
    install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
    install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"

    mkdir -p "$pkgdir/usr/share/licenses/mksh/"
    sed -n '/Copyright/,/\*\//p' main.c > "$pkgdir/usr/share/licenses/mksh/LICENSE"
}
