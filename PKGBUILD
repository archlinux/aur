# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

#_branch=maint-0.4.8 # stable
#_malloc=jemalloc # tcmalloc

pkgname=tor-git
pkgver=0.4.9.2.alpha.r83.g58248ad
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

depends=(
    'libcap'
    'libevent'
    'libseccomp'
    'openssl'
    'xz'
    'zstd'
)
makedepends=(
    'asciidoc'
    'ca-certificates'
    'git'
    'systemd'
)
checkdepends=(
    'python'
)
optdepends=(
    'torsocks: allow transparent SOCKS proxying'
    'obfs4proxy: obfuscating pluggable transport proxy'
    'meek: obfuscating pluggable transport proxy'
)

[[ $_malloc = 'jemalloc' ]] && depends+=('jemalloc')
[[ $_malloc = 'tcmalloc' ]] && depends+=('gperftools')

source=("git+https://gitlab.torproject.org/tpo/core/tor#branch=${_branch:-main}"
        {nodes,bridge,transparent_proxy,isolation}.conf
        'torrc' 'tor.logrotate' 'tor.service' 'tor.tmpfiles' 'tor.sysusers')

sha256sums=('SKIP'
            '72ed5d90c54d9d5354af0d9fc7eb1412c548cc308868b85a99278abe8ccbf145'
            '90a588c3c2dc7826172341453f76739e8f48df7b0c858adebd12e97f047bde26'
            'ad86860e39c8b3b76087f92aa3691e27379a4dc195456b0652f4b14ba85752de'
            '748b7264b49b12d5252d688b8859820046413938c5fde91578da0d5b95594c2e'
            '908fe2ef5874fc39d8ddd2254a27e7a933e47abe53757d6e12312cd64ceae3cb'
            'd447227fcc2756778a1be143b8975d67b25ea15688cde2291185b3c71d0f6e34'
            'cffa05e227905e2bf41c762ab8829c44dac2b80e0ce5d614964c1b8130c34463'
            '06c00318d84ead3f939b267c7ae9e4cc1cd90c534d0b57ddd2595fee9065ee7f'
            '231405d1fbbcc68168248f93edd19ae14b60f66bb4d1c8e46ead1d4cd8e0ae7c')
b2sums=('SKIP'
        'b2c5ce4a13912d3cf15037c2f6edfa52be2e350c168aa15725e14461dadcbb910a3489fa7e2cd7d3b9a84555534ca6110b8bb4efd5c05711c7f70b4a0d6950ac'
        'f02bf294ab3879d99ac88de47264fd62bd9c0efa525ac69ca13183df15ada09b29f65eea732e826a5e1b2530b91971da57b317367626303ab936d143fb72305a'
        '09f73d9edcd790509a5b7652a2e7b55c2e555c932bd15124ca80dc681501e416987226853968ae6421c5f2380fdee9823799f520b72b230c9ff08b817d2f7fda'
        'c5b82b829420b3367c07f3f3b0872a3a748c95bd977ca27e10d74d4e0d06a1813ae1ef1c44187793c6f530f4c83e6c796e74601edc7a34aa1da3198212c0d93f'
        '59ab88a049b0bee1933619a734d4bca499da8fcf8356cd6dfe19666ac9685f6cfb8cfe107bbe8d5168bd18824c3dd0047020ddb481601896a67699425aac5ccb'
        '2d02b9fa19f2cb67ab162e47362a7c9ae9837b6199178748b955be502f4dc56608242d922e8c71ecae86a2297c865a3641bcfb09612798a15671adae92f9d25c'
        '92941d0dca75e4f2097d822560e31f4be2f1c39ac0f70ce79fddb74fd8c8743564dba7a23f52ec13079f8b306f1e38c5d174e812cfb4a44a3a1971e3aade910b'
        '33df38f09bd779da424e003a1976f2f2f2d427fcab9d2a629d7e3f858e1bfd4fe85ca712c9403609d0d5fc3d854a0b5ba52b648dabbbbd4f18f73bf2a9e43df5'
        '45bfce458cdf30e10ea0732ff8f1b44f43e5b1b285b1841a01714684337614de09e6d055f8b6b2455312a611de96305187b4cd0a782370f0f67c247cd74fc4cd')

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
        --disable-coverage \
        --disable-html-manual \
        --disable-libfuzzer \
        --enable-gpl \
        --enable-lzma \
        --enable-module-pow \
        --enable-pic \
        --enable-seccomp \
        --enable-systemd \
        --enable-zstd \
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
