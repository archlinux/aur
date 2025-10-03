# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=moonscraper-chart-editor
pkgname=${_pkgname}-bin
pkgdesc="Moonscraper Chart Editor is a song editor for Guitar Hero style rhythm games."
pkgver=1.5.12
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/FireFox2000000/Moonscraper-Chart-Editor"
arch=("x86_64"
      "i686")
license=("BSD-3-Clause")
_commit="$pkgver"
source=("moonscraper-$pkgver.tar.gz"::"https://github.com/FireFox2000000/Moonscraper-Chart-Editor/releases/download/$pkgver/Moonscraper.Chart.Editor.v$pkgver.Linux.Universal.tar.gz"
        "$_pkgname.desktop"::"https://raw.githubusercontent.com/FireFox2000000/Moonscraper-Chart-Editor/$_commit/aur/moonscraper-chart-editor.desktop"
        "LICENSE"::"https://raw.githubusercontent.com/FireFox2000000/Moonscraper-Chart-Editor/$_commit/LICENSE")
sha1sums=('16b7225bb3daba923aef3b1145e69400132cf873'
          'e4c64c84730ee05b26e521537fc09fa82925fe72'
          '2d61750d08d43082718a1548810f76be186a9030')
b2sums=('29f22cb6eec0e8976453afea9be187cd027f90ea013d469e95892ae7bc11438538beb49ad5cf06293f1a58b7f5486293e5431b82b4ad449afc094d9391745957'
        '83253333bbc384026b0adc2ec7a489dccc1b22205eb190ed764e8604e2bb48f9d9dd882a395234ab618c84d33094ef74c5d124091c11757b078f4f722e04afa0'
        '2c77abcaab52025cd9813a4139463b891bcb6efd1b2728a6d4e4ee4512cc89e7908cf5108220379df6b532001086f303d4ac2e4614696459348cda92992eeb3e')
options=(!strip)

prepare() {
  # Fix the desktop file
  sed -i -E "s:moonscraper-chart-editor-git:moonscraper-chart-editor:" "$_pkgname.desktop"
}

package() {
  find "$srcdir" -maxdepth 1 -type d -name "Moonscraper Chart Editor * Linux (Universal)" -exec mv '{}' "$srcdir/moonscraper" \;
  if [ "$CARCH" = "i686" ]; then
    _UNITY_ARCH=x86
  else
    _UNITY_ARCH=$CARCH
  fi
  _executable="Moonscraper Chart Editor.$_UNITY_ARCH"

  # Install application to /opt
	install -d "$pkgdir/opt/$_pkgname"
  cp "$srcdir/moonscraper/$_executable" "$pkgdir/opt/$_pkgname/"
  cp -R "$srcdir/moonscraper/Moonscraper Chart Editor_Data" "$pkgdir/opt/$_pkgname/"
  printf "#\041/bin/sh\nexec \"/opt/$_pkgname/$_executable\" \"\$@\"" > "$pkgdir/opt/$_pkgname/$_pkgname"
  chmod 755 "$pkgdir/opt/$_pkgname/$_pkgname"

  # Install binary symlink and desktop files
  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications,licenses}}
  ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications"
  
  # Icon
  ln -s "/opt/$_pkgname/Moonscraper Chart Editor_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # License
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm 644 "$srcdir/moonscraper/Documentation/attribution.txt" "$pkgdir/usr/share/licenses/$_pkgname/attribution.txt"
}
