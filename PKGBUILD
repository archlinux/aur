# Maintainer: Martin Weinelt <martin@darmstadt.freifunk.net>

# things can get a little crashy at times, so better have debug symbols handy
# OPTIONS+=(debug !strip)

pkgname=tinc-pre-git
pkgver=1.1pre12
pkgrel=1
pkgdesc="Virtual Private Network daemon (prerelease)"
arch=('any')
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo2' 'openssl')
optdepends=('python2' 'wxpython: gui support')
provides=('tinc-pre')
conflicts=('tinc' 'tinc-pre' 'tinc-pre-systemd')
source=('git+https://github.com/gsliepen/tinc#branch=1.1')
_gitname=tinc

pkgver() {
    cd "$_gitname"
    git describe --tags | sed 's/-/./g' | cut -d'.' -f2-
}

build() {
    cd "$_gitname"
    autoreconf -fsi
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/tinc/bash_completion.d/tinc" -t "$pkgdir/usr/share/bash-completion/completions/"
    install -Dm644 "$srcdir/tinc/systemd/tinc.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "$srcdir/tinc/systemd/tinc@.service" -t "$pkgdir/usr/lib/systemd/system/"

}

md5sums=('SKIP')
