# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>>

pkgname=serioussam-vk
pkginstdir=serioussam
pkgver=1.10.5
_srcname="SeriousSamClassic-VK-$pkgver"
pkgrel=5
pkgdesc="Serious Sam Classic native Linux version with Vulkan support."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic-VK"
license=('GPL2')
depends=('sdl2' 'python' 'bash' 'vulkan-icd-loader' 'vulkan-validation-layers')
makedepends=('cmake' 'make' 'sed' 'vulkan-headers')
conflicts=('serioussam')
install=serioussam.install
source=("https://github.com/tx00100xt/SeriousSamClassic-VK/archive/refs/tags/v$pkgver.tar.gz"
    "serioussam-tfe.desktop"
    "serioussam-tse.desktop"
    "serioussam.xpm"
    "0001-remove_SE1_10b_depend.patch"
    "0002-Fixed_Platform_definition.patch"
    "0003-Fix-load-some-incorrect-custom-maps.patch")
sha256sums=('e4fb2c46b238bc9984c6d5ec31f2aed0f571cca724795bc333ad1ab92d80a8f7'
            '1e36d7b0d11f68729aa5c79ac9a44157d4af0bf61060040ab92a37d96ca89aba'
            '49680c65d26b264a1d7735c6310fcc5d0ac0e0e56273d3bccf539c0c87d31b2b'
            '1fd56e04072372e1e8dab0bae40da1519d82a28895cbe5661b18561ee9ea47b4'
            '244101d02598010e4c45e57f26e0842d4cff058e3cde5e59062b9d36b5ffaca0'
            '21100e7993892d5ac7b4d44b87cf29d47afac5bfbc0e39c2777a3e0dc813dbd2'
            '36b0c4da5133ef5dcdcfd21767c84f7b3e9711413549b565957a734e549ee300')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare patch
  cat 0001-remove_SE1_10b_depend.patch > "$srcdir/$_srcname/0001-remove_SE1_10b_depend.patch"
  cat 0002-Fixed_Platform_definition.patch > "$srcdir/$_srcname/0002-Fixed_Platform_definition.patch"
  cat 0003-Fix-load-some-incorrect-custom-maps.patch > "$srcdir/$_srcname/0003-Fix-load-some-incorrect-custom-maps.patch"

  # Making building TFE scripts.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh
  chmod 755 build-linux"$_bits"-tfe.sh

  # Making building TSE scripts.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  chmod 755 build-linux"$_bits".sh

  cd "$srcdir/$_srcname"
  # apply patch
  patch -p1 < 0001-remove_SE1_10b_depend.patch || return 1
  patch -p1 < 0002-Fixed_Platform_definition.patch || return 1
  patch -p1 < 0003-Fix-load-some-incorrect-custom-maps.patch || return 1
}

build(){
  # Building Serious Sam Classic The First Encounter.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"-tfe.sh

  # Building Serious Sam Classic The Second Encounter.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits".sh

  # Removed Serious Sam Classic tmp stuff.
  cd "$srcdir/$_srcname/SamTFE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  cd "$srcdir/$_srcname/SamTSE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.patch}
  rm -fr "$srcdir/$_srcname/Images"

  mv -f "$srcdir/$_srcname/SamTFE/Bin/SeriousSam" "$srcdir/$_srcname/SamTFE/Bin/serioussam"
  mv -f "$srcdir/$_srcname/SamTFE/Bin/DedicatedServer" "$srcdir/$_srcname/SamTFE/Bin/serioussam-ded"
  mv -f "$srcdir/$_srcname/SamTSE/Bin/SeriousSam" "$srcdir/$_srcname/SamTSE/Bin/serioussamse"
  mv -f "$srcdir/$_srcname/SamTSE/Bin/DedicatedServer" "$srcdir/$_srcname/SamTSE/Bin/serioussamse-ded"

  # fix scripts for AMD cards
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTFE/Scripts/GLSettings/RAM.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTFE/Scripts/GLSettings/ATI-RPRO.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTSE/Scripts/GLSettings/RAM.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTSE/Scripts/GLSettings/ATI-RPRO.ini"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/lib/{serioussam,serioussam/Mods,serioussam/Mods/XPLUS}
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/XPLUS}

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/serioussam $pkgdir/usr/bin
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/serioussam-ded $pkgdir/usr/bin

  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libEngine.so $pkgdir/usr/lib
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libGame.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libEntities.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libShaders.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libamp11lib.so $pkgdir/usr/lib/serioussam

  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/serioussamse $pkgdir/usr/bin
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/serioussamse-ded $pkgdir/usr/bin

  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libEngineMP.so $pkgdir/usr/lib
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libEntitiesMP.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libShaders.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libamp11lib.so $pkgdir/usr/lib/serioussamse

  rm -fr "$srcdir/$_srcname/SamTFE/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Bin"
  rm -fr "$srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin"

  # Install data.
  mv "$srcdir/$_srcname/SamTFE"  $pkgdir/usr/share/serioussam
  mv "$srcdir/$_srcname/SamTSE"  $pkgdir/usr/share/serioussamse

  # Install desktop file.
  install -D -m 644 $srcdir/serioussam-tfe.desktop \
           $pkgdir/usr/share/applications/serioussam-tfe.desktop
  install -D -m 644 $srcdir/serioussam-tse.desktop \
           $pkgdir/usr/share/applications/serioussam-tse.desktop

  # Install icon file.
  install -D -m 644 $srcdir/serioussam.xpm \
           $pkgdir/usr/share/pixmaps/serioussam.xpm

}
