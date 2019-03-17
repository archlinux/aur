pkgname=(frrouting)
license=(GPL2)
pkgver=r15008.61be0e35f
pkgrel=7
pkgdesc="FFRouting - IP routing protocol suite for Linux and Unix platforms - git"
makedepends=(gcc git linux-headers libyang net-snmp)
depends=(libyang net-snmp)
arch=(x86_64)
url="https://frrouting.org"
source=("${pkgname%-*}::git+https://github.com/FRRouting/frr.git" sysusers.frr.conf)
sha1sums=(SKIP)
provides=(${pkgname})

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        pushd ${srcdir}/${pkgname}
        ./bootstrap.sh
        ./configure \
         --enable-systemd \
         --enable-sharpd \
         --enable-snmp \
         --localstatedir=/var/run/frr \
         --sysconfdir=/etc/frr \
         --sbindir=/usr/bin \
         --enable-user=frr \
         --enable-group=frr \
         --disable-doc
}

build() {
        pushd ${srcdir}/${pkgname}
        make DESTDIR=${pkgdir}
}

package() {
        etc=( daemons daemons.conf frr.conf vtysh.conf )

        pushd ${srcdir}/${pkgname}
	make DESTDIR=${pkgdir} install

        sed -i 's/lib\/frr/bin/' tools/frr.service
        install -D -m 0644 tools/frr.service ${pkgdir}/usr/lib/systemd/system/frr.service

        install -D -m 0644 redhat/frr.pam ${pkgdir}/etc/pam.d/frr.pam

        for item in ${etc[@]}; do
          install -D -m 0644 tools/etc/frr/${item} ${pkgdir}/etc/frr/${item}
        done
        install -D -m 0644 "${srcdir}/sysusers.frr.conf" "${pkgdir}/usr/lib/sysusers.d/frr.conf"

}
