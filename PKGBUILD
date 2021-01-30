# $Id: PKGBUILD 187068 2016-08-19 16:06:12Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: James Miller <james@pocketrent.com>

pkgname=hhvm
pkgver=4.94.0
pkgrel=1

pkgdesc="A virtual machine for executing programs written in Hack."
arch=('x86_64')
url="http://hhvm.com"
license=('PHP' 'Zend' 'MIT')
depends=('boost-libs' 'google-glog' 'gperftools' 'libmysqlclient' 'libmemcached' 'libzip'
         'libxslt' 'tbb' 'libmcrypt' 'oniguruma' 'jemalloc' 'curl' 'libmagick6' 'gmp'
         'libvpx' 'libdwarf' 'libedit' 'editline' 'sqlite' 'libyaml' 'bzip2' 'libnotify'
         're2' 'libldap' 'numactl' 'libelf' 'icu' 'libevent' 'expat' 'inotify-tools' 'krb5'
         'postgresql-libs' 'libsodium' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'gcc' 'boost'
             'rsync' 'unzip' 'wget' 'aspcud')
optdepends=('c-client: IMAP support'
            # 'snappy: Snappy extension support'
            'watchman')
source=("git+https://github.com/facebook/hhvm.git"
        "https://raw.githubusercontent.com/hhvm/packaging/HHVM-${pkgver}/skeleton/etc/hhvm/php.ini"
        "https://raw.githubusercontent.com/hhvm/packaging/HHVM-${pkgver}/skeleton/etc/hhvm/server.ini")
sha256sums=('SKIP'
            '3e3093f817706c238fad021483f114fd4ce0b45d84097dcb7870157fc9ec769f'
            '5b53bc57965e1c5151d720dc7f63f1b2e8ebd5e758b2ef0be3b74df38ebcbce0')
# backup=(etc/hhvm/{php,server}.ini)
#options+=('!buildflags')

prepare() {
    cd "$srcdir"/hhvm
    git checkout "HHVM-${pkgver}"

    # Fetch much faster this way
    git submodule update --init --recursive --jobs=$(nproc)


    cmake -Wno-dev \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_PREFIX_PATH="${srcdir}" \
          -DMYSQL_UNIX_SOCK_ADDR=/run/mysqld/mysqld.sock \
          .
}

build() {
    cd "$srcdir"/hhvm
    make
}


package() {
    cd "$srcdir"/$pkgname
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.PHP "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.PHP
    install -Dm644 LICENSE.ZEND "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.ZEND
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.MIT

    cd "$srcdir"
    install -Dm644 php.ini "$pkgdir"/etc/hhvm/php.ini
    install -Dm644 server.ini "$pkgdir"/etc/hhvm/server.ini

    # No idea how to prevent the /tmp directory from being generated yet, so we'll have to do this
    cd "$pkgdir"
    rm -fr tmp/
}
