# $Id$
# Maintainer: kvaps <kvapss@gmail.com>

pkgname=keepass-wine
pkgver=2.34
pkgrel=1
pkgdesc='A easy-to-use password manager for Windows, Linux, Mac OS X and mobile devices.'
arch=('any')
url='http://keepass.info/'
license=('GPL')
depends=('wine' 'desktop-file-utils' 'xdg-utils' 'shared-mime-info' 'gtk-update-icon-cache')
provides=('keepass')
conflicts=('keepass')
makedepends=('icoutils')
optdepends=('xdotool: if you want to use auto-type'
            'xsel: clipboard operations')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/keepass/KeePass-$pkgver.zip"
        "http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/dotnetfx.exe"
        'keepass'
        'keepass.1'
        'keepass.desktop'
        'keepass.xml'
        'KeePass.ico')

sha256sums=('52dd5a8526cc935b0e240d5ab6402b0b4a3f5f09ad1a6919875878d7f36c697f'
            '46693d9b74d12454d117cc61ff2e9481cabb100b4d74eb5367d3cf88b89a0e71'
            '08ac90c19da3208d24a94d72d111e802c85f0655ec43d79d7cfb6a35f5679f73'
            'a5fff678466443c0c8256c4771128c86103da47b6a2c49351d9941191b65dd6f'
            '1d5420e8babce5f4bbb3c68bdffe3bc0d3c3be25ad689138cd02fa14edd89140'
            '3d017c17a8788166c644e2460ba3596fd503f300342561921201fe5f69e5d194'
            'd08ebdd9b0a99f6dc4f62bb20d7bb9ce6ab3139fcb31c8830954e16ebbd3d058')

validpgpkeys=('D95044283EE948D911E8B606A4F762DC58C6F98E')

prepare() {
  # Extract icons
  icotool -x KeePass.ico
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/keepass/XSL

  install -Dm755 keepass "$pkgdir"/usr/bin/keepass
  install -Dm755 dotnetfx.exe "$pkgdir"/usr/share/keepass/dotnetfx.exe
  install -Dm755 KeePass.exe "$pkgdir"/usr/share/keepass/KeePass.exe
  install -Dm755 KeePass.exe.config "$pkgdir"/usr/share/keepass/KeePass.exe.config
  install -m644 XSL/* "$pkgdir"/usr/share/keepass/XSL
  install -Dm644 keepass.1 "$pkgdir"/usr/share/man/man1/keepass.1

  # Proper installation of .desktop file
  desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keepass.desktop

  # Install icons
  for size in 16 32 48 256; do
    install -Dm644 \
    KeePass_*_${size}x${size}x32.png \
    "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/keepass.png
  done

  # Needed for postinst with xdg-utils
  install -Dm644 keepass.xml "$pkgdir"/usr/share/mime/packages/keepass.xml
}
