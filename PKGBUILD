# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.14.5
pkgrel=3
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=('i686' 'x86_64')
url='https://mdocml.bsd.lv/'
license=('custom: ISC')
depends=('zlib')
provides=('man')
conflicts=('man')
source=("https://mdocml.bsd.lv/snapshots/$pkgname-$pkgver.tar.gz"
        'configure.local'
        'mandoc.service'
        'mandoc.timer'
        'fix-tbl-segfault.patch')
sha256sums=('8219b42cb56fc07b2aa660574e6211ac38eefdbf21f41b698d3348793ba5d8f7'
            '383772d5dd7c51319588ac4b63d4e7c452490568f6a3e905d118fdd6c4aa8a68'
            '2091411d5f87a3c371a5ba74b4773d1e454046446fa2cb045485979e52419bb6'
            '74d6a02b97a17fffddcc0a3dc830e811348b1f6c6b84f867882c776d50f00ea4'
            '12e6138be6ec2e8a34373876d8a5fce387a1d2b51a461ae20e1d98637af1d15c')

prepare() {
    cd "$pkgname-$pkgver"
    cp "$srcdir"/configure.local .

    # fix configure script - see https://aur.archlinux.org/packages/mandoc/#comment-739085
    sed -i -e 's/^CC=.*/CC=cc/' ./configure
    # apply CFLAGS and LDFLAGS from makepkg.conf
    sed -i -e "s/^CFLAGS=.*/CFLAGS=\"$CFLAGS\"/" ./configure
    sed -i -e "s/^LDFLAGS=.*/LDFLAGS=\"$LDFLAGS\"/" ./configure

    # fix segfault when formatting tables on some man pages
    patch -Np0 -i ../fix-tbl-segfault.patch

    # remove useless duplicate global variables
    sed -i -e '/^int dummy;$/d' ./compat_*.c
}

build() {
    cd "$pkgname-$pkgver"
    ./configure
    make
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" make install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 "$srcdir"/mandoc.timer "$pkgdir"/usr/lib/systemd/system/mandoc.timer
    install -Dm644 "$srcdir"/mandoc.service "$pkgdir"/usr/lib/systemd/system/mandoc.service
    install -dm755 "$pkgdir"/usr/lib/systemd/system/multi-user.target.wants
    ln -s ../mandoc.timer "$pkgdir"/usr/lib/systemd/system/multi-user.target.wants/mandoc.timer
}
