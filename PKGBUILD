# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

#_branch=maint-0.4.1 # stable
_with_rust=1
#_malloc=jemalloc # tcmalloc

pkgname=tor-git
pkgver=0.4.3.0.alpha.r17.gf00
pkgrel=1
pkgdesc="An anonymizing overlay network (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.torproject.org"
license=('BSD')
depends=('openssl>=1.1.1' 'libevent' 'libseccomp' 'zstd')
makedepends=('asciidoc')
optdepends=('torsocks: allow transparent SOCKS proxying'
            'obfs4proxy: obfuscating pluggable transport proxy'
            'meek: obfuscating pluggable transport proxy')
conflicts=('tor')
provides=('tor')
install='tor.install'
backup=('etc/tor/torrc'
        'etc/tor/torrc.d/nodes'
        'etc/tor/torrc.d/bridge'
        'etc/tor/torrc.d/transparent_proxy')

[[ $_malloc = 'jemalloc' ]] && depends+=('jemalloc')
[[ $_malloc = 'tcmalloc' ]] && depends+=('gperftools')
[[ $_with_rust ]] && {
    makedepends+=('rust')
    _options="--enable-rust"
}

source=("git+https://git.torproject.org/tor.git#branch=${_branch:-master}"
        'torrc' 'nodes' 'bridge' 'transparent_proxy'
        'tor.logrotate' 'tor.service' 'tor.tmpfiles' 'tor.sysusers')

sha256sums=('SKIP'
            'c264c79c352767ee3763b843f840e98ad992e04b4ffc189ef80524d919d4fccc'
            'eb82c6eaef6cd2e9451b4096f4ce23b3ee91fc408cdebd3280698cbe1a3b7ca1'
            '90a588c3c2dc7826172341453f76739e8f48df7b0c858adebd12e97f047bde26'
            '7fbb63e9411eee2176964449a3d6809d16e1120152c6ff201ecea1d1f97f102b'
            'd447227fcc2756778a1be143b8975d67b25ea15688cde2291185b3c71d0f6e34'
            '96ed5b040c944fd99b15e8bdd25a7682a4e6d19c11f42c669c80aade088ec9dc'
            'ffef89a0eb10614e2350b4271ff83f92caa2301bfb97746b94dc7ab7f21d702b'
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
        --enable-systemd --enable-zstd --enable-pic \
        --with-malloc=${_malloc:-system}
    make
}

check() {
    cd tor
    make check
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
    install -Dm640 "$srcdir/transparent_proxy" "$pkgdir/etc/tor/torrc.d/transparent_proxy"
    install -Dm644 "$srcdir/tor.logrotate"     "$pkgdir/etc/logrotate.d/tor"
    install -Dm644 "$srcdir/tor.service"       "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles"      "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers"      "$pkgdir/usr/lib/sysusers.d/tor.conf"
    install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/tor-git/LICENSE"

    chown -R 43:43 "$pkgdir"/etc/tor
}
