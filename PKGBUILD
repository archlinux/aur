# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# 17-Apr-2023
#

pkgname=c-evo
_pkgname=c-evo-dh
pkgver=1.8
pkgrel=1
pkgdesc="C-evo: Distant Horizon, Empire Building Game"
arch=('x86_64')
url="https://sourceforge.net/projects/c-evo-eh/"
license=('GPL2' 'CCPL')
makedepends=('fpc' 'lazarus-gtk2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo' 'c-evo-bin' 'c-evo-eh')
source=("$url/files/Source/${_pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('6a948a413ee9e17d80318c0135fe7445ab9fd87495497adb515e81540c841fbe')
#options=(debug !strip)


# Arch does not use games or libexec folders
prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s|share/games|share|"   Linux/$pkgname-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|" Linux/$pkgname-launch-gtk2
  sed -i "s|/usr/libexec|/usr/lib/$_pkgname|" Linux/$pkgname-launch-gtk2
}


build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Set temporary folder for lazarus primary config
  rm -fr "$srcdir/config"
  mkdir  "$srcdir/config"

  # clean
  rm -f *.cfg
  rm -f AI/StdAI/*.cfg
  rm -f Packages/CevoComponents/*.cfg
  rm -f Packages/Common/*.cfg
  rm -fr lib
  rm -fr Packages/CevoComponents/lib
  rm -fr Packages/Common/lib
  rm -fr AI/StdAI/lib
  rm -fr AI/StdAI/lib
  rm -f  AI/StdAI/*.so
  rm -f  AI/StdAI/*.o
  rm -f  AI/StdAI/*.ppu
  rm -f  AI/StdAI/*.res
  rm -f  AI/StdAI/*.s
  rm -f  *.res *.trc *.o *.ppu *.so
  rm -f  "$_pkgname-gtk2  $_pkgname-gtk2.dbg"

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' Pascal/Release.cfg

  # Build AI module
  cp Pascal/Release.cfg      AI/StdAI/fpc.cfg
  cd AI/StdAI
  fpc -B -olibstdai.so StdAI.lpr

  # Build GTK program
  cd ../../
  cp Pascal/Release.cfg  fpc.cfg
  cp Pascal/Release.cfg  Packages/CevoComponents/fpc.cfg
  cp Pascal/Release.cfg  Packages/Common/fpc.cfg

  lazbuild -v
  lazbuild --ws=gtk2 -B --bm=Release --lazarusdir=/usr/lib/lazarus --pcp="$srcdir/config" Integrated.lpi
  mv "$pkgname" "$_pkgname-gtk2"
}


package() {
  cd "$_pkgname-$pkgver"

  install -Dm 755 "$_pkgname-gtk2"                    -t "$pkgdir/usr/lib/$_pkgname"
  install -Dm 755 "Linux/$pkgname-launch-gtk2"       -t "$pkgdir/usr/bin"
  install -Dm 755 AI/StdAI/libstdai.so               -t "$pkgdir/usr/lib/$_pkgname"
  
  install -Dm 644 AI/StdAI/StdAI.png                 -t "$pkgdir/usr/share/$_pkgname/AI/StdAI"
  install -Dm 644 AI/StdAI/StdAI.ai.txt              -t "$pkgdir/usr/share/$_pkgname/AI/StdAI"
  ln -s "/usr/lib/$_pkgname/libstdai.so"        "$pkgdir/usr/share/$_pkgname/AI/StdAI/libstdai.so"

  install -Dm 644 "Desktop/$pkgname-manual-gtk2.desktop"  -t "$pkgdir/usr/share/applications"
  install -Dm 644 "Desktop/$_pkgname-gtk2.desktop"    -t "$pkgdir/usr/share/applications"
  install -Dm 644 "Desktop/$_pkgname.svg"             -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 readme.txt                         -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 Docs/*                             -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 "Linux/$_pkgname-gtk2.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm 644 "Man/$pkgname-launch-gtk2.6"       -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 Language.txt                       -t "$pkgdir/usr/share/$_pkgname"
  install -Dm 644 Language2.txt                      -t "$pkgdir/usr/share/$_pkgname"
  install -Dm 644 Fonts.txt                          -t "$pkgdir/usr/share/$_pkgname"
  install -Dm 644 Graphics/*.png                     -t "$pkgdir/usr/share/$_pkgname/Graphics"
  install -Dm 644 Graphics/*.jpg                     -t "$pkgdir/usr/share/$_pkgname/Graphics"
  install -Dm 644 Graphics/*.grs                     -t "$pkgdir/usr/share/$_pkgname/Graphics"
  install -Dm 644 Help/*                             -t "$pkgdir/usr/share/$_pkgname/Help"
  install -Dm 644 Maps/*                             -t "$pkgdir/usr/share/$_pkgname/Maps"
  install -Dm 644 Saved/*                            -t "$pkgdir/usr/share/$_pkgname/Saved"
  install -Dm 644 Sounds/*                           -t "$pkgdir/usr/share/$_pkgname/Sounds"
  install -Dm 644 Tribes/*                           -t "$pkgdir/usr/share/$_pkgname/Tribes"

  find Localization -type f -exec install -Dm 644    "{}" "$pkgdir/usr/share/$_pkgname/{}" \;
}
