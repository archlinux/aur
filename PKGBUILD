# Maintainer:  <yatsen71@oarchbox1>
pkgname=zy-player-bin
_pkgname=zy-player
pkgver=2.8.3
_pkgver=$(echo $pkgver | sed 's/\./-/3')
pkgrel=1
epoch=
pkgdesc="跨平台视频资源播放器, 简洁免费无广告"
arch=('x86_64')
url="https://github.com/Hunlongyu/ZY-Player/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('zy-player')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
options=(!strip)
source=("https://github.com/Hunlongyu/ZY-Player/releases/download/v${_pkgver}/ZY-Player-${_pkgver}.AppImage"
        'zy-player.sh')
sha256sums=('fc6b6d5fd6592cb2d91f2409f14fcd3710acaf300ee623a86e2be53033d1c5bb'
            '4ef23f78868eaa861b979039102529779d6714e5faa1cf865ded1da8b3b83baf')

_filename=ZY-Player-${_pkgver}.AppImage

# dont compress for test, from /etc/makepkg.conf
#PKGEXT='.pkg.tar'
#PKGEXT='.pkg.tar.zst'

prepare() {
  cd "$srcdir"
  chmod +x $_filename
  "./$_filename" --appimage-extract >/dev/null 2>&1
  if [ -d "$srcdir/$pkgname-$pkgver" ]; then
    rm -rf "$srcdir/$pkgname-$pkgver"
  fi
  mv squashfs-root "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/AppRun/zy-player.sh/' zy.desktop
  #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #./configure --prefix=/usr
  #make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir/opt/zy-player/"
  find "usr/share/" -type f -exec install -vDm 644 {} "$pkgdir/{}" \;
  find "locales/" -type f -exec install -vDm 644 {} "$pkgdir/opt/zy-player/{}" \;
  find "resources/" -type f -exec install -vDm 644 {} "$pkgdir/opt/zy-player/{}" \;
  #find "usr/lib/" -type f -exec install -vDm 755 {} "$pkgdir/opt/zy-player/{}" \;
  #find -type f -exec install -vDm 755 {} "$pkgdir/opt/zy-player/{}" \;
  #rm -f "$pkgdir/opt/zy-player/zy"
  for f in `echo "chrome_100_percent.pak
      chrome_200_percent.pak
      resources.pak
      LICENSE.electron.txt
      LICENSES.chromium.html"`; do
    echo "$f $PWD"
    install -vDm 644 "$f" "$pkgdir/opt/zy-player/"
  done
  for f in `echo "snapshot_blob.bin
      v8_context_snapshot.bin
      icudtl.dat
      libffmpeg.so"`; do
    echo "$f $PWD"
    install -vDm 755 "$f" "$pkgdir/opt/zy-player/"
  done
  install -vDm 755 zy.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -vDm 755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/zy-player.sh"
  install -vDm 755 zy "$pkgdir/opt/zy-player/zy-player"
  sed -i 's/StartupWMClass=ZY Player/StartupWMClass=zy/' "$pkgdir/usr/share/applications/zy-player.desktop"
}

# vim:set ts=2 sw=2 et:
