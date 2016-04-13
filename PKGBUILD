# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=openbve
_pkgname=OpenBVE
pkgver=1.4.3
_gitrev=f9d51d9e75530e8e685b35bf7185fe6ff90c23fc
pkgrel=3
pkgdesc="Free-as-in-freedom train simulator placed in the public domain"
arch=('any')
url="https://github.com/leezer3/OpenBVE"
license=('MIT' 'custom:public domain')
depends=('libxi' 'mono' 'openal')
source=(https://github.com/leezer3/$_pkgname/archive/$_gitrev.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('078d3153769527988e5c457241eb2f4cb68618a275d9217b53832924b018acf4'
            'b65ab9522b920fa2750d0cdfddcf54db4b6b814f6f61cbff6553dccba0c7d6e0'
            '89752bcd843b3e14c22ee73560c12fe3b3afc06d89891cdb80b80fc7fd7b5f38')

build() {
  cd $_pkgname-$_gitrev/openBVE
  xbuild /p:Configuration=Release OpenBve/OpenBve.csproj
}

package() {
  cd $_pkgname-$_gitrev/openBVE

  # Binaries
  install -dm755 "$pkgdir/usr/lib/$pkgname/"
  cp -r OpenBve/bin/Release/* "$pkgdir/usr/lib/$pkgname/"

  # Data
  install -dm755 "$pkgdir/usr/share/games/$pkgname/"
  mv "$pkgdir/usr/lib/$pkgname/Data" "$pkgdir/usr/share/games/$pkgname/"
  ln -s ../../share/games/$pkgname/Data "$pkgdir/usr/lib/$pkgname/Data"

  # Executable
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Desktop file and icon
  install -Dm644 "$srcdir/$pkgname.desktop" $pkgdir/usr/share/applications/$pkgname.desktop
  mkdir -p "$pkgdir/usr/share/pixmaps"
  ln -s ../games/$pkgname/Data/Menu/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # License
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../CSSCriptLicence.txt ../OpenTKLicence.txt ../Readme.md ../SharpCompressLicence.txt \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
