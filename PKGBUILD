# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=60.0.2
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=60')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('fc45758cb7f2bf44defbaaf43a7970926119970e34b80c5488ce84a4b8dcb6b4314d6555fed5d5a5a23707c463f40b1c82d0be317351f4418e0077b5ec1a98b2'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='285e8e32cdf2d4dbea0a264a34b745b09d45433a14ec9e084b735d51579de1ed64b3f56116758f151a154d2d5b12ee5f2cb40062f4924dbaaa98685abdf1682b'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=52.8.1
    provides=('firefox=52')
    sha512sums[0]='df78388aa501deedec4507805bd2afe55a97674edde6ad3ca2545d553d5fe6174fa818ae15f7368fc051f3318e68605bc5eaa8e42a2c3fd03256ab6ed07d27bc'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='df78388aa501deedec4507805bd2afe55a97674edde6ad3ca2545d553d5fe6174fa818ae15f7368fc051f3318e68605bc5eaa8e42a2c3fd03256ab6ed07d27bc'
fi
source=(https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
        install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    else
		install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    fi
}
