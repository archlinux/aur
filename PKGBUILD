# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=60.1.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=60')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('242def9bc065a1d10b5bf48dd2f4c40e035122b51451f6928a936f9699e347fa0838f5dcc8d910a65d4e46255035c55cbbd485822aafa190ece90aa6223ab870'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='bfdcc52df3cbfbc09b263ca3c99581d3be25a219eb762da3aae1024d2164975ee70296216accfc7c574a84613e258af24a35fb65cdcc039a863f1bf16519bad9'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=52.9.0
    provides=('firefox=52')
    sha512sums[0]='cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='f0f6b494eed4f84eb013065ed1a586efb03b50441023fea866306fbb65de3e7ebe5ff572575d868c17e3ca11958d90b1d6a8cffda0babfa8432e4bd3f19eda15'
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
