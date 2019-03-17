pkgname=("frrouting")
pkgver=1
pkgrel=1
license=("GPL2")
pkgdesc="FFRouting - IP routing protocol suite for Linux and Unix platforms"
makedepends=("gcc" "git" "linux-headers" "libyang" "net-snmp")
arch=("x86_64")
url="https://ffrouting.org"
source=("${pkgname%-*}::git+https://github.com/FRRouting/frr.git")
sha1sums=("SKIP")
provides=("${pkgname}")

prepare() {
        pushd ${srcdir}/${pkgname}
        ./bootstrap.sh
        ./configure \
         --enable-systemd \
         --enable-sharpd \
         --enable-snmp \
         --localstatedir=/var/run/ffr \
         --sysconfdir=/etc/ffr \
         --sbindir=/usr/bin \
         --disable-doc
}

build() {
        pushd ${srcdir}/${pkgname}
        make DESTDIR=${pkgdir}
}

package() {
        etc=( daemons daemons.conf frr.conf vtysh.cnf )
        pushd ${srcdir}/${pkgname}
        sed -i 's/lib\/frr/bin/' tools/frr.service
        install -m 0644 tools/frr.service ${pkgdir}/usr/lib/systemd/system/frr.service
        for item in etc; do
          install -m 0644 tools/etc/ffr/${item} ${pkgdir}/etc/ffr/${item}
        done
	make DESTDIR=${pkgdir} install
}
