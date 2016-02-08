# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-portable
pkgver=2.10.3
pkgrel=4
pkgdesc='NO MONO REQUIRED-AirVPN client "Eddie" based on OpenVPN, portable version.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(openvpn stunnel)
provides=('airvpn')
conflicts=('airvpn' 'airvpn-bin' 'airvpn-beta-bin')
install=airvpn.install
source_i686=("https://airvpn.org/repository/${pkgver%.*}/airvpn_linux_x86_portable.tar.gz"
             'https://raw.githubusercontent.com/AirVPN/airvpn-client/master/resources/debian/usr/share/applications/AirVPN.desktop'
             'https://raw.githubusercontent.com/AirVPN/airvpn-client/master/resources/debian/usr/share/pixmaps/AirVPN.png')
source_x86_64=("https://airvpn.org/repository/${pkgver%.*}/airvpn_linux_x64_portable.tar.gz"
               'https://raw.githubusercontent.com/AirVPN/airvpn-client/master/resources/debian/usr/share/applications/AirVPN.desktop'
               'https://raw.githubusercontent.com/AirVPN/airvpn-client/master/resources/debian/usr/share/pixmaps/AirVPN.png')
md5sums_i686=('9d66655c14e8c57a6414e119877958be'
              '9592ea724c575cb8d6c9b20a21c8b765'
              'e71d6195dd1fb9b6193d60c5d060a11f')
md5sums_x86_64=('ddf511cf4968196126904214c38d2f87'
                '9592ea724c575cb8d6c9b20a21c8b765'
                'e71d6195dd1fb9b6193d60c5d060a11f')
sha256sums_i686=('a01d05e2cb2028b8172fd26052e902c52b0240c1f855c9338bfa6f8e17c26db2'
                 '6c604d8a42183be229ec76aaa7c37a9136735c5c7f5b8d7aa9c290fe939e4f36'
                 '8a6454b4296de11e03c0b86e5c7f18ae4fb7f9844b7b16727b39b74d11ad76a8')
sha256sums_x86_64=('81e1fdfe492aad8c7d2cf5b3b1aea83d7bc2f42679ea825a18d48f42155daea4'
                   '6c604d8a42183be229ec76aaa7c37a9136735c5c7f5b8d7aa9c290fe939e4f36'
                   '8a6454b4296de11e03c0b86e5c7f18ae4fb7f9844b7b16727b39b74d11ad76a8')

package() {
    cd $srcdir/airvpn_linux_x??_portable
    msg2 "Moving stuff in place..."
    for i in airvpn libgdiplus.so.0 libMonoPosixHelper.so update-resolv-conf; do
        install -Dm755 $i "$pkgdir$HOME/airvpn/$i"; done

    msg2 "Set proper home directory in install file..."
    sed -i "s|\$HOME|$HOME|g" $startdir/airvpn.install
    chmod 700 "$pkgdir$HOME"
    chown -R $USER:users "$pkgdir$HOME/airvpn"

    ## Fix .desktop file for KDE
    if [ -f "/usr/bin/dolphin" ]; then
      msg2 "Installing desktop file for KDE..."
      cd $srcdir
      install -Dm644 "$srcdir/AirVPN.png"  "$pkgdir/usr/share/pixmaps/airvpn.png"
      cp "$srcdir/AirVPN.desktop" "$srcdir/airvpn.desktop"
      desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
      --dir="$pkgdir/usr/share/applications/" --add-category="Qt;KDE"\
      --set-icon="/usr/share/pixmaps/airvpn.png" "airvpn.desktop"
    else
    msg2 "Installing desktop file..."
    install -Dm644 "$srcdir/AirVPN.png"  "$pkgdir/usr/share/pixmaps/AirVPN.png"
    desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
    --dir="$pkgdir/usr/share/applications/" "$srcdir/AirVPN.desktop"
    fi
}
