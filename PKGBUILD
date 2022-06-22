# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam
pkginstdir=serioussam
xplus_tfe=SamTFE-XPLUS.tar.xz
xplus_tse=SamTSE-XPLUS.tar.xz
pkgver=1.10.2
_srcname="SeriousSamClassic-$pkgver"
pkgrel=2
pkgdesc="Serious Sam Classic native Linux version with XPLUS Modification."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic"
license=('GPL2')
depends=('sdl2' 'python' 'bash')
makedepends=('cmake' 'make' 'sed')
replaces=('serioussam-vk')
install=serioussam.install
source=("https://github.com/tx00100xt/SeriousSamClassic/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partac"
    "serioussam-tfe.desktop"
    "serioussam-tse.desktop"
    "serioussam.xpm"
    "serioussam-tfe.sh"
    "serioussam-tse.sh")
noextract=("SamTFE-XPLUS.tar.xz.partaa"
	"SamTFE-XPLUS.tar.xz.partab"
	"SamTFE-XPLUS.tar.xz.partac"
	"SamTSE-XPLUS.tar.xz.partaa"
	"SamTSE-XPLUS.tar.xz.partab"
	"SamTSE-XPLUS.tar.xz.partac")
sha256sums=('e59880dfe320c5a97c5adc59980c66ef8bd1bbac4ddb1d02fa03221d31f8654d'
            '01b2e2d4dbdb65b2f1e174fbd6606d70806e97b6a45047ed6c58e7b801f6a879'
            'f8f35bcc54ed888b72b8660319ad089b7243b9e8d83aefabdb8f0111fcb0b728'
            '3da6b8588115cf31cb67e15f527dc8b6a83da16fe35ac8c7b78ed9522e0211a4'
            '28a90da56de5d6591a2e65154778030ba28b375d29556fd7e1db085d2c00b877'
            '93fe183a2f0a35989b3d1678dddb1c5976cda94747d4186c6f36af4ccf144443'
            '8282f527b54e9d8fe009640b7634560f3b4bf0fc9b72cdc2f865f1c226339d35'
            '8e9f0d7138ab5da6b4b899f39234f6e3c48d0d47970c6b12372e33e86e39d606'
            '134bbc9088b8c323c9a17a7ea8a39942e4cf4b83e149cb4f89e161adf7290122'
            '1fd56e04072372e1e8dab0bae40da1519d82a28895cbe5661b18561ee9ea47b4'
            '649c2a4f2c0dfa1a096192cd6a24206fba19512a1b8094663b9cfb21a93a2d35'
            'd1938c4422ad9f4b00703b29edfb4bb39aa7e5c6b4ad64a38cd530d88cec46f3')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare XPLUS archive
  cat "$xplus_tfe".part* > "$xplus_tfe"
  cat "$xplus_tse".part* > "$xplus_tse"

  # Install the XPLUS Modification data.
  tar -xJvf "$srcdir/$xplus_tse" -C "$srcdir/$_srcname/SamTFE/"
  tar -xJvf "$srcdir/$xplus_tse" -C "$srcdir/$_srcname/SamTSE/"

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
  rm -fr "$srcdir/$_srcname/Images"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
  install -d $pkgdir/usr/bin/

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Install data.
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkginstdir"

  # Install helper scripts.
  install -D -m 755 $srcdir/serioussam-tfe.sh \
       $pkgdir/usr/share/$pkginstdir/SamTFE
  install -D -m 755 $srcdir/serioussam-tse.sh \
       $pkgdir/usr/share/$pkginstdir/SamTSE

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
