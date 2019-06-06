# Contributor: Monika Schrenk <moni@random-access.org>
# Contributor: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=studio-3t
pkgver=2019.3.0
pkgrel=1
pkgdesc="The professional workspace for MongoDB (formerly known as MongoChef)"
arch=('x86_64')
url="https://studio3t.com"
license=("custom")
depends=('gtk2')
makedepends=('gendesk' 'unzip')
provides=('studio-3t')
replaces=('mongochef')

source=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x64.tar.gz")
            
sha256sums=('70a0ec13e949c6438f57186bb79a1e2872a4c3f9eb410eb162e688946463b8a3')

prepare() {
    # Extract, rename and add execution permision
    tar xzvf ${pkgname}-${pkgver}.tar.gz && for file in *.sh; do mv "$file" ${pkgname}.sh; done && chmod +x ${pkgname}.sh

    # unattended mode
    sh ./${pkgname}.sh -q -dir ${srcdir}/${pkgname} -overwrite

    # Generate Desktop File
    cd ${srcdir}
    gendesk -f -n \
                --name "Studio 3T" \
                --pkgname "$pkgname" \
                --pkgdesc "$pkgdesc" \
                --categories="Science;Education;Developmenti;Application"
}

package() {
    cd ${srcdir}
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm644 ${pkgname}/.install4j/Studio-3T.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    cp -R ${pkgname}/. ${pkgdir}/opt/${pkgname}

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    #cd ${srcdir}
    ln -s "/opt/$pkgname/Studio-3T" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
