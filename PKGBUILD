# Maintainer: Sync1211 <dpf12110@gmail.com>
pkgname=owovrc-cli
pkgver=beta7
pkgrel=1
pkgdesc="Yet another VRChat integration for the OWO Skin haptic vest."
arch=('x86_64')
url="https://github.com/sync1211/owoskin-vrc"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'dotnet-sdk-10.0')
#checkdepends=('dotnet-runtime-9.0')
provides=('OWOVRC.CLI')
conflicts=('owovrc-cli-bin')
source=(
  "git+$url.git#tag=V1.0-beta7"
  'owovrc-cli.desktop'
  'owovrc-256x256.png'
  'owovrc-128x128.png'
  'owovrc-64x64.png'
  'owovrc-32x32.png'
)
sha256sums=(
  'SKIP'
  'dd893c8b0852163fe16497a8662dac9324270f388fd988c51727aa24731d12a0'
  '1420bbf64c57cba914b7f5eb89e9b6191feb294726aec291f3571295ee0b06a9'
  '944e88525cfd75ea76392832adba591835a49d7998e63bd4a7efb080b8fdbc51'
  '53da2613bbd99b8e0ae5daf24a896caab13e803c6f2953d69cf9ee321b201eac'
  '2f9078c1f2502a4dd42ee48022687388c4773e4305ada671a0c91abcb67b98aa'
)
options=('!debug')


prepare() {
  cd owoskin-vrc
  git submodule init
  git submodule update
}

build() {
  cd owoskin-vrc    
  dotnet publish "OWOVRC.CLI/OWOVRC.CLI.csproj" -r linux-x64 -o "OWOVRC/bin/publish/linux-x64/" -p:PublishProfile=./OWOVRC.CLI/Properties/PublishProfiles/Linux-x64.pubxml  
}

check() {
 cd owoskin-vrc
 dotnet test OWOVRC.Test/OWOVRC.Test.csproj
 #dotnet test OwoAdvancedSensationBuilder/OwoAdvancedSensationBuilder.Test/OwoAdvancedSensationBuilder.Test.csproj
 #dotnet test vrc-oscquery-lib/Tests/vrc-oscquery-tests/vrc-oscquery-tests.csproj --results-directory ./test-results
}

package() {
 install -Dm755 "$srcdir/owoskin-vrc/OWOVRC/bin/publish/linux-x64/OWOVRC.CLI" -t "$pkgdir/usr/bin/"

 for size in "256" "128" "64" "32"; do
  install -Dm644 "$srcdir/owovrc-${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/owovrc.png"
 done

 install -Dm644 "owovrc-cli.desktop" "$pkgdir/usr/share/applications/owovrc-cli.desktop"
}
