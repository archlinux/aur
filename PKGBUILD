# Maintainer: Jasper den Ouden o.jasper@gmail.com

pkgname=knockoff-git
pkgrel=1
pkgdesc="Port knocking program sha256 on date&secret-based port sequences and other."
arch=('any')
url="https://git.sr.ht/~jasper/knockoff"
license=('GPLv2')
# changelog=.CHANGELOG # TODO this option?
depends=('libpcap' 'lua' 'curl')
makedepends=('gcc' 'make')
source=("git+https://git.sr.ht/~jasper/knockoff/")
sha512sums=('SKIP')

pkgver=git
    #cd $srcdir/knockoff
    #echo -n git:
    #git rev-list master |head -n 1

build() {
    cd "$srcdir/knockoff"
    make
}

package() {
    cd "$srcdir/knockoff"
    install -Dm755 knockoff "$pkgdir/usr/bin/knockoff"
    SHARE=$pkgdir/usr/share/knockoff/
    for name in include inbuild; do  # Inbuild lua.
        install -D src/$name.lua $SHARE/$name.lua
    done
    # Library lua.
    for name in enhex sha2 numbergen knockoff/help knockoff/version; do
        install -D src/etc/lib/$name.lua "$SHARE/etc/lib/$name.lua"
    done
    for name in simple split sha2; do  # Sequences.
        install -D src/etc/seqs/$name.lua "$SHARE/etc/seqs/$name.lua"
    done
    for name in simple simple_choose sha2 sha2_rotate; do  # Examples
        install -D src/etc/examples/$name.lua "$pkgdir/etc/knockoff/examples/$name.lua"
    done
    install -D README.md $pkgdir/usr/share/doc/knockoff/README.md
    for name in configuration sequence_generators alternatives; do
        install -D doc/$name.md $pkgdir/usr/share/doc/knockoff/$name.md
    done

    install -D doc/knocker.html $pkgdir/usr/share/doc/knockoff

    # Systemd service file for server. (for the interested)
    install -D other/knockoffd@.service "$pkgdir/usr/lib/systemd/knockoffd@.service"
}
