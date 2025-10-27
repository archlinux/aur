# Maintainer:  schnur[at]i2pmail.org
# Forked from: Salama <salama@salama.xyz>, skydrome <skydrome@protonmail.com>

pkgname=i2pplus
pkgver=2.10.0
pkgrel=5
pkgdesc="enhanced version of the Java I2P anonymizing network"
url="i2pplus.github.io"
license=('PD with exeptions')
arch=('any')
depends=('java-runtime>=13' 'java-service-wrapper' 'sed')
noextract=('i2pinstall.exe')

source=("https://i2pplus.github.io/installers/i2pinstall.exe")
# For better security, the sha256sum is provided by the .onion and .i2p mirror.
sha256sums=('04010ae71be97d114210504d95f65948600fc2294902dd8175287af2ddd56ce5')

package() {
    cd "$pkgdir"

    echo "INSTALL_PATH=/opt/i2pplus" >install.properties
    java -jar "$srcdir/i2pinstall.exe" \
         -options install.properties \
         -language eng
    rm -f install.properties
    echo "RUN_AS_USER=${USER}" >> "opt/i2pplus/i2prouter"
    chown -R "$USER:$USER" "opt/i2pplus"
    sed -i '30s#/root#/home/'"$USER"'#;33s#/root#/home/'"$USER"'#' opt/i2pplus/i2prouter 
    # dont automatically start the webserver(3) or open a webbrowser(4)
    sed -i opt/i2pplus/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
}

echo  "You can start I2P+ with '/opt/i2pplus/i2prouter start', consider running '/opt/i2pplus/i2prouter install' too (optionally)."
