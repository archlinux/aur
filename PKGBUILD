# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=12.0.14
pkgrel=1
pkgdesc='Seafile server core'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/haiwen/seafile-server'
license=('AGPL-3.0-only' 'Apache-2.0')
depends=(
    'argon2'
    'fuse2'
    'mariadb-libs'
    'python'
    'libsearpc'
    'libevent'
    'libevhtp-seafile'
    'libarchive'
    'libjwt2'
)
makedepends=('intltool' 'vala' 'go' 'git')
conflicts=('seafile')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'fix_seafile-controller_paths.diff'
    'fix_incompatible_pointer.diff'
    'seafile-server@.service'
    'seafile-sysusers.conf'
    'seafile-tmpfiles.conf'
)
sha256sums=(
    'b548fc0370ac81c173408eac4306c56035d89a205ebb7d1a9febba495ab53aad'
    'c4bd2b24fa2e5919b1ada61fff0dda7486460a8814764dc37db79178378d4930'
    '3a0dd0d5a659d29f9f4b0f2406074e91a6f594f6cdc472838b6b4c99c25de55c'
    'b09ab24829df0692e78b777802298b8cac23bdcdc31306e12ed3543833a7088e'
    '2faf52556d901ae18cfaa33b1cc55ee14abab4f78869eb6a2889ceeac4e3076a'
    '24962ce5cba697d18980b9d418c7654fbfc5118c69236f9fc94aa3cd526ac176'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"
    sed -i 's|(DESTDIR)@prefix@|@prefix@|' './lib/libseafile.pc.in'
    patch -p1 -i "$srcdir/fix_seafile-controller_paths.diff"
    patch -p1 -i "$srcdir/fix_incompatible_pointer.diff"
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"
    ./autogen.sh
    ./configure \
        --prefix='/usr' \
        --with-mysql='/usr/bin/mysql_config' \
        --enable-fuse \
        --enable-python \
        --enable-console
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
