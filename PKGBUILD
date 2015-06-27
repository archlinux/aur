# Maintainer: Enjolras <0enjolras0@laposte.net>
# Maintainer: Vincent B. <vb@luminar.eu.org>

pkgname=seeks-git
pkgver=r2033.1168b3a
pkgrel=1
pkgdesc="A social decentralized internet overlay for collaborative searches"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/beniz/seeks"
license=('AGPL3' 'LGPL' 'BSD')
groups=()
depends=('curl' 'libevent>=2.0' 'libxml2' 'opencv' 'protobuf' 'icu' 'tokyotyrant' 'tokyocabinet')
makedepends=('pkg-config' 'docbook-xml' 'docbook2x')
checkdepends=()
conflicts=('seeks')
backup=()
install=seeks.install
source=("$pkgname"::'git+git://github.com/beniz/seeks'
        'seeks.conf.d'
	'seeks.rc.d'
	'conf.patch'
	'seeks.logrotate')
sha1sums=(
        'SKIP'
        'ea881740b7a216db6d9a18b674d33dc3c04c79e1'
        '67bface679402b9f75fd0c30062237bdc88083a5'
        'bd8992bb30db818610760a5b7314210284b989a9'
        '28e156c5d1a4b45c54309b084d04556b84817053')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh

    # linking issue with --as-needed linker flag
    LDFLAGS="-Wl,--no-as-needed" ./configure --prefix=/usr --sysconfdir=/etc --enable-httpserv-plugin --enable-extended-host-patterns
    sed -i s/,--as-needed,/,/ config.status
    make
}

check() {
    cd "$srcdir/$pkgname"
    make -k check-local
}

package() {
    cd "$srcdir/$pkgname"

    # Patch config file to make seeks log in /var/log instead of ./ (needed for rc.d)
    patch -p1 < "$srcdir/conf.patch"
    make DESTDIR="$pkgdir/" install

    install -D -m644 Licenses  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ../seeks.conf.d "${pkgdir}/etc/conf.d/seeks"
    install -D -m755 ../seeks.rc.d "${pkgdir}/etc/rc.d/seeks"
    install -D -m600 ../seeks.logrotate  "${pkgdir}/etc/logrotate.d/seeks"
    install -d -m755  "${pkgdir}/var/log/seeks"
    install -d -m755  "${pkgdir}/var/lib/seeks"
}

# vim:set ts=2 sw=2 et:
