# $Id: PKGBUILD 187068 2016-08-19 16:06:12Z mtorromeo $
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: James Miller <james@pocketrent.com>

pkgname=hhvm
pkgver=4.99.0
pkgrel=1

pkgdesc="A virtual machine for executing programs written in Hack."
arch=('x86_64')
url="http://hhvm.com"
license=('PHP' 'Zend' 'MIT')
depends=('boost-libs' 'google-glog' 'gperf' 'gperftools' 'libmysqlclient' 'libmemcached' 'libzip'
         'libxslt' 'tbb' 'libmcrypt' 'oniguruma' 'jemalloc' 'curl' 'libmagick' 'libmagick6' 'gmp'
         'libvpx' 'libdwarf' 'libedit' 'editline' 'sqlite' 'libyaml' 'bzip2' 'libnotify'
         're2' 'libldap' 'numactl' 'libelf' 'icu' 'libevent' 'expat' 'inotify-tools' 'krb5'
         'postgresql-libs' 'libsodium' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'gcc' 'boost'
             'rsync' 'unzip' 'wget' 'aspcud')
optdepends=('c-client: IMAP support'
            'watchman')
source=("git+https://github.com/facebook/hhvm.git"
        "https://raw.githubusercontent.com/hhvm/packaging/HHVM-${pkgver%.*}/skeleton/etc/hhvm/php.ini"
        "https://raw.githubusercontent.com/hhvm/packaging/HHVM-${pkgver%.*}/skeleton/etc/hhvm/server.ini")
sha512sums=('SKIP'
            '49e5b8b2af1caf546ab0e98e1fe74e1bcd9b0a2a2120b633ea2424ff40534e954b0d349e363f53e18852640fa9f2451114882c326361f205791dbecaa5e20d47'
            'fb6af88ec0ca384fa9a62642f2da2a8f191089423ccdf3f4fdef7b461529e2b05b739128e43814323343fba356652dbf20cd5aaa8e56c5664a7fac954cae943f')
backup=(etc/hhvm/{php,server}.ini)

prepare() {
    cd "$srcdir"/$pkgname
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
    cd "$srcdir"/$pkgname
    make
}


package() {
    cd "$srcdir"/$pkgname
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.PHP "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.PHP
    install -Dm644 LICENSE.ZEND "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.ZEND
    install -Dm644 hphp/hack/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.MIT

    cd "$srcdir"
    install -Dm644 php.ini "$pkgdir"/etc/hhvm/php.ini
    install -Dm644 server.ini "$pkgdir"/etc/hhvm/server.ini

    # No idea how to prevent the /tmp directory from being generated yet, so we'll have to do this
    cd "$pkgdir"
    rm -fr build/
}
