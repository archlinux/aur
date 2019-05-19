# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=spl-dkms
pkgver=0.7.13
pkgrel=2
pkgdesc="Solaris Porting Layer kernel modules."
arch=('any')
url="https://zfsonlinux.org/"
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/zfsonlinux/spl.git#tag=spl-${pkgver}?signed"
        "0001-Linux-5.1-compat-get_ds-removed.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '7ff496450dd2ec451d7533d51664f47f6977b05441ed0e09cfccab94e4ff16dc'
            'a6f6e6a84ed93269e83b92aad7c0dea713e56529d2c47aed3c64940d8b4fe5c5')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}

    patch -p1 -i ../0001-Linux-5.1-compat-get_ds-removed.patch
    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*)?(${pkgname%-dkms}.release|Makefile)/!d
}" configure.ac

    autoreconf -fi
}

package() {
    cd "${srcdir}"/${pkgname%-dkms}

    dkmsdir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure Makefile.in META ${pkgname%-dkms}_config.h.in ${pkgname%-dkms}.release.in include/ module/ "${dkmsdir}"/
    cp config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/dkms.postbuild "${dkmsdir}"/scripts/

    ./scripts/dkms.mkconf -n ${pkgname%-dkms} -v ${pkgver} -f "${dkmsdir}"/dkms.conf
}
