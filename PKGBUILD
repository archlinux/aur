# Contributor: Monika Schrenk <moni@random-access.org>
# Contributor: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=studio-3t
pkgver=2018.6.1
pkgrel=1
pkgdesc="The professional workspace for MongoDB (formerly known as MongoChef)"
arch=('i686' 'x86_64')
url="https://studio3t.com"
license=("custom")
depends_i686=('java-runtime-openjdk=8' 'java-openjfx')
depends=('gtk2')
makedepends=('unzip')
provides=('studio-3t')
replaces=('mongochef')

source_i686=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x86-no-shell.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x64.tar.gz")
            
sha256sums_i686=('d528914393520670132deef47ddbc8f04120f5df81f6fa77cbdeac7cdfa77188')
sha256sums_x86_64=('f4dde76b4407f63a0ca4f04cac9318aec3ba6be56e54a601810a616f3698dfae')

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
