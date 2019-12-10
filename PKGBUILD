# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

#_branch=maint-0.4.2 # stable
_with_rust=1
#_malloc=jemalloc # tcmalloc

pkgname=tor-git
pkgver=0.4.3.0.alpha.r793.g68a00c4
pkgrel=2
pkgdesc="An anonymizing overlay network (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.torproject.org"
license=('BSD')
conflicts=('tor')
provides=('tor')
backup=('etc/tor/torrc'
        'etc/tor/torrc.d/nodes'
        'etc/tor/torrc.d/bridge'
        'etc/tor/torrc.d/isolation'
        'etc/tor/torrc.d/transparent_proxy')

depends=('openssl>=1.1.1' 'libevent' 'libseccomp' 'zstd' 'xz')
makedepends=('asciidoc')
checkdepends=('python')
optdepends=('torsocks: allow transparent SOCKS proxying'
            'obfs4proxy: obfuscating pluggable transport proxy'
            'meek: obfuscating pluggable transport proxy')

[[ $_malloc = 'jemalloc' ]] && depends+=('jemalloc')
[[ $_malloc = 'tcmalloc' ]] && depends+=('gperftools')
[[ $_with_rust ]] && {
    makedepends+=('rust')
    _options="--enable-rust"
}

source=("git+https://git.torproject.org/tor.git#branch=${_branch:-master}"
        'torrc' 'nodes' 'bridge' 'transparent_proxy' 'isolation'
        'tor.logrotate' 'tor.service' 'tor.tmpfiles' 'tor.sysusers')

sha256sums=('SKIP'
            '3826ae9596371e5fc38829dfadb0064fdd7ac5218d81abb0b3bf6f1b6f72d6a9'
            '72ed5d90c54d9d5354af0d9fc7eb1412c548cc308868b85a99278abe8ccbf145'
            '90a588c3c2dc7826172341453f76739e8f48df7b0c858adebd12e97f047bde26'
            '7fbb63e9411eee2176964449a3d6809d16e1120152c6ff201ecea1d1f97f102b'
            '748b7264b49b12d5252d688b8859820046413938c5fde91578da0d5b95594c2e'
            'd447227fcc2756778a1be143b8975d67b25ea15688cde2291185b3c71d0f6e34'
            '96ed5b040c944fd99b15e8bdd25a7682a4e6d19c11f42c669c80aade088ec9dc'
            '06c00318d84ead3f939b267c7ae9e4cc1cd90c534d0b57ddd2595fee9065ee7f'
            '231405d1fbbcc68168248f93edd19ae14b60f66bb4d1c8e46ead1d4cd8e0ae7c')

pkgver () {
    cd tor
    git describe --long --tags --abbrev=7 origin/${_branch:-master} \
        |sed -e 's/[tor\|dev].//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd tor

    [[ $_with_rust ]] &&
       git submodule update --init --recursive

    ./autogen.sh
}

build() {
    cd tor
    export TOR_RUST_DEPENDENCIES="$srcdir/tor/src/ext/rust/crates"

    ./configure $_options \
        --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-html-manual \
        --enable-systemd \
        --enable-zstd \
        --enable-lzma \
        --enable-pic \
        --with-malloc=${_malloc:-system}
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

    install -Dm640 "$srcdir/torrc"             "$pkgdir/etc/tor/torrc"
    install -Dm640 "$srcdir/nodes"             "$pkgdir/etc/tor/torrc.d/nodes"
    install -Dm640 "$srcdir/bridge"            "$pkgdir/etc/tor/torrc.d/bridge"
    install -Dm640 "$srcdir/isolation"         "$pkgdir/etc/tor/torrc.d/isolation"
    install -Dm640 "$srcdir/transparent_proxy" "$pkgdir/etc/tor/torrc.d/transparent_proxy"
    install -Dm644 "$srcdir/tor.logrotate"     "$pkgdir/etc/logrotate.d/tor"
    install -Dm644 "$srcdir/tor.service"       "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles"      "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers"      "$pkgdir/usr/lib/sysusers.d/tor.conf"
    install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/tor-git/LICENSE"
}
