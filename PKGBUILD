# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=xplor-nih
pkgver=2.47
pkgrel=1
pkgdesc="XPLOR-NIH is a structure determination program which builds on the X-PLOR program, including additional tools developed at the NIH"
arch=('x86_64')
url="https://nmr.cit.nih.gov/xplor-nih/"
license=('custom')
install=${pkgname}.install
depends=(ncurses5-compat-libs)
source=('LICENSE'
        "${pkgname}.md5")
md5sums=('SKIP'
         'SKIP')

prepare() {
    if [[ ! -r "../${pkgname}-${pkgver}-db.tar.gz" || ! -r "../${pkgname}-${pkgver}-Linux_x86_64.tar.gz" ]]; then
        echo "You must download XPLOR-NIH on your own from the project webpage: ${pkgname}-${pkgver}-db.tar.gz and ${pkgname}-${pkgver}-Linux_x86_64.tar.gz"
        return 1
    fi
    if ! md5sum --quiet --check ${pkgname}.md5; then
        echo "Invalid checksum!"
        return 1
    fi

    bsdtar xfz ../${pkgname}-${pkgver}-db.tar.gz
    bsdtar xfz ../${pkgname}-${pkgver}-Linux_x86_64.tar.gz
}

package() {
    install -d "${pkgdir}/etc/profile.d/"
    install -d "${pkgdir}/opt/"

    echo "export PATH=\$PATH:/opt/${pkgname}-${pkgver}/bin:/opt/${pkgname}-${pkgver}/bin.Linux_x86_64" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
	cp -R "${pkgname}-${pkgver}" "${pkgdir}/opt/"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
