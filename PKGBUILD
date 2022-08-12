# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

#_branch=maint-0.4.6 # stable
#_malloc=jemalloc # tcmalloc

pkgname=tor-git
pkgver=0.4.7.10.r93.g982c504
pkgrel=1
pkgdesc="An anonymizing overlay network (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.torproject.org"
license=('BSD')
conflicts=('tor')
provides=('tor')
backup=('etc/tor/torrc'
        'etc/tor/torrc.d/nodes.conf'
        'etc/tor/torrc.d/bridge.conf'
        'etc/tor/torrc.d/isolation.conf'
        'etc/tor/torrc.d/transparent_proxy.conf')

depends=('openssl' 'libevent' 'libseccomp' 'zstd' 'xz')
makedepends=('asciidoc')
checkdepends=('python')
optdepends=('torsocks: allow transparent SOCKS proxying'
            'obfs4proxy: obfuscating pluggable transport proxy'
            'meek: obfuscating pluggable transport proxy')

[[ $_malloc = 'jemalloc' ]] && depends+=('jemalloc')
[[ $_malloc = 'tcmalloc' ]] && depends+=('gperftools')

source=("git+https://git.torproject.org/tor.git#branch=${_branch:-main}"
        {nodes,bridge,transparent_proxy,isolation}.conf
        'torrc' 'tor.logrotate' 'tor.service' 'tor.tmpfiles' 'tor.sysusers')

sha256sums=('SKIP'
            '72ed5d90c54d9d5354af0d9fc7eb1412c548cc308868b85a99278abe8ccbf145'
            '90a588c3c2dc7826172341453f76739e8f48df7b0c858adebd12e97f047bde26'
            '7fbb63e9411eee2176964449a3d6809d16e1120152c6ff201ecea1d1f97f102b'
            '748b7264b49b12d5252d688b8859820046413938c5fde91578da0d5b95594c2e'
            '1f32a363443437a08d133494732008b98a9dc520173a97d53ce832edfb923f7b'
            'd447227fcc2756778a1be143b8975d67b25ea15688cde2291185b3c71d0f6e34'
            '488525b2051cf0f216ac14c3ab1bc8531d308cedf92e64d147f7f11b6c58cf41'
            '06c00318d84ead3f939b267c7ae9e4cc1cd90c534d0b57ddd2595fee9065ee7f'
            '231405d1fbbcc68168248f93edd19ae14b60f66bb4d1c8e46ead1d4cd8e0ae7c')

pkgver () {
    cd tor
    git describe --long --tags --abbrev=7 "origin/${_branch:-main}" \
        |sed -e 's/tor.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd tor
    ./autogen.sh
}

build() {
    cd tor

    ./configure \
        --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-html-manual \
        --enable-systemd \
        --enable-zstd \
        --enable-lzma \
        --enable-pic \
        --with-malloc="${_malloc:-system}" #\
        #--disable-module-relay \
        #--disable-unittests
    make
}

check() {
    cd tor
    make check ||true
}

package() {
    cd tor
    make DESTDIR="$pkgdir" install

    rm -f "$pkgdir/etc/tor/tor-tsocks.conf"
    rm -f "$pkgdir/usr/bin/torify"

    install -dm755 "$pkgdir/etc/tor"
    install -dm750 "$pkgdir/etc/tor/torrc.d"

    install -Dm640 "$srcdir/torrc"                  "$pkgdir/etc/tor/torrc"
    install -Dm640 "$srcdir/nodes.conf"             "$pkgdir/etc/tor/torrc.d/nodes.conf"
    install -Dm640 "$srcdir/bridge.conf"            "$pkgdir/etc/tor/torrc.d/bridge.conf"
    install -Dm640 "$srcdir/isolation.conf"         "$pkgdir/etc/tor/torrc.d/isolation.conf"
    install -Dm640 "$srcdir/transparent_proxy.conf" "$pkgdir/etc/tor/torrc.d/transparent_proxy.conf"

    install -Dm644 "$srcdir/tor.logrotate" "$pkgdir/etc/logrotate.d/tor"
    install -Dm644 "$srcdir/tor.service"   "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers"  "$pkgdir/usr/lib/sysusers.d/tor.conf"
    install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/tor-git/LICENSE"
}
