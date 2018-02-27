# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=tor-git
_branch=master
#_branch=maint-0.3.2
pkgver=0.3.4.0.alpha.27773
pkgrel=1
pkgdesc="An anonymizing overlay network (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.torproject.org"
license=('BSD')
depends=('openssl>=1.0.2.a' 'ca-certificates' 'libevent' 'libseccomp' 'asciidoc')
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
            '9ff0e143b6c19b4cff74c085e498f8be65f6c40aa18618549ebf5a79e7478382'
            '3fbea6b96d3ef86836c089da0c9c3d3263db133f3203c5e58b25f0dcaf03f8bf'
            '37ff22a2e6f3dab412f08b46b86dede063538f6a32039d58a90d1212f188b379'
            '4a27a177889c044ff4e3e1f6ab8bbb32211466d53d884974240dab67592343b2')

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
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var
        #--with-tcmalloc
        #--enable-openbsd-malloc
        #--with-dmalloc
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
    install -Dm640 "$srcdir/torrc"       "$pkgdir/etc/tor/torrc"

    install -Dm644 "$srcdir/tor.service"  "$pkgdir/usr/lib/systemd/system/tor.service"
    install -Dm644 "$srcdir/tor.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tor.conf"
    install -Dm644 "$srcdir/tor.sysusers" "$pkgdir/usr/lib/sysusers.d/tor.conf"

    install -Dm644 LICENSE               "$pkgdir/usr/share/licenses/tor/LICENSE"
}
