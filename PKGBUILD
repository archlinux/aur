# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=13.0.12
pkgrel=1
pkgdesc='Seafile server core'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/haiwen/seafile-server'
license=('AGPL-3.0-only' 'Apache-2.0')
depends=(
    'argon2'
    'fuse2'
    'hiredis'
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
    'fix_implicit_declaration.diff'
    'fix_conflicting_types.diff'
    'seafile-server@.service'
    'seafile-server.service'
    'seafile-notification@.service'
    'seafile-notification.service'
    'seafile-sysusers.conf'
    'seafile-tmpfiles.conf'
)
sha256sums=(
    '728be0250f299a28a4cfbfed402537d081e4ba88043154dc6de82e13f4190d71'
    'c4bd2b24fa2e5919b1ada61fff0dda7486460a8814764dc37db79178378d4930'
    '4d84d7b73aad520ef37d42f20a4a3b67f373a703a655e01d4e0a8158a5d985c0'
    '54805cc9d5e54dae038f5bfa7fc0756e9e2673d5601540b702fdc9275b3ffee3'
    'd4a3b4cbeafb9bd825d68636de2a66de63bb2ca43371f92e24181ba7afb9559b'
    '3fb3d1218ef10560654c143b1ace8adadf08155d214f920ccc2c1cdc9a5c0dc7'
    '3e3ceeef0423e4655a63534b729d0f8ff2042f6485480482772041018d27d8c4'
    '69be9d180c550bb691f580124224fbf5de39569863dd0ed6e4ee0adf181b1176'
    'fe619f5acd45893b45730d5f31c29c2793c13e3ecd5f0a90c68063e11fdd3ee3'
    '2faf52556d901ae18cfaa33b1cc55ee14abab4f78869eb6a2889ceeac4e3076a'
    '24962ce5cba697d18980b9d418c7654fbfc5118c69236f9fc94aa3cd526ac176'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"
    sed -i 's|(DESTDIR)@prefix@|@prefix@|' './lib/libseafile.pc.in'
    patch -p1 -i "$srcdir/fix_seafile-controller_paths.diff"
    patch -p1 -i "$srcdir/fix_incompatible_pointer.diff"
    patch -p1 -i "$srcdir/fix_implicit_declaration.diff"
    patch -p1 -i "$srcdir/fix_conflicting_types.diff"
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
    install -Dm644 "$srcdir/"*.service -t "$pkgdir/usr/lib/systemd/system"
}
