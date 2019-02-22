# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

#_branch=maint-0.3.5 # stable
#_with_rust=1
#_malloc=jemalloc # tcmalloc

pkgname=tor-git
pkgver=0.4.1.0.alpha.r86.g9ac8c8543
pkgrel=1
pkgdesc="An anonymizing overlay network (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.torproject.org"
license=('BSD')
depends=('openssl' 'libevent' 'libseccomp' 'zstd')
makedepends=('asciidoc')
optdepends=('torsocks: for torify support')
conflicts=('tor')
provides=('tor')
install='tor.install'
backup=('etc/tor/torrc'
        'etc/tor/torrc.d')

[[ $_malloc = 'jemalloc' ]] && depends+=('jemalloc')
[[ $_malloc = 'tcmalloc' ]] && depends+=('gperftools')
[[ $_with_rust ]] && {
    makedepends+=('rust')
    _options="--enable-rust"
}

source=("git+https://git.torproject.org/tor.git#branch=${_branch:-master}"
        'torrc' 'nodes' 'transparent_proxy'
        'tor.logrotate' 'tor.service' 'tor.tmpfiles' 'tor.sysusers')
sha256sums=('SKIP'
            '5e40baff0e6cdc487793453ab06155c2974cc8bb20096db98be641fcceccd328'
            'eb82c6eaef6cd2e9451b4096f4ce23b3ee91fc408cdebd3280698cbe1a3b7ca1'
            '7fbb63e9411eee2176964449a3d6809d16e1120152c6ff201ecea1d1f97f102b'
            'd447227fcc2756778a1be143b8975d67b25ea15688cde2291185b3c71d0f6e34'
            '7f98569aefffead72e8712c1ad27de3fc2095575da003691b2513ca54042efbb'
            'ffef89a0eb10614e2350b4271ff83f92caa2301bfb97746b94dc7ab7f21d702b'
            '4282c8a4f1471b3be345b2024491af89f5eeaac071884f2a55988aef94a2054b')

pkgver () {
    cd tor
    git describe --long --tags origin/${_branch:-master} \
        |sed -e 's/[tor\|dev].//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
     cd tor
    ./autogen.sh
}

build() {
    cd tor

    [[ $_with_rust ]] && {
        git submodule update --init --recursive
        export TOR_RUST_DEPENDENCIES="$srcdir/tor/src/ext/rust/crates"
    }

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

    install -dm750 "$pkgdir/etc/tor"
    install -dm750 "$pkgdir/etc/tor/torrc.d"

    install -Dm640 "$srcdir/torrc"             "$pkgdir/etc/tor/torrc"
    install -Dm640 "$srcdir/nodes"             "$pkgdir/etc/tor/torrc.d/nodes"
    install -Dm640 "$srcdir/transparent_proxy" "$pkgdir/etc/tor/torrc.d/transparent_proxy"

    install -Dm644 "$srcdir/tor.logrotate" "$pkgdir/etc/logrotate.d/tor"
    install -Dm644 "$srcdir/tor.service"   "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers"  "$pkgdir/usr/lib/sysusers.d/tor.conf"

    install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/tor/LICENSE"
}
