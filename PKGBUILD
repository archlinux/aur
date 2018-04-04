# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=tor-git
_branch=master
#_branch=maint-0.3.2
pkgver=0.3.4.0.alpha.28012
pkgrel=2
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
backup=('etc/tor/torrc')

source=("git+https://git.torproject.org/tor.git#branch=${_branch}"
        #"git+https://github.com/torproject/tor.git#branch=${_branch}"
        'torrc'
        'tor.service' 'tor.tmpfiles' 'tor.sysusers')

sha256sums=('SKIP'
            '413bc43b5c51ff1672b426034598c1d47d5fb94474762cda06668cb28ca9250d'
            '3fbea6b96d3ef86836c089da0c9c3d3263db133f3203c5e58b25f0dcaf03f8bf'
            '07bedb17660a3673b31b0005b6505065c90b32f2c6b28b969241da675560f926'
            '4282c8a4f1471b3be345b2024491af89f5eeaac071884f2a55988aef94a2054b')

pkgver () {
    cd "$srcdir/tor"
    echo "$(grep AC_INIT configure.ac \
        | sed 's/.*\[\(.*\)\].*/\1/;s/-/./g;s/.dev//').$(git rev-list --count origin/$_branch)"
}

prepare() {
     cd "$srcdir/tor"
    ./autogen.sh
}

build() {
    cd "$srcdir/tor"

    ## For performance testing - https://trac.torproject.org/projects/tor/ticket/11332
    #pacman -S community/perf
    #torrc: DisableDebuggerAttachment 0
    #export CFLAGS='-Wall -g -O2 -pipe -fno-omit-frame-pointer'
    #options=(!strip)

    ./configure \
        --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --enable-systemd --enable-zstd
        #--with-tcmalloc
        #--enable-openbsd-malloc

    make
}

check() {
    cd "$srcdir/tor"
    make test || true
}

package() {
    cd "$srcdir/tor"
    make DESTDIR="$pkgdir" install

    rm -f "$pkgdir/etc/tor/tor-tsocks.conf"
    install -Dm640 "$srcdir/torrc"        "$pkgdir/etc/tor/torrc"
    install -Dm644 "$srcdir/tor.service"  "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers" "$pkgdir/usr/lib/sysusers.d/tor.conf"
    install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/tor/LICENSE"
}
