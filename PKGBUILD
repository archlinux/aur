# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# 31-Aug-2022
#

pkgname=c-evo-dh
pkgbase=c-evo
pkgver=1.2
pkgrel=1
pkgdesc="C-evo: Distant Horizon, Empire Building Game"
arch=('x86_64')
url="https://sourceforge.net/projects/c-evo-eh/"
license=('GPL2' 'CCPL')
makedepends=('fpc' 'lazarus-gtk2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo' 'c-evo-bin' 'c-evo-eh')
source=("https://sourceforge.net/projects/c-evo-eh/files/Source/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('b4eadc87b8729ebc5e57e41a0a257044ed7e07eafc1d7ea413bd9bfc493001c1')
#options=(debug !strip)


# Arch does not use games or libexec folders
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|share/games|share|"   Linux/$pkgbase-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|" Linux/$pkgbase-launch-gtk2
  sed -i "s|/usr/libexec|/usr/lib/$pkgname|" Linux/$pkgbase-launch-gtk2
  sed -i "s|share/games|share|"   Linux/$pkgbase-launch-qt5
  sed -i "s|/usr/games|/usr/bin|" Linux/$pkgbase-launch-qt5
  sed -i "s|/usr/libexec|/usr/lib/$pkgname|" Linux/$pkgbase-launch-qt5
}


build() {
  cd "$srcdir/$pkgname-$pkgver"

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
  rm -f  "$pkgname-gtk2  $pkgname-gtk2.dbg"
  rm -f  "$pkgname-gtk3  $pkgname-gtk3.dbg"
  rm -f  "$pkgname-qt5   $pkgname-qt5.dbg"
  rm -f  "$pkgname-fpgui $pkgname-fpgui.dbg"

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' Pascal/Release.cfg

  # Build AI module
  cp Pascal/Release.cfg      AI/StdAI/fpc.cfg
  cd AI/StdAI
  fpc -B -vm3175 -olibstdai.so StdAI.lpr

  # Build GTK program
  cd ../../
  cp Pascal/Release.cfg  fpc.cfg
  cp Pascal/Release.cfg  Packages/CevoComponents/fpc.cfg
  cp Pascal/Release.cfg  Packages/Common/fpc.cfg

  lazbuild -v
  lazbuild --ws=gtk2 -B --bm=Release --lazarusdir=/usr/lib/lazarus --pcp="$srcdir/config" Integrated.lpi
  mv "$pkgbase" "$pkgbase-gtk2"
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm 644 "Desktop/$pkgbase-gtk2.desktop"         -t "$pkgdir/usr/share/applications"
  install -Dm 644 "Desktop/$pkgbase-manual-gtk2.desktop"  -t "$pkgdir/usr/share/applications"
  install -Dm 644 "Desktop/$pkgbase.svg"                  -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  install -Dm 755 "$pkgbase-gtk2"                    -t "$pkgdir/usr/lib/$pkgname"
  install -Dm 755 "Linux/$pkgbase-launch-gtk2"       -t "$pkgdir/usr/bin"
  install -Dm 644 AI/StdAI/StdAI.png                 -t "$pkgdir/usr/share/$pkgbase/AI/StdAI"
  install -Dm 644 AI/StdAI/StdAI.ai.txt              -t "$pkgdir/usr/share/$pkgbase/AI/StdAI"
  install -Dm 755 AI/StdAI/libstdai.so               -t "$pkgdir/usr/lib/$pkgbase"

  ln -s "/usr/lib/$pkgbase/libstdai.so"    "$pkgdir/usr/share/$pkgbase/AI/StdAI/libstdai.so"

  install -Dm 644 readme.txt                        -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 Docs/*                            -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 Linux/c-evo-gtk2.metainfo.xml     -t "$pkgdir/usr/share/metainfo"

  install -Dm 644 Man/c-evo-launch-gtk2.6           -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 Man/c-evo-gtk2.6                  -t "$pkgdir/usr/share/man/man6"

  install -Dm 644 Language.txt                      -t "$pkgdir/usr/share/$pkgbase"
  install -Dm 644 Language2.txt                     -t "$pkgdir/usr/share/$pkgbase"
  install -Dm 644 Fonts.txt                         -t "$pkgdir/usr/share/$pkgbase"

  install -Dm 644 Graphics/*.png                    -t "$pkgdir/usr/share/$pkgbase/Graphics"
  install -Dm 644 Graphics/*.jpg                    -t "$pkgdir/usr/share/$pkgbase/Graphics"
  install -Dm 644 Graphics/*.grs                    -t "$pkgdir/usr/share/$pkgbase/Graphics"
# install -Dm 644 Qt5/*                             -t "$pkgdir/usr/share/$pkgbase/Graphics"
  install -Dm 644 Help/*                            -t "$pkgdir/usr/share/$pkgbase/Help"
  install -Dm 644 Maps/*                            -t "$pkgdir/usr/share/$pkgbase/Maps"
  install -Dm 644 Saved/*                           -t "$pkgdir/usr/share/$pkgbase/Saved"
  install -Dm 644 Sounds/*                          -t "$pkgdir/usr/share/$pkgbase/Sounds"
  install -Dm 644 Tribes/*                          -t "$pkgdir/usr/share/$pkgbase/Tribes"

  find Localization -type f -exec install -Dm 644    "{}" "$pkgdir/usr/share/$pkgbase/{}" \;
}
