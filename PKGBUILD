# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=14.11.100
pkgrel=1
pkgdesc="Desktop client for FAU's file synchronization service."
arch=('any')
url="https://www.fau.eu/intranet/tools/faubox-cloud-storage-for-all-fau-members/"
license=(custom)
depends=('jre8-openjdk')

source=("https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha256sums=("9a04b17bacb17a72a5101033a9006d93a2b21a63c87319d0a00ac333c916acd4")

_install_dir="/opt/${pkgname}"

prepare() {
    # tell the start script the installation location
    sed -i "s:CLIENT_INSTALL=.:CLIENT_INSTALL=${_install_dir}:g" ${srcdir}/FAUbox/FAUbox-Client.sh
    
    # make sure FAUbox starts using the appropriate jvm
    sed -i "s:\$CLIENT_INSTALL/jre/bin/java:/usr/lib/jvm/java-8-openjdk/jre/bin/java:g" ${srcdir}/FAUbox/FAUbox-Client.sh
    
    # same for the desktop file
    sed -i "s:Exec=/usr/share/FAUbox/FAUbox-Client.sh:Exec=${_install_dir}/FAUbox-Client.sh:g" ${srcdir}/FAUbox/install-files/FAUbox.desktop
}

package() {
    cd ${srcdir}/FAUbox

    install -Dm644 FAUbox.jar ${pkgdir}${_install_dir}/FAUbox.jar
    install -Dm655 FAUbox-Client.sh ${pkgdir}${_install_dir}/FAUbox-Client.sh
    install -Dm644 VERSION ${pkgdir}${_install_dir}/VERSION
    install -Dm644 README ${pkgdir}${_install_dir}/README
    
    install -Dm644 install-files/FAUbox.desktop ${pkgdir}/usr/share/applications/FAUbox.desktop
    install -Dm644 install-files/FAUbox.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/FAUbox.png
    
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
