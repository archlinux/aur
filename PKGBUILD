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
makedepends=('icoutils' 'mono')
optdepends=('xdotool: if you want to use auto-type'
            'xsel: clipboard operations')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/keepass/KeePass-$pkgver-Source.zip"
        "http://keepass.info/integrity/v2/KeePass-$pkgver-Source.zip.asc"
        "http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/dotnetfx.exe"
        'keepass'
        'keepass.1'
        'keepass.desktop'
        'keepass.xml')

sha256sums=('e3f184e4deddd1aa5ee2b52e2373c772d3f3975e5eddb2fd729eb27b437011aa'
            'SKIP'
            '46693d9b74d12454d117cc61ff2e9481cabb100b4d74eb5367d3cf88b89a0e71'
            'a44456b7da55432867bcdfdda051a5b25601616a943fdc1dd1be30bd562f7ffb'
            'a5fff678466443c0c8256c4771128c86103da47b6a2c49351d9941191b65dd6f'
            '1d5420e8babce5f4bbb3c68bdffe3bc0d3c3be25ad689138cd02fa14edd89140'
            '3d017c17a8788166c644e2460ba3596fd503f300342561921201fe5f69e5d194')
validpgpkeys=('D95044283EE948D911E8B606A4F762DC58C6F98E')

prepare() {
  # "Convert" to mono 4.0
  sed -i '1s/ 10.00/ 11.00/' KeePass.sln
  find . -name "*.csproj" -exec sed -i '1s/"3.5"/"4.0"/' {} +

  # Extract icons
  icotool -x KeePass/KeePass.ico

  pushd Build &>/dev/null
  LANG=en_US.UTF-8 bash PrepMonoDev.sh
  popd &>/dev/null
}

build() {
  export WINEPREFIX=`pwd`/wine
  export WINEARCH=win32
  wine dotnetfx.exe /q:a /c:”install.exe /q”
  #wine 'C:\windows\Microsoft.NET\Framework\v2.0.50727\MSBuild.exe' KeePass.sln /property:Configuration=Release
  xbuild /target:KeePass /property:Configuration=Release
  cp Ext/KeePass.exe.config Build/KeePass/Release/
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/keepass/XSL
  install -dm755 "$pkgdir"/usr/share/keepass/wine

  install -Dm755 keepass "$pkgdir"/usr/bin/keepass
  install -Dm755 Build/KeePass/Release/KeePass.exe "$pkgdir"/usr/share/keepass/KeePass.exe
  install -Dm755 Ext/KeePass.config.xml "$pkgdir"/usr/share/keepass/KeePass.config.xml
  install -Dm755 Ext/KeePass.exe.config "$pkgdir"/usr/share/keepass/KeePass.exe.config

  install -m644 Ext/XSL/* "$pkgdir"/usr/share/keepass/XSL

  install -Dm644 keepass.1 "$pkgdir"/usr/share/man/man1/keepass.1

  cp -dr --no-preserve=ownership wine "$pkgdir"/usr/share/keepass/

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
