# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=signald
pkgver=0.15.0
pkgrel=2
pkgdesc='An unofficial daemon that facilitates communication with the Signal messaging app.'
url='https://gitlab.com/signald/signald'
license=('GPL3')
arch=('any')
makedepends=('gradle')
depends=('java-runtime>=11' "java-runtime<16")
optdepends=('qrencode: display account linking token as QR code')
conflicts=('signald-git')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/signald/signald/-/archive/${pkgver}/signald-${pkgver}.tar.gz"
        'gradle-no-daemon.patch')
sha512sums=('f733ec8022082b33cbb18e38c1cba8c3028a28540989aa8838a9bf3021b6ee16a439c925851a7db02154137804a1c8acc81b9228c3b1125417926603690e4979'
            'aa2ff9eef6ebd8ad31275a587b7b24e34938e9744b06892c96d43e274b18a15d2f0258f56cea8fea9163e85a754ebde1e66c20781876bcb524960defe02ce535')

backup=('var/lib/signald/data')
#install="${pkgname}.install"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 < ${srcdir}/gradle-no-daemon.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make installDist
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm "build/install/signald/bin/signald.bat"
    install -dm755 "${pkgdir}/var/lib/signald/data"
    cp -dr --no-preserve=ownership "build/install/signald/" "${pkgdir}/var/lib/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s ../../var/lib/signald/bin/signald "${pkgdir}/usr/bin/signald"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/debian/signald.service" "${pkgdir}/usr/lib/systemd/system/signald.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 
    # systemd sysusers https://archlinux.org/todo/switch-to-systemd-sysusers/
    mkdir "${pkgdir}/usr/lib/sysusers.d/"
    mkdir "${pkgdir}/usr/lib/tmpfiles.d/"
    echo 'u signald - "Signald Daemon User"' > "${pkgdir}/usr/lib/sysusers.d/signald.conf"
    echo 'Z /var/lib/signald 0700 signald signald - -' > "${pkgdir}/usr/lib/tmpfiles.d/signald.conf"
}
