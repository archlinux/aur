# $Id: PKGBUILD 187068 2016-08-19 16:06:12Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: James Miller <james@pocketrent.com>

pkgname=hhvm
pkgver=3.14.5
pkgrel=1

_thirdparty_commit=e1fcf90c07e0af00906f98cde8aa828bec7b2e01
_brotli_commit=98ed7a23a83d64133b0a36a884e489bffb0eb864
_folly_commit=05cdf111f5e6a4585a5e9140fda26f4fea070637
_mcrouter_commit=679c32548ef7d3c8624b15c0c38f584b37177478
_proxygen_commit=0b0b50c08b2165f4ed4e4f374ddbeabbc8582e44
_squangle_commit=36a61d13d03e72dc710028d48de5616f9926128a
_thrift_commit=8672f88b084d2d5242016f2a4df282ee2c6d4023
_wangle_commit=4903f961a88751e684f703aaf08511cd5c486a84
_webscalesql_commit=a9e580b5a0baa768210ef10544c8fab52003ec0b

pkgdesc="Virtual Machine, Runtime, and JIT for PHP"
arch=('x86_64')
url="http://hhvm.com"
license=('PHP')
depends=('boost-libs' 'google-glog' 'libmysqlclient' 'libmemcached' 'libzip'
         'libxslt' 'intel-tbb' 'libmcrypt' 'oniguruma' 'jemalloc' 'curl'
         'libvpx' 'libdwarf' 'imagemagick' 'libedit' 'sqlite' 'libyaml'
         'fribidi' 're2' 'gperf' 'c-client' 'unixodbc' 'numactl')
makedepends=('git' 'mercurial' 'cmake' 'gcc' 'boost'
             'gflags' 'pfff' 'ragel' 'libmariadbclient' 'python2')
source=("https://github.com/facebook/hhvm/archive/HHVM-$pkgver.tar.gz"
        "https://github.com/hhvm/hhvm-third-party/archive/$_thirdparty_commit/hhvm-third-party-$_thirdparty_commit.tar.gz"
        "https://github.com/facebook/folly/archive/$_folly_commit/folly-$_folly_commit.tar.gz"
        "https://github.com/google/brotli/archive/$_brotli_commit/brotli-$_brotli_commit.tar.gz"
        "https://github.com/facebook/fbthrift/archive/$_thrift_commit/thrift-$_thrift_commit.tar.gz"
        "https://github.com/facebook/proxygen/archive/$_proxygen_commit/proxygen-$_proxygen_commit.tar.gz"
        "https://github.com/facebook/mysql-5.6/archive/$_webscalesql_commit/webscalesql-$_webscalesql_commit.tar.gz"
        "https://github.com/facebook/mcrouter/archive/$_mcrouter_commit/mcrouter-$_mcrouter_commit.tar.gz"
        "https://github.com/facebook/squangle/archive/$_squangle_commit/squangle-$_squangle_commit.tar.gz"
        "https://github.com/facebook/wangle/archive/$_wangle_commit/wangle-$_wangle_commit.tar.gz"
        'hhvm.tmpfile'
        'hhvm.service'
        'hhvm@.service'
        'php.ini'
        'server.ini')
install=hhvm.install
backup=(etc/hhvm/{php,server}.ini)
options+=('!buildflags')

