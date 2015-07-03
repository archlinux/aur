# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=openbve
pkgver=1.4.3
pkgrel=2
pkgdesc="Free-as-in-freedom train simulator placed in the public domain"
arch=('any')
url="http://odakyufan.zxq.net/openbve/"
license=('custom:public domain')
depends=('mono' 'taoframework' 'sdl' 'openal')
source=(http://pkgbuild.com/~bgyorgy/sources/$pkgname-$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
md5sums=('ea665ae920add94157b1f49e8e685c56'
         'fec92946f773f56588a71de310847ce0'
         'acb0dd3ea602910181b8cdb8375c794e')

build() {
  cd $pkgname-$pkgver/SourceCode/openBVE
  xbuild /p:Configuration=Release OpenBve/OpenBve.csproj
  xbuild /p:Configuration=Release OpenBveAts/OpenBveAts.csproj
  xbuild /p:Configuration=Release Sound.Flac/Sound.Flac.csproj
  xbuild /p:Configuration=Release Sound.RiffWave/Sound.RiffWave.csproj
  xbuild /p:Configuration=Release Texture.Ace/Texture.Ace.csproj
  xbuild /p:Configuration=Release Texture.BmpGifJpegPngTiff/Texture.BmpGifJpegPngTiff.csproj
}

package() {
  cd $pkgname-$pkgver

  # Data
  install -dm755 "$pkgdir/usr/lib/$pkgname/"
  install -dm755 "$pkgdir/usr/share/games/$pkgname/"
  cp -r Data "$pkgdir/usr/share/games/$pkgname/"
  ln -s ../../share/games/$pkgname/Data "$pkgdir/usr/lib/$pkgname/Data"
  chmod 755 "$pkgdir"/usr/lib/$pkgname/Data/Compatibility/{PreTrain,Signals/Graphics}

  # Binaries
  install -d "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 SourceCode/openBVE/OpenBve/bin/Release/OpenBve.exe "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 SourceCode/openBVE/OpenBve/bin/Release/OpenBveApi.dll "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 SourceCode/openBVE/OpenBveAts/bin/Release/OpenBveAts.dll "$pkgdir/usr/lib/$pkgname/Data/Plugins/"
  install -Dm644 SourceCode/openBVE/Sound.Flac/bin/Release/Sound.Flac.dll "$pkgdir/usr/lib/$pkgname/Data/Plugins/"
  install -Dm644 SourceCode/openBVE/Sound.RiffWave/bin/Release/Sound.RiffWave.dll "$pkgdir/usr/lib/$pkgname/Data/Plugins/"
  install -Dm644 SourceCode/openBVE/Texture.Ace/bin/Release/Texture.Ace.dll "$pkgdir/usr/lib/$pkgname/Data/Plugins/"
  install -Dm644 SourceCode/openBVE/Texture.BmpGifJpegPngTiff/bin/Release/Texture.BmpGifJpegPngTiff.dll "$pkgdir/usr/lib/$pkgname/Data/Plugins/"

  # Executable
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Desktop file and icon
  install -Dm644 "$srcdir/$pkgname.desktop" $pkgdir/usr/share/applications/$pkgname.desktop
  mkdir -p "$pkgdir/usr/share/pixmaps"
  ln -s ../games/$pkgname/Data/Menu/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # License
  install -Dm644 Credits.txt "$pkgdir/usr/share/licenses/$pkgname/Credits.txt"
}
