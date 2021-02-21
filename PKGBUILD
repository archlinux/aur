# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# Build package from source 285..5.6
# See https://app.zdechov.net/c-evo
# See https://svn.zdechov.net/c-evo

pkgname=c-evo
pkgver=285
pkgrel=1
pkgdesc="Empire Building Game"
arch=('x86_64')
url="http://www.c-evo.org/"
license=('GPL2')
makedepends=('fpc' 'lazarus-gtk2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo-bin')
source=("$pkgname-$pkgver.orig.tar.xz::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_Testing/c-evo_285+dfsg.6.orig.tar.xz"
      "$pkgname-$pkgver.debian.tar.xz::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_Testing/c-evo_285+dfsg.6-3.debian.tar.xz")
sha256sums=('a0d3594f1b1d9d5bd540a3275414811b23a42462bfb0eda8ca7ed784e2f57ac7'
            '493021b362efca499298c84b8d2edbfcf687ea48206a2b11c2287ec5b2b7ce1b')

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
  patch -Np1 < debian/patches/011-splash.patch
  patch -Np1 < debian/patches/012-manual.patch
  patch -Np1 < debian/patches/014-invalidate.patch
  patch -Np1 < debian/patches/015-wonders.patch
  patch -Np1 < debian/patches/016-unsupported.patch
  patch -Np1 < debian/patches/017-citywalls.patch
  patch -Np1 < debian/patches/018-badwindow.patch
  patch -Np1 < debian/patches/020-localization.patch
  patch -Np1 < debian/patches/021-sound.patch
  patch -Np1 < debian/patches/022-buttons.patch
  patch -Np1 < debian/patches/023-stability.patch
  patch -Np1 < debian/patches/024-autosave.patch
  
  # Arch does not use a 'games' folder
  sed -i "s|share/games|share|"   debian/extras/$pkgname-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|" debian/extras/$pkgname-launch-gtk2
  sed -i "s|share/games|share|"   debian/extras/$pkgname-launch-qt5
  sed -i "s|/usr/games|/usr/bin|" debian/extras/$pkgname-launch-qt5
}


build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Set temporary folder for lazarus primary config
  rm -fr "$srcdir/config"
  mkdir  "$srcdir/config"

  # clean
  rm -fr lib
  rm -fr Packages/CevoComponents/lib
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
  rm -f  fpc.cfg

  # Build AI module
  cp debian/extras/Release.cfg      AI/StdAI/fpc.cfg
  cp debian/extras/Switches.inc AI/StdAI/Switches.inc
  cd AI/StdAI
  fpc -B -vm3175 -olibstdai.so StdAI.lpr

  # Build GTK program
  cd ../../
  cp debian/extras/Release.cfg  fpc.cfg

  # currently cannot build with -pie as the RTL is not built with pie 
  sed -i '/-k-pie/d' fpc.cfg

  cp debian/extras/Switches.inc Switches.inc
  rm -fr tmphome
  rm -fr lib
  rm -fr Packages/CevoComponents/lib
  lazbuild -v
  lazbuild --ws=gtk2 -B --bm=Release --lazarusdir=/usr/lib/lazarus --pcp="$srcdir/config" Integrated.lpi
  mv "$pkgname" "$pkgname-gtk2"
}


