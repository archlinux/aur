# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=fsport
pkgver=3.5
pkgrel=1
pkgdesc="The original FreeSpace campaigns ported to FreeSpace 2"
arch=('any')
url="http://fsport.hard-light.net/website/"
license=('custom:noncommercial')
depends=('fs2_open')
optdepends=('fs2_open-mediavps: Hi-res FS2 resources'
            'fsport-mediavps: Hi-res FS1 resources'
            'fsport-tangovps: Hi-res Command Brief animations')
source=(fsport.sh fsport.desktop LICENSE
        'http://fsport.freespacemods.net/releases/fsport3_5.7z'
        'http://fsport.freespacemods.net/releases/fsport-missions.7z'
        'http://fsport.freespacemods.net/releases/sparky_hi_fs1.7z')
sha256sums=('e443c079fe7c2bc6ed85028aa16cfe83d4b159511e83f0ae2448bb8f845e8b2f'
            'c7c64510205f78eabc4ff52fa134da7a0877e1a768253cd2e8de9c67af994f3e'
            '79462ffe82b8cf371f37a3444a8e17165d293e797a865b9c4312f86d00ddf4ec'
            '6af05e1ac58aeecb6e61cb3f9dd5e72499f59b1c577e78a78c537928a6f8319b'
            '13c5d2f78c72d6f6acf1dcc1009467c9627fe1378f5e5097c63802dce236c658'
            '6a202a6d954fcc52c0483d2b532cef1e2be61dc08f1d0f5a07609b6e889c3452')
noextract=(fsport3_5.7z
           fsport-missions.7z
           sparky_hi_fs1.7z)

# Prevent compression
PKGEXT=".pkg.tar"

prepare() {
  cd "$srcdir"
  mkdir "$pkgname" && cd "$pkgname" || return 1
  for sz in ../*.7z; do
    bsdtar -xf $sz
  done

  rm -f *.bat
}

package() {
  cd "$srcdir"

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -D -m 755 fsport.sh "$pkgdir"/usr/bin/fsport
  install -D -m 644 fsport.desktop "$pkgdir"/usr/share/applications/fsport.desktop

  mkdir -p "$pkgdir"/opt/fs2_open || return 1

  # Not really proper to use mv, but saves space and time
  mv "$pkgname" "$pkgdir"/opt/fs2_open
}