prepare() {
    cd "$srcdir"/folly-$_folly_commit
    # not yet compatible with boost 1.61
    # https://github.com/facebook/folly/issues/413
    patch -p1 -i "$srcdir"/folly-fiber-remove.patch

    cd "$srcdir"/$pkgname-HHVM-$pkgver

    sed 's/TypedValue m_extraArgs\[\];/TypedValue m_extraArgs[0];/' \
        -i hphp/runtime/vm/bytecode.h

    sed -r 's/service hhvm (start|stop|restart)/systemctl \1 hhvm.service/' \
        -i hphp/tools/oss-repo-mode

    # Fix sendmail path
    sed -r 's#/usr/lib/sendmail#/usr/bin/sendmail#g' -i \
        hphp/runtime/base/runtime-option.cpp

    rm -rf third-party
    ln -s "$srcdir"/hhvm-third-party-$_thirdparty_commit third-party

    cd third-party/folly
    rm -rf src
    ln -s "$srcdir"/folly-$_folly_commit src

    cd ../brotli
    rm -rf src
    ln -s "$srcdir"/brotli-$_brotli_commit src

    cd ../thrift
    rm -rf src
    ln -s "$srcdir"/fbthrift-$_thrift_commit src

    cd ../proxygen
    rm -rf src
    ln -s "$srcdir"/proxygen-$_proxygen_commit src

    cd ../mcrouter
    rm -rf src
    ln -s "$srcdir"/mcrouter-$_mcrouter_commit src

    cd ../wangle
    rm -rf src
    ln -s "$srcdir"/wangle-$_wangle_commit src

    cd ../squangle
    rm -rf src squangle
    ln -s "$srcdir"/squangle-$_squangle_commit src
    ln -s src/squangle

    cd ../webscalesqlclient
    rm -rf mysql-5.6
    ln -s "$srcdir"/mysql-5.6-$_webscalesql_commit mysql-5.6
}

build() {
    cd "$srcdir"/$pkgname-HHVM-$pkgver
    msg2 "Building hhvm"

    cmake -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_PREFIX_PATH="$srcdir" \
        -DCMAKE_CXX_FLAGS="-Wno-misleading-indentation -Wno-unused" \
        -DMYSQL_UNIX_SOCK_ADDR=/run/mysqld/mysqld.sock \
        .

    make

    for hacktool in hackificator remove_soft_types; do
        cd "$srcdir"/$pkgname-HHVM-$pkgver/hphp/hack/tools/$hacktool
        make depend
        make
    done
}

# check() {
#     cd "$srcdir"/$pkgname-HHVM-$pkgver/hphp/test
#     ./run --threads 8 quick
# }

package() {
    cd "$srcdir"/$pkgname-HHVM-$pkgver
    make DESTDIR="$pkgdir/" install

    cd hphp/hack/bin
    for bin in hh_* tools/*; do
        install -Dm755 $bin "$pkgdir"/usr/bin/$(basename $bin)
    done

    cd "$srcdir"
    install -Dm644 hhvm.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/hhvm.conf
    install -Dm644 hhvm.service "$pkgdir"/usr/lib/systemd/system/hhvm.service
    install -Dm644 hhvm@.service "$pkgdir"/usr/lib/systemd/system/hhvm@.service

    install -Dm644 php.ini "$pkgdir"/etc/hhvm/php.ini
    install -Dm644 server.ini "$pkgdir"/etc/hhvm/server.ini
}

sha256sums=('b82c401ef0824197e3138ceb90c53e409cae41884e94946ef658996ea96f8f25'
            '06e4d11a9eb7385a035df4cccf7d5bcd45bedaea28394e2c50b9565b9aaf843b'
            '3c73b24518539ab5ba0d351931124dafddda37a44640528ff53dbd76acbe0089'
            '95f389831f134c203917f5c6802968006767d0c4f2cc20c1ca22ed28cd925700'
            'c7e7d551f8b05e7ab7ff391b9e26ae593fefc07a64ceacc41abf4f8935928d8b'
            '3c13e24e50ad62dbb809087264aa418333c8e0644bf8d727e9f29fcf398f6762'
            '06983fb95386626dc1a2fdfda2d2632d8f8851b7ad03ec3bef2046f5736af3ab'
            'f4df002985bf5a701191fda4dfbe03d322c8c7ee018a38578d9f62721c328cad'
            '8ad07e8a8656f3f88938bf98e71a582d194d0bcab7d474750c1dddaa29201c59'
            '31f0d4368e65740112d9621dc58fae5e076fcf6c77f52ebde3a0648f5e1cebc5'
            'c356010a6d6b976f387bb205a75ea07d5f40593a8010483f2ed0f66f112331bc'
            '8b50d1ef9f5f726e6d8d469a8c84d85ad63f8b507b97d258b4d751a0e3e221df'
            '59c640602929dac0aa34d06c668ed69361eb4b7b47a77f9aa0badb4d0b61571c'
            '3e3093f817706c238fad021483f114fd4ce0b45d84097dcb7870157fc9ec769f'
            '5b53bc57965e1c5151d720dc7f63f1b2e8ebd5e758b2ef0be3b74df38ebcbce0')
