# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=xplor-nih
pkgver=2.53
pkgrel=1
pkgdesc="XPLOR-NIH is a structure determination program which builds on the X-PLOR program, including additional tools developed at the NIH"
arch=('x86_64')
url="https://nmr.cit.nih.gov/xplor-nih/"
license=('custom')
depends=('ncurses5-compat-libs' 'libselinux')
source=('LICENSE'
        "${pkgname}.md5")
md5sums=('SKIP'
         'SKIP')
options=('!strip')

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

    sed -i "s|pwd=\`pwd\`|pwd=/opt/${pkgname}-${pkgver}|" "${pkgname}-${pkgver}/configure"
    sed -i "s|XPLOR_DIR=__XPLOR_DIR__|XPLOR_DIR=$(pwd)/${pkgname}-${pkgver}|" "${pkgname}-${pkgver}/bin/xplor.in"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure

    # revert change from prepare()
    sed -i "s|^XPLOR_DIR=.*$|XPLOR_DIR=/opt/${pkgname}-${pkgver}|" "bin/xplor"
}

package() {
    install -d "${pkgdir}/usr/bin"
    eval $(cat "${pkgname}-${pkgver}/configure" | awk '/scriptFiles=/,/"$/ { gsub(/\\/, ""); print }')
    for script in getBest findXcookie $scriptFiles; do
        ln -s "/opt/${pkgname}-${pkgver}/bin/$script" "${pkgdir}/usr/bin/"
    done

    install -d "${pkgdir}/opt/"
    cp --recursive "${pkgname}-${pkgver}" "${pkgdir}/opt/"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
