# Maintainer: John Karpn <johnkarpn@gmail.com>

pkgname=xtrabackup80
pkgver=8.0.35_34
_boost_ver=1.77.0
pkgrel=2
pkgdesc='Non-blocking backup tool for MySQL'
arch=('x86_64')
url='https://www.percona.com/software/mysql-database/percona-xtrabackup'
license=('GPL-2.0-only')
depends=('libaio' 'libev' 'libgcrypt' 'curl' 'perl-dbd-mysql' 'numactl' 'protobuf' 'libprocps' 'icu' 'zlib' 'zstd' 'lz4')
makedepends=('cmake3-bin' 'python-sphinx' 'vim' 'libedit' 'libevent' 'libfido2')
optdepends=('qpress: for compressed backups')
source=("https://downloads.percona.com/downloads/Percona-XtraBackup-8.0/Percona-XtraBackup-8.0.35-34/source/tarball/percona-xtrabackup-8.0.35-34.tar.gz"
		"https://archives.boost.io/release/$_boost_ver/source/boost_${_boost_ver//./_}.tar.gz")

sha256sums=('6ca81cd647e7cb1d8fd341f97cd32248bd719f9104a63eb24f1edda6a2d2441c'
            '5347464af5b14ac54bb945dc68f1dd7c56f0dad7262816b956138fc53bcc0131')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake3 -DBUILD_CONFIG=xtrabackup_release \
        -DCMAKE_BUILD_TYPE=Release \
        -DMYSQL_DATADIR=/var/lib/mysql \
        -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
        -DWITH_EDITLINE=system \
        -DWITH_FIDO=system \
        -DWITH_ICU=system \
        -DWITH_LIBEVENT=system \
        -DWITH_LZ4=system \
        -DWITH_PROTOBUF=system \
        -DWITH_SSL=system \
        -DWITH_ZLIB=system \
        -DWITH_ZSTD=system \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_PLUGINDIR="/usr/lib/xtrabackup/plugin" \
        -DINSTALL_MANDIR="/usr/share/man" \
        -DINSTALL_STATIC_LIBRARIES=OFF \
        -DWITH_BOOST="../boost_${_boost_ver//./_}" \
        ../percona-xtrabackup-${pkgver//_/-}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  rm -rf usr/xtrabackup-test \
         usr/lib/xtrabackup/plugin/debug \
         usr/lib/*.a \
         usr/include \
         usr/docs \
         usr/share/man/man8 \
         usr/share/man/man1/{c,i,m,l,p,z}*
}
