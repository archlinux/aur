# Maintainer: Doridian <archlinux@doridian.net>

pkgname=ltfs-git
pkgver=2.4.3.0.10450.r125.gadb3722
pkgrel=2
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

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    LDFLAGS="${LDFLAGS-} -licuuc -licui18n" ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-fast

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