package() {
  cd "$pkgname-$pkgver"
  
  mv debian/README.debian debian/README.arch
  
  # Corruption.png needs to be upper case
  # naptid.png wrong place and wrong case
  # Remove readme files (credits moved to copyright file)
  # Remove NewZealand saved game (Won't load in this version)
  # Remove most of the ocean only maps (now we have the map generator)
  mv Help/Corruption.png Help/CORRUPTION.png
  mv Localization/zh-Hans/Help/naptid.png Help/NAPTID.png
  rm Maps/readme.txt
  rm Graphics/*.credits.txt
  rm Localization/cs/readme!!!.txt
  rm Localization/ru/ReadMe.txt
  rm Localization/zh-Hans/ReadMe.txt
  rm Localization/zh-Hant/ReadMe.txt
  rm Localization/zh-Hant/Help/naptid.png
  rm Maps/MyGameNewZealand.cevo
  rm Maps/0*.png
  rm Maps/0*.cevo\ map

  install -Dm 644 "debian/extras/$pkgname-gtk2.desktop"         -t "$pkgdir/usr/share/applications"
  install -Dm 644 "debian/extras/$pkgname-manual-gtk2.desktop"  -t "$pkgdir/usr/share/applications"
  install -Dm 644 "debian/extras/$pkgname.svg"                  -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
 
  install -Dm 755 "$pkgname-gtk2"                       -t "$pkgdir/usr/bin"
  install -Dm 755 "debian/extras/$pkgname-launch-gtk2"  -t "$pkgdir/usr/bin"
  install -Dm 644 AI/StdAI/StdAI.png                    -t "$pkgdir/usr/share/$pkgname/AI/StdAI"
  install -Dm 644 AI/StdAI/StdAI.ai.txt                 -t "$pkgdir/usr/share/$pkgname/AI/StdAI"
  install -Dm 755 AI/StdAI/libstdai.so                  -t "$pkgdir/usr/lib/$pkgname"
  
  ln -s "/usr/lib/$pkgname/libstdai.so"                "$pkgdir/usr/share/$pkgname/AI/StdAI/libstdai.so"
 
  install -Dm 644 readme.txt                        -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/README.source              -t "$pkgdir/usr/share/doc/$pkgname"        
  install -Dm 644 debian/README.arch                -t "$pkgdir/usr/share/doc/$pkgname"        
  install -Dm 644 debian/copyright                  -t "$pkgdir/usr/share/doc/$pkgname"        
  install -Dm 644 debian/changelog                  -t "$pkgdir/usr/share/doc/$pkgname"        
  install -Dm 644 debian/extras/techchart.png       -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/Tutorial.html       -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/C-evo-HOWTO.html    -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/Release-Notes.txt   -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/C-evo-Mil.html      -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 debian/extras/c-evo-launch-gtk2.6 -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 debian/extras/c-evo-gtk2.6        -t "$pkgdir/usr/share/man/man6"
  install -Dm 644 debian/c-evo-gtk2.metainfo.xml    -t "$pkgdir/usr/share/metainfo"
 
  install -Dm 644 Language.txt                      -t "$pkgdir/usr/share/$pkgname" 
  install -Dm 644 Language2.txt                     -t "$pkgdir/usr/share/$pkgname"
  install -Dm 644 Fonts.txt                         -t "$pkgdir/usr/share/$pkgname"

  install -Dm 644 Graphics/*                        -t "$pkgdir/usr/share/$pkgname/Graphics"
  install -Dm 644 Help/*                            -t "$pkgdir/usr/share/$pkgname/Help"
  install -Dm 644 Maps/*                            -t "$pkgdir/usr/share/$pkgname/Maps"
  install -Dm 644 debian/extras/maps/*              -t "$pkgdir/usr/share/$pkgname/Maps"        
  install -Dm 644 Saved/*                           -t "$pkgdir/usr/share/$pkgname/Saved"
  install -Dm 644 Sounds/*                          -t "$pkgdir/usr/share/$pkgname/Sounds"
  install -Dm 644 Tribes/*                          -t "$pkgdir/usr/share/$pkgname/Tribes"

  install -Dm 644 debian/extras/Textures/*.jpg      -t "$pkgdir/usr/share/$pkgname/Graphics"
  install -Dm 644 debian/extras/Sounds/*.mp3        -t "$pkgdir/usr/share/$pkgname/Sounds"

  install -Dm 644 Localization/cs/Help/*            -t "$pkgdir/usr/share/$pkgname/Localization/cs/Help"        
  install -Dm 644 Localization/cs/Tribes/*          -t "$pkgdir/usr/share/$pkgname/Localization/cs/Tribes"      
  install -Dm 644 Localization/cs/*.txt             -t "$pkgdir/usr/share/$pkgname/Localization/cs"

  install -Dm 644 Localization/de/Help/*            -t "$pkgdir/usr/share/$pkgname/Localization/de/Help"        
  install -Dm 644 Localization/de/Tribes/*          -t "$pkgdir/usr/share/$pkgname/Localization/de/Tribes"      
  install -Dm 644 Localization/de/*.txt             -t "$pkgdir/usr/share/$pkgname/Localization/de"
  install -Dm 644 debian/extras/de/*.txt            -t "$pkgdir/usr/share/$pkgname/Localization/de"
  
  install -Dm 644 debian/extras/fr/help.txt         -t "$pkgdir/usr/share/$pkgname/Localization/fr/Help"        
  install -Dm 644 debian/extras/fr/StdUnits.txt     -t "$pkgdir/usr/share/$pkgname/Localization/fr/Tribes"      
  install -Dm 644 debian/extras/fr/Language*.txt    -t "$pkgdir/usr/share/$pkgname/Localization/fr"
  
  install -Dm 644 Localization/it/Help/*            -t "$pkgdir/usr/share/$pkgname/Localization/it/Help"        
  install -Dm 644 Localization/it/Tribes/*          -t "$pkgdir/usr/share/$pkgname/Localization/it/Tribes"      
  install -Dm 644 Localization/it/AI/*              -t "$pkgdir/usr/share/$pkgname/Localization/it/AI"      
  install -Dm 644 Localization/it/*.txt             -t "$pkgdir/usr/share/$pkgname/Localization/it"

  install -Dm 644 Localization/ru/Help/*            -t "$pkgdir/usr/share/$pkgname/Localization/ru/Help"        
  install -Dm 644 Localization/ru/Tribes/*          -t "$pkgdir/usr/share/$pkgname/Localization/ru/Tribes"      
  install -Dm 644 Localization/ru/*.txt             -t "$pkgdir/usr/share/$pkgname/Localization/ru"
  install -Dm 644 debian/extras/ru/*.txt            -t "$pkgdir/usr/share/$pkgname/Localization/ru"

  install -Dm 644 Localization/zh-Hans/Help/*       -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hans/Help"       
  install -Dm 644 Localization/zh-Hans/Tribes/*     -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hans/Tribes"     
  install -Dm 644 Localization/zh-Hans/Maps/*       -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hans/Maps"       
  install -Dm 644 Localization/zh-Hans/*.txt        -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hans"

  install -Dm 644 Localization/zh-Hant/Help/*       -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hant/Help"       
  install -Dm 644 Localization/zh-Hant/Tribes/*     -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hant/Tribes"     
  install -Dm 644 Localization/zh-Hant/Maps/*       -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hant/Maps"       
  install -Dm 644 Localization/zh-Hant/*.txt        -t "$pkgdir/usr/share/$pkgname/Localization/zh-Hant"
}

