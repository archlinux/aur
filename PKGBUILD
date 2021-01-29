# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=groupsdomainsextractor
pkgver=1.2.2
pkgrel=1
pkgdesc="Find all domains of specific group and copy it to clipboard"
url="https://github.com/PolishFiltersTeam/ScriptsPlayground/blob/master/Readme_GDE.md"
license=('MIT')
depends=('python' 'python-certifi' 'python-urllib3' 'python-beautifulsoup4' 'python-tldextract' 'python-pysimplegui' 'python-appdirs' 'python-html5lib')
makedepends=('unzip')
arch=('any')
source=(
	"https://github.com/PolishFiltersTeam/ScriptsPlayground/releases/download/GDE-$pkgver/GDE.zip"
  "LICENSE.txt"
)
sha256sums=('de399487adc99094dbaf00a22658befbb58b5d17ddcea8d3bc70c4e5de003363'
            '84c872a68ddd7b81d71673d560480dcaf0d83a7f694bb6521b2dbcebd2d2c912')

prepare() {
    mkdir -p "$srcdir"/opt/
    unzip GDE.zip -d "$srcdir"/opt/$pkgname/
    rm -rf "$srcdir"/opt/$pkgname/requirements.txt
}

package()
{
  mkdir -p "$pkgdir"/opt/$pkgname/
  cp -R "$srcdir"/opt/* "$pkgdir"/opt/

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/GDE" <<END
#!/bin/bash
python3 /opt/$pkgname/GDE.py "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/GDE.desktop" <<END
[Desktop Entry]
Version=1.0
Name=Groups Domains Extractor
Name[pl]=Ekstraktor Domen Grup
Comment=Finding all domains of specific group and copying it to clipboard
Comment[pl]=Odnajdywanie wszystkich domen danej grupy i kopiowanie ich do schowka
Exec=/usr/bin/GDE
Terminal=false
Type=Application
Categories=Utility;Application;
StartupNotify=false
END

  install -Dm644 "$srcdir"/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
