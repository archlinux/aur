# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=spice-vdagent
pkgname="${_pkgname}"-git
pkgver=0.23.0.r6.ge940b00
pkgrel=1
pkgdesc='SPICE VDAgent for Linux'
arch=('i686' 'x86_64' 'aarch64')
url='https://www.spice-space.org'
license=('GPL-3.0-only')
depends=('alsa-lib' 'gtk4')
makedepends=('git' 'spice-protocol-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.freedesktop.org/spice/linux/vd_agent.git"
         spice-vdagentd.conf.sample)
sha256sums=('SKIP'
            'f55b5a225cde8c2b2da27368682b3891f5acf9ccd40d344023ad6df8d01ec2bb')

pkgver() {
    cd ${_pkgname}
    git describe --always | sed 's:^spice-vdagent.::;s:-:.r:;s:-:.:'
}

prepare() {
    cd ${_pkgname}

    # Place vdagentd's configartion file in /etc/conf.d/ instead of /etc/sysconfig/.
    sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|
            s|/usr/sbin/spice-vdagentd|/usr/bin/spice-vdagentd|' data/spice-vdagentd.service
    sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|' data/spice-vdagentd.1.in
}

build() {
    cd ${_pkgname}
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --with-gtk4=yes \
        --with-session-info=systemd \
        --with-init-script=systemd \
        --enable-year2038
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install

    # sample configuration file to pass command line options to spice-vdagentd
    install -Dm644 "${srcdir}"/spice-vdagentd.conf.sample -t "${pkgdir}"/usr/share/doc/spice-vdagent/
}
