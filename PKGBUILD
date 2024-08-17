# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=11.0.12
pkgrel=1
pkgdesc='Seafile server core'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/haiwen/seafile-server'
license=('AGPL3')
depends=(
    'fuse2'
    'mariadb-libs'
    'python'
    'libsearpc'
    'libevent'
    'libevhtp-seafile'
    'libarchive'
    'libldap'
    'libjwt'
)
makedepends=('vala' 'go' 'git')
conflicts=('seafile')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'fix_build_with_gcc_14.1.diff'
    'fix_seafile-controller_paths.diff'
    'seafile-server@.service'
    'seafile-sysusers.conf'
    'seafile-tmpfiles.conf'
)
sha256sums=(
    'd6bdab0990ed7e63d8f06fcff081a346cf22099c78107460863e19bb98fe9507'
    '468415264179865358a983cbd7e64623c152b86b6aa706c0f5faf5c9dc8b95f8'
    'c4bd2b24fa2e5919b1ada61fff0dda7486460a8814764dc37db79178378d4930'
    'b09ab24829df0692e78b777802298b8cac23bdcdc31306e12ed3543833a7088e'
    '2faf52556d901ae18cfaa33b1cc55ee14abab4f78869eb6a2889ceeac4e3076a'
    '24962ce5cba697d18980b9d418c7654fbfc5118c69236f9fc94aa3cd526ac176'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"
    sed -i 's|(DESTDIR)@prefix@|@prefix@|' './lib/libseafile.pc.in'
    patch -p1 -i "$srcdir/fix_build_with_gcc_14.1.diff"
    patch -p1 -i "$srcdir/fix_seafile-controller_paths.diff"
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"
    ./autogen.sh
    ./configure \
        --prefix='/usr' \
        --with-mysql='/usr/bin/mysql_config' \
        --enable-fuse \
        --enable-python \
        --enable-console \
        --enable-ldap
    make

    # Build Go packages
    export GOPATH="$srcdir"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_ENABLED=1

    GOFLAGS='-buildmode=pie'
    GOFLAGS+=' -trimpath'
    GOFLAGS+=' -ldflags=-linkmode=external'
    GOFLAGS+=' -mod=readonly'
    GOFLAGS+=' -modcacherw'
    export GOFLAGS

    for pkg in fileserver notification-server; do
        pushd "$pkg"
        go build .
        popd
    done
}

package() {
    cd "$srcdir/$pkgname-$pkgver-server"
    make DESTDIR="$pkgdir" install

    # Prepare directories layout for deploying
    install -dm755 "$pkgdir/usr/share/$pkgname/"{runtime,seafile}
    cp -rp ./scripts/* "$pkgdir/usr/share/$pkgname"

    # The scripts needs this bin directory.
    ln -s /usr/bin/ "$pkgdir/usr/share/$pkgname/seafile/bin"

    # Install Go binaries
    for bin in fileserver notification-server; do
        install -Dm755 "$bin/$bin" "$pkgdir/usr/bin/$bin"
    done

    # Systemd
    install -Dm644 \
        "$srcdir/seafile-sysusers.conf" \
        "$pkgdir/usr/lib/sysusers.d/seafile.conf"
    install -Dm644 \
        "$srcdir/seafile-tmpfiles.conf" \
        "$pkgdir/usr/lib/tmpfiles.d/seafile.conf"
    install -Dm644 \
        "$srcdir/seafile-server@.service" \
        "$pkgdir/usr/lib/systemd/system/seafile-server@.service"
}
