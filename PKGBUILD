pkgname=vst2sdk
pkgver=2.4
epoch=1
pkgrel=2
pkgdesc="Steinberg's VST2 SDK"
arch=('x86_64' 'i686')
url="http://www.steinberg.net/en/company/developers.html"
license=('LicenseRef-SteinBerge-License')
_pkgver=3.7.11
_date=2024-04-22
options=(!staticlibs)
makedepends=("git" "cmake")
source=("https://download.steinberg.net/sdk_downloads/vst-sdk_${_pkgver}_build-10_${_date}.zip"
        "git+https://github.com/R-Tur/VST_SDK_2.4.git#commit=4610873fa433d263a5c4a68b5b8b59ffcf6ca6db"
        "git+https://github.com/sysfce2/vst-2.4-sdk.git#commit=45590c1b3266c1758e408dea790a7f7d8711d0b1")
# check for latest file with curl -sI https://www.steinberg.net/vst3sdk
sha512sums=('e19ff4ac0c5005b97402eddfce39e94dacd2e55f6ac8a288d5520cb48fb41dfff05188ff8ea1a4a1b1b0d6a89f558c798e8356cf9fcb68bd4e8b3431aee02932'
            'e288ed04834440498a9180149832d0936a7858ff759f59f38a4f3d6a8d4aee99711be36c4597ef6571b8265d0e7769a453056d8ab540f3ad4d2e5a516cb61c69'
            '5bebc02a6ada62fa8793159ee35379175019e84f5e03efe2ed1a6e9a5512024fe9e482e41e2ee3dc62d990783c75baef323c39cf7060803a0efac38029ece99f')

build() {
  cd "$srcdir"
  cmake -B build \
  -S VST_SDK_$pkgver

  cmake --build build
}


package() {
  cd "$srcdir/VST_SDK_$pkgver/pluginterfaces/vst2.x"
  #Packaging like vst3sdk
  for file in {aeffect.h,aeffectx.h,vstfxstore.h};
  do
    install -Dm644 $file "$pkgdir/usr/src/vst2sdk/pluginterfaces/vst2.x/$file"
  done
  cd "$srcdir/VST_SDK_$pkgver/public.sdk/source/vst2.x"
  for file in {aeffeditor.h,audioeffect.cpp,audioeffect.h,audioeffectx.cpp,audioeffectx.h};
  do
    install -Dm644 $file "$pkgdir/usr/src/vst2sdk/public.sdk/source/vst2.x/$file"
  done
  install -Dm644 "$srcdir/vst-$pkgver-sdk/vstsdk${pkgver}/public.sdk/source/vst2.x/vstplugmain.cpp" "$pkgdir/usr/src/vst2sdk/public.sdk/source/vst2.x/vstplugmain.cpp"

  install -Dm644 "$srcdir/build/libVST_SDK.a" "$pkgdir/usr/lib/libVST_SDK.a"

  # install license
  cd "$srcdir/VST_SDK/vst3sdk"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
# vim:set ts=2 sw=2 et:
