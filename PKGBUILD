#
# Maintainer: bjin <bjin1990 at gmail dot com>
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgbase="spl-dkms"
pkgname=("spl-dkms" "spl-utils")
pkgver=0.6.5.3
pkgrel=1
license=('GPL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git#tag=spl-${pkgver}"
        "spl-utils.hostid")
md5sums=('SKIP'
         'a54f0041a9e15b050f25c463f1db7449')

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

package_spl-dkms() {
    pkgdesc="Solaris Porting Layer kernel modules."
    depends=("dkms" "spl-utils=${pkgver}-${pkgrel}")
    provides=("spl")
    conflicts=("spl-git" "spl-lts")
    install=spl.install

    dkmsdir="${pkgdir}/usr/src/spl-${pkgver}"
    install -d "${dkmsdir}"

    cd "${srcdir}/spl"
    git archive --format=tar HEAD | tar -x -C "${dkmsdir}"

    cd "${dkmsdir}"
    ./autogen.sh
    scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n spl
    chmod g-w,o-w -R .
}

package_spl-utils() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    conflicts=("spl-utils-git" "spl-utils-lts")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
