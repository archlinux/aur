#
# Maintainer: bjin <bjin1990 at gmail dot com>
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgbase="spl-dkms-git"
pkgname=("spl-dkms-git" "spl-utils-dkms-git")
pkgver=0.6.5.3_r0_g7e85f6b
pkgrel=4
license=('GPL')
makedepends=("git" "tar")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git#tag=spl-0.6.5.3"
        "spl-utils.hostid")
md5sums=('SKIP'
         'a54f0041a9e15b050f25c463f1db7449')

pkgver() {
    cd "${srcdir}/spl"
    git describe --match "spl-*" --long --tags | sed -e 's|spl-||' -e 's|-\([0-9]*-g\)|-r\1|' -e 's|[-: ]|_|g'
}

build() {
    cd "${srcdir}/spl"
    ./autogen.sh

    _at_enable=""
    [ "${CARCH}" == "i686"  ] && _at_enable="--enable-atomic-spinlocks"

    ./configure --prefix=/usr \
                --libdir=/usr/lib \
                --sbindir=/usr/bin \
                --with-config=user \
                ${_at_enable}

    make
}

package_spl-dkms-git() {
    pkgdesc="Solaris Porting Layer kernel modules."
    depends=("dkms" "spl-utils-dkms-git=${pkgver}-${pkgrel}")
    conflicts=("spl-git" "spl-lts" "spl-dkms")
    install=spl.install

    dkmsdir="${pkgdir}/usr/src/spl-${pkgver%%_*}"
    install -d "${dkmsdir}"

    cd "${srcdir}/spl"
    git archive --format=tar HEAD | tar -x -C "${dkmsdir}"

    cd "${dkmsdir}"
    ./autogen.sh
    scripts/dkms.mkconf -v ${pkgver%%_*} -f dkms.conf -n spl
    chmod g-w,o-w -R .
}

package_spl-utils-dkms-git() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    conflicts=("spl-utils-git" "spl-utils-lts" "spl-utils")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
