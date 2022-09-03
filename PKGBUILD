# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=signald
pkgver=0.21.1
pkgrel=1
pkgdesc='An unofficial daemon that facilitates communication with the Signal messaging app.'
url='https://gitlab.com/signald/signald'
license=('GPL3')
arch=('any')
makedepends=('gradle')
depends=('java-runtime')
optdepends=('qrencode: display account linking token as QR code')
conflicts=('signald-git')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/signald/signald/-/archive/${pkgver}/signald-${pkgver}.tar.gz"
        'gradle-no-daemon.patch')
sha512sums=('3a86dd62b1730bab5b11043080b66358f77080c021ee901db1403c071b543cad29c74eb5d8a70c1488d4805e99a7de56313089a6a675de1ea83dabaa27a84250'
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
    echo 'Z /var/lib/signald 0750 signald signald - -' > "${pkgdir}/usr/lib/tmpfiles.d/signald.conf"
}
