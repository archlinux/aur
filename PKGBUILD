#
# Maintainer: bjin <bjin1990 at gmail dot com>
# Contributor: isiachi <isiachi@rhyeworld.it>
#

pkgbase="spl-dkms-git"
pkgname=("spl-dkms-git" "spl-utils-dkms-git")
pkgver=0.6.5.2_0_g2fd6834
pkgrel=1
license=('GPL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git#tag=spl-0.6.5.2"
        "spl-utils.hostid")
md5sums=('SKIP'
         'a54f0041a9e15b050f25c463f1db7449')

pkgver() {
    cd "${srcdir}/spl"
    git describe --match "spl-*" --long --tags | sed -e 's|spl-||g' -e 's|[-: ]|_|g'
}

build() {
    cd "${srcdir}/spl"
    ./autogen.sh
    scripts/dkms.mkconf -v ${pkgver%%_*} -f dkms.conf -n spl

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
    provides=("spl-dkms")
    conflicts=("spl-git" "spl-lts" "spl-dkms")
    install=spl.install

    install -d ${pkgdir}/usr/src
    cp -a ${srcdir}/spl ${pkgdir}/usr/src/spl-${pkgver%%_*}
    cd ${pkgdir}/usr/src/spl-${pkgver%%_*}
    rm -rf .git .gitignore
    make clean
}

package_spl-utils-dkms-git() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    provides=("spl-utils")
    conflicts=("spl-utils-git" "spl-utils-lts" "spl-utils")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
