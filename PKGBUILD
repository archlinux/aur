# Maintainer: Doridian <archlinux@doridian.net>

pkgname=ltfs-git
pkgver=2.4.8.4.10522.r0.g7d0de7c
pkgrel=1
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='https://github.com/LinearTapeFileSystem/ltfs'
license=('BSD')
depends=('fuse' 'icu' 'libxml2' 'net-snmp' 'python-pyxattr')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot' 'autoconf' 'automake' 'libtool' 'git')
provides=('ltfs')
conflicts=('ltfs')
backup=('etc/ltfs.conf.local')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    LDFLAGS="${LDFLAGS-} -licuuc -licui18n" ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-fast
    # for net-snmp https://github.com/net-snmp/net-snmp/issues/1035
    make CFLAGS='-Wno-error=declaration-after-statement'
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
