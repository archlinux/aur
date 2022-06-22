# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>>

pkgname=serioussam-vk
pkginstdir=serioussam
xplus_tfe=SamTFE-XPLUS.tar.xz
xplus_tse=SamTSE-XPLUS.tar.xz
pkgver=1.10.2
_srcname="SeriousSamClassic-VK-$pkgver"
pkgrel=2
pkgdesc="Serious Sam Classic native Linux version with Vulkan support and XPLUS Modification."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic-VK"
license=('GPL2')
depends=('sdl2' 'python' 'bash' 'vulkan-icd-loader' 'vulkan-validation-layers')
makedepends=('cmake' 'make' 'sed' 'vulkan-headers')
replaces=('serioussam-vk')
install=serioussam.install
source=("https://github.com/tx00100xt/SeriousSamClassic-VK/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partac"
    "serioussam-tfe.desktop"
    "serioussam-tse.desktop"
    "serioussam.xpm"
    "serioussam-tfe.sh")
    "serioussam-tse.sh")
sha256sums=('09415fd717847c57da9d375262f05e541585e674593f9c62fb6bc406e3e3910a'
            '01b2e2d4dbdb65b2f1e174fbd6606d70806e97b6a45047ed6c58e7b801f6a879'
            'f8f35bcc54ed888b72b8660319ad089b7243b9e8d83aefabdb8f0111fcb0b728'
            '3da6b8588115cf31cb67e15f527dc8b6a83da16fe35ac8c7b78ed9522e0211a4'
            '28a90da56de5d6591a2e65154778030ba28b375d29556fd7e1db085d2c00b877'
            '93fe183a2f0a35989b3d1678dddb1c5976cda94747d4186c6f36af4ccf144443'
            '8282f527b54e9d8fe009640b7634560f3b4bf0fc9b72cdc2f865f1c226339d35'
            '3faf5cbdb9683badd45230246d525e313d5447414c9da4c18fa553440bf29748'
            'c07e00be5f264a853dc96845b875b2762c1b1fbcdacd274853b2d7b841149f1b'
            'daf88b168e941d0bdd6c6637934a98d703f962afec7c64a1502c5b82ff66c6c8'
            '649c2a4f2c0dfa1a096192cd6a24206fba19512a1b8094663b9cfb21a93a2d35'
            'd1938c4422ad9f4b00703b29edfb4bb39aa7e5c6b4ad64a38cd530d88cec46f3')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Making building scripts.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh > build-linux"$_bits"xplus-tfe.sh
  chmod 755 build-linux"$_bits"-tfe.sh
  chmod 755 build-linux"$_bits"xplus-tfe.sh
}

build(){
  # Building Serious Sam Classic The First Encounter.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"-tfe.sh

  # Building Serious Sam Classic The First Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"xplus-tfe.sh

  # Building Serious Sam Classic The Second Encounter.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits".sh

  # Building Serious Sam Classic The Second Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits"xplus.sh

  # Building Serious Sam Classic tmp stuff.
  cd "$srcdir/$_srcname/SamTFE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  cd "$srcdir/$_srcname/SamTSE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old}
  rm -fr "$srcdir/$_srcname/images"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
  install -d $pkgdir/usr/bin/

  # Install the XPLUS Modification data.
  cat "$srcdir/"$xplus_tfe".part* > "$srcdir/$xplus_tfe"
  cat "$srcdir/"$xplus_tse".part* > "$srcdir/$xplus_tse"
  extract "$srcdir/$xplus_tse" -d "$srcdir/$_srcname/SamTFE/"
  extract "$srcdir/$xplus_tse" -d "$srcdir/$_srcname/SamTSE/"
  rm -f  "$srcdir"/{*.xz} 

  # Install data.
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkginstdir"

  # Install helper scripts.
  install -D -m 755 $srcdir/serioussam-tfe.sh \
       $pkgdir/usr/share/$pkginstdir/SamTFE
  install -D -m 755 $srcdir/serioussam-tse.sh \
       $pkgdir/usr/share/$pkginstdir/SamTSE

  # Install license.
  install -D -m 644 $srcdir$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Install desktop file.
  install -D -m 644 $srcdir/serioussam-tfe.desktop \
           $pkgdir/usr/share/applications/serioussam-tfe.desktop
  install -D -m 644 $srcdir/serioussam-tse.desktop \
           $pkgdir/usr/share/applications/serioussam-tse.desktop

  # Install icon file.
  install -D -m 644 $srcdir/serioussam.xpm \
           $pkgdir/usr/share/pixmaps/serioussam.xpm

  # Create symlinks to add the serioussam startup and utility scripts to usr/bin
  ln -s /usr/share/$pkginstdir/SamTFE/serioussam-tfe.sh $pkgdir/usr/bin/serioussam-tfe || return 1
  ln -s /usr/share/$pkginstdir/SamTSE/serioussam-tse.sh $pkgdir/usr/bin/serioussam-tse || return 1

}
