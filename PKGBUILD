# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# Build package from OBS source
# 11-Jan-2022
# See http://www.c-evo.org/
# https://build.opensuse.org/package/show/home:PeterBBB/c-evo

pkgname=c-evo-nh
pkgbase=c-evo
_shortpkgname=c-evo
pkgver=1.3.0.418
pkgrel=1
pkgdesc="Empire Building Game, C-evo: New Horizons"
arch=('x86_64')
url="https://app.zdechov.net/c-evo"
license=('GPL2')
makedepends=('fpc' 'lazarus-gtk2')
depends=('gtk2')
#options=(debug !strip)
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo' 'c-evo-bin' 'c-evo-nh-bin')
source=("$pkgname-$pkgver.5.orig.tar.xz::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_Testing/c-evo-nh_$pkgver+dfsg.orig.tar.xz"
        "$pkgname-$pkgver.5.debian.tar.xz::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_Testing/c-evo-nh_$pkgver+dfsg-1.debian.tar.xz")
sha256sums=('317dfd485dc74569173517df63590e4ec69087584a7942d0d54c04b801d52e18'
            '80fc74ec09ce8d863c5289b91762f1aefd880d6ee285761bb9047d4a23ba0977')

prepare() {
  cd "${srcdir}"
  rm -fr "$pkgname-$pkgver"/debian
  mv -t  "$pkgname-$pkgver" debian
  cd "$pkgname-$pkgver"
  patch -Np1 < debian/patches/001-directories.patch
  patch -Np1 < debian/patches/004-stdai.patch
  patch -Np1 < debian/patches/005-cityscreen.patch
  patch -Np1 < debian/patches/006-mapsizes.patch
  patch -Np1 < debian/patches/008-compiler.patch
  patch -Np1 < debian/patches/009-stacktrace.patch
  patch -Np1 < debian/patches/010-splash.patch
  patch -Np1 < debian/patches/012-manual.patch
  patch -Np1 < debian/patches/014-invalidate.patch
  patch -Np1 < debian/patches/016-unsupported.patch
  patch -Np1 < debian/patches/017-citywalls.patch
  patch -Np1 < debian/patches/018-badwindow.patch
  patch -Np1 < debian/patches/021-sound.patch
  patch -Np1 < debian/patches/022-buttons.patch
  patch -Np1 < debian/patches/023-stability.patch
  patch -Np1 < debian/patches/024-mapfilename.patch
  patch -Np1 < debian/patches/025-common.patch
  patch -Np1 < debian/patches/026-help.patch
  patch -Np1 < debian/patches/028-bigbuttons.patch
  patch -Np1 < debian/patches/029-spaceshipcost.patch

  # Arch does not use a 'games' folder
  sed -i "s|share/games|share|"   debian/extras/$_shortpkgname-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|" debian/extras/$_shortpkgname-launch-gtk2
  sed -i "s|share/games|share|"   debian/extras/$_shortpkgname-launch-qt5
  sed -i "s|/usr/games|/usr/bin|" debian/extras/$_shortpkgname-launch-qt5

  # Corruption.png needs to be upper case
  mv Help/Corruption.png Help/CORRUPTION.png

  # naptid.png wrong place and wrong case
  mv Localization/zh-Hans/Help/naptid.png Help/NAPTID.png

  # Remove readme files (credits moved to copyright file)
  rm -f Maps/readme.txt
  rm -f Graphics/*.credits.txt
  rm -f Localization/cs/readme!!!.txt
  rm -f Localization/ru/ReadMe.txt
  rm -f Localization/zh-Hans/ReadMe.txt
  rm -f Localization/zh-Hant/ReadMe.txt
  rm -f Localization/zh-Hant/Help/naptid.png

  # Remove most of the ocean only maps (now we have the map generator)
  rm -f Maps/0*.png
  rm -f Maps/0*.cevomap
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
  rm -f Switches.inc
  rm -f AI/StdAI/Switches.inc
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

  # Build AI module
  cp debian/extras/Release.cfg      AI/StdAI/fpc.cfg
  cp debian/extras/Switches.inc AI/StdAI/Switches.inc
  cd AI/StdAI
  fpc -B -vm3175 -olibstdai.so StdAI.lpr

  # Build GTK program
  cd ../../
  cp debian/extras/Release.cfg  fpc.cfg
  cp debian/extras/Release.cfg  Packages/CevoComponents/fpc.cfg
  cp debian/extras/Release.cfg  Packages/Common/fpc.cfg

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' fpc.cfg

  cp debian/extras/Switches.inc Switches.inc
  rm -fr tmphome
  rm -fr lib
  rm -fr Packages/CevoComponents/lib
  lazbuild -v
  lazbuild --ws=gtk2 -B --bm=Release --lazarusdir=/usr/lib/lazarus --pcp="$srcdir/config" Integrated.lpi
  mv "$_shortpkgname" "$_shortpkgname-gtk2"
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm 644 "debian/extras/$_shortpkgname-gtk2.desktop"         -t "$pkgdir/usr/share/applications"
  install -Dm 644 "debian/extras/$_shortpkgname-manual-gtk2.desktop"  -t "$pkgdir/usr/share/applications"
  install -Dm 644 "debian/extras/$_shortpkgname.svg"                  -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  install -Dm 755 "$_shortpkgname-gtk2"                      -t "$pkgdir/usr/bin"
  install -Dm 755 "debian/extras/$_shortpkgname-launch-gtk2" -t "$pkgdir/usr/bin"
  install -Dm 644 AI/StdAI/StdAI.png                         -t "$pkgdir/usr/share/$_shortpkgname/AI/StdAI"
  install -Dm 644 AI/StdAI/StdAI.ai.txt                      -t "$pkgdir/usr/share/$_shortpkgname/AI/StdAI"
  install -Dm 755 AI/StdAI/libstdai.so                       -t "$pkgdir/usr/lib/$_shortpkgname"

  ln -s "/usr/lib/$_shortpkgname/libstdai.so"    "$pkgdir/usr/share/$_shortpkgname/AI/StdAI/libstdai.so"

  install -Dm 644 readme.txt                        -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/README.source              -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/README.gameplay            -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/NEWS		                -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/copyright                  -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/changelog                  -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/techchart.png       -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/Tutorial.html       -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/C-evo-HOWTO.html    -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/Release-Notes.txt   -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/c-evo-launch-gtk2.6 -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 debian/extras/c-evo-gtk2.6        -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 debian/c-evo-gtk2.metainfo.xml    -t "$pkgdir/usr/share/metainfo"

  install -Dm 644 Language.txt                      -t "$pkgdir/usr/share/$_shortpkgname"
  install -Dm 644 Language2.txt                     -t "$pkgdir/usr/share/$_shortpkgname"
  install -Dm 644 Fonts.txt                         -t "$pkgdir/usr/share/$_shortpkgname"

  install -Dm 644 debian/extras/ButtonsC2.png       -t "$pkgdir/usr/share/$_shortpkgname/Graphics"
  install -Dm 644 Graphics/*                        -t "$pkgdir/usr/share/$_shortpkgname/Graphics"
  install -Dm 644 Help/*                            -t "$pkgdir/usr/share/$_shortpkgname/Help"
  install -Dm 644 Maps/*                            -t "$pkgdir/usr/share/$_shortpkgname/Maps"
  install -Dm 644 debian/extras/maps/*              -t "$pkgdir/usr/share/$_shortpkgname/Maps"
  install -Dm 644 Saved/*                           -t "$pkgdir/usr/share/$_shortpkgname/Saved"
  install -Dm 644 Sounds/*                          -t "$pkgdir/usr/share/$_shortpkgname/Sounds"
  install -Dm 644 Tribes/*                          -t "$pkgdir/usr/share/$_shortpkgname/Tribes"

  install -Dm 644 debian/extras/Textures/*.jpg      -t "$pkgdir/usr/share/$_shortpkgname/Graphics"
  install -Dm 644 debian/extras/Sounds/*.mp3        -t "$pkgdir/usr/share/$_shortpkgname/Sounds"

  install -Dm 644 Localization/cs/Help/*            -t "$pkgdir/usr/share/$_shortpkgname/Localization/cs/Help"
  install -Dm 644 Localization/cs/Tribes/*          -t "$pkgdir/usr/share/$_shortpkgname/Localization/cs/Tribes"
  install -Dm 644 Localization/cs/*.txt             -t "$pkgdir/usr/share/$_shortpkgname/Localization/cs"

  install -Dm 644 Localization/de/Help/*            -t "$pkgdir/usr/share/$_shortpkgname/Localization/de/Help"
  install -Dm 644 Localization/de/Tribes/*          -t "$pkgdir/usr/share/$_shortpkgname/Localization/de/Tribes"
  install -Dm 644 Localization/de/*.txt             -t "$pkgdir/usr/share/$_shortpkgname/Localization/de"
  install -Dm 644 debian/extras/de/*.txt            -t "$pkgdir/usr/share/$_shortpkgname/Localization/de"

  install -Dm 644 debian/extras/fr/Help.txt         -t "$pkgdir/usr/share/$_shortpkgname/Localization/fr/Help"
  install -Dm 644 debian/extras/fr/StdUnits.txt     -t "$pkgdir/usr/share/$_shortpkgname/Localization/fr/Tribes"
  install -Dm 644 debian/extras/fr/Language*.txt    -t "$pkgdir/usr/share/$_shortpkgname/Localization/fr"

  install -Dm 644 Localization/it/Help/*            -t "$pkgdir/usr/share/$_shortpkgname/Localization/it/Help"
  install -Dm 644 Localization/it/Tribes/*          -t "$pkgdir/usr/share/$_shortpkgname/Localization/it/Tribes"
  install -Dm 644 Localization/it/AI/*              -t "$pkgdir/usr/share/$_shortpkgname/Localization/it/AI"
  install -Dm 644 Localization/it/*.txt             -t "$pkgdir/usr/share/$_shortpkgname/Localization/it"

  install -Dm 644 Localization/ru/Help/*            -t "$pkgdir/usr/share/$_shortpkgname/Localization/ru/Help"
  install -Dm 644 Localization/ru/Tribes/*          -t "$pkgdir/usr/share/$_shortpkgname/Localization/ru/Tribes"
  install -Dm 644 Localization/ru/*.txt             -t "$pkgdir/usr/share/$_shortpkgname/Localization/ru"
  install -Dm 644 debian/extras/ru/*.txt            -t "$pkgdir/usr/share/$_shortpkgname/Localization/ru"

  install -Dm 644 Localization/zh-Hans/Help/*       -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hans/Help"
  install -Dm 644 Localization/zh-Hans/Tribes/*     -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hans/Tribes"
  install -Dm 644 Localization/zh-Hans/Maps/*       -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hans/Maps"
  install -Dm 644 Localization/zh-Hans/*.txt        -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hans"

  install -Dm 644 Localization/zh-Hant/Help/*       -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hant/Help"
  install -Dm 644 Localization/zh-Hant/Tribes/*     -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hant/Tribes"
  install -Dm 644 Localization/zh-Hant/Maps/*       -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hant/Maps"
  install -Dm 644 Localization/zh-Hant/*.txt        -t "$pkgdir/usr/share/$_shortpkgname/Localization/zh-Hant"
}
