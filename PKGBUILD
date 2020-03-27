# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=7.1.1
pkgrel=1
pkgdesc='Seafile server core'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/haiwen/seafile-server'
license=('AGPL3')
depends=(
    "ccnet-server>=$pkgver"
    'fuse2'
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
    '6f8ea0204c322b3f1675e73f2e639d1167e880bc53596e9fe5fbb6c501de6bee'
    '8069df2e84e5142a030c4598e410eeece1aaed2fdce3b8abe82b4752d257ffb9'
    '19ed8a238b9cff5a8ad363fa6eda884a49da283aa913270dd667d1b9a19d8056'
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
    sed \
        -e 's|gunicorn_exe=.*|gunicorn_exe=/usr/bin/gunicorn|g' \
        -e 's|thirdpart/bin/gunicorn|$gunicorn_exe|g' \
        -i ./scripts/seahub.sh
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"
    ./autogen.sh
    ./configure \
        --enable-fuse \
        --enable-python \
        --prefix=/usr \
        --with-mysql=/usr/bin/mysql_config
        PYTHON='/usr/bin/python'
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
