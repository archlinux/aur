# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=8.0.2
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
)
makedepends=('vala')
conflicts=('seafile')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'fix_seafile-controller_paths.diff'
    'seafile-server@.service'
    'seafile-sysusers.conf'
    'seafile-tmpfiles.conf'
)
sha256sums=(
    '4ae07f9c7712453a8c17ad34b5278749656ba59fb8d0714b10d66881cca98d34'
    'c4bd2b24fa2e5919b1ada61fff0dda7486460a8814764dc37db79178378d4930'
    'b09ab24829df0692e78b777802298b8cac23bdcdc31306e12ed3543833a7088e'
    '2faf52556d901ae18cfaa33b1cc55ee14abab4f78869eb6a2889ceeac4e3076a'
    '24962ce5cba697d18980b9d418c7654fbfc5118c69236f9fc94aa3cd526ac176'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"
    # Remove scripts for tests and others OS
    rm -rf "./scripts/"{build,upgrade/win32,*.bat,*.md} "./integration-tests"

    # Apply patchs
    patch -p1 -i "$srcdir/fix_seafile-controller_paths.diff"
    sed -i "s|(DESTDIR)@prefix@|@prefix@|" "./lib/libseafile.pc.in"

    # Fix paths to Gunicorn
    sed -e 's|gunicorn_exe=.*|gunicorn_exe=/usr/bin/gunicorn|g' \
        -e 's|thirdpart/bin/gunicorn|$gunicorn_exe|g' \
        -i ./scripts/seahub.sh
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"
    ./autogen.sh
    ./configure \
        --prefix='/usr' \
        --with-mysql='/usr/bin/mysql_config' \
        --enable-fuse \
        --enable-python
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-server"
    make DESTDIR="$pkgdir" install

    # Prepare directories layout for deploying
    # These makes setup-seafile*.sh happy, whether we use them or not
    install -dm755 "$pkgdir/usr/share/$pkgname/"{runtime,seafile/docs}
    cp -p ./doc/*.doc "$pkgdir/usr/share/$pkgname/seafile/docs"

    # The scripts needs this bin directory.
    ln -s /usr/bin/ "$pkgdir/usr/share/$pkgname/seafile/bin"
    cp -r -p "./scripts"/* "$pkgdir/usr/share/$pkgname/"

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
