# Maintainer: epitron <chris@ill-logic.com>

pkgname=svox-pico-bin
pkgver=1.0+git20130326
pkgrel=5
pkgdesc='The text-to-speech engine used on Android phones'
url='https://android.googlesource.com/platform/external/svox/+/master'
license=('custom')
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
  _arch=i386
  sha256sums=('c89c1de8ee77a258c6f191481abd0332629281b1224549f6ab86787fe08f5cd5'
              '1bc7c5e0e11a7533103cd9eee4971aae691d057ea4621cb7ca93dec3019f23cd'
              'dd61781cd803232e8fbe0a086d390c7a949231fb09d0e922c2d8df703b7b2bb8'
              'a1fa3f1938b6856254d09cf51d7c6344b79cff25c807adf39bb26b141910e492')
else
  _arch=amd64
  sha256sums=('96f430e3433bea077a9ffd69f60db5337dbf04c18fe0eecb7303a9808c51e4f2'
              '1bc7c5e0e11a7533103cd9eee4971aae691d057ea4621cb7ca93dec3019f23cd'
              '851369a1b9f9a47d3f0e7d563f4ea77f9537b85ef165f3abce77d0bd1b79b846'
              'a1fa3f1938b6856254d09cf51d7c6344b79cff25c807adf39bb26b141910e492')
fi

source=(
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico0_1.0+git20130326-5_${_arch}.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-data_1.0+git20130326-5_all.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-utils_1.0+git20130326-5_${_arch}.deb"
  "picospeaker" # source: https://raw.githubusercontent.com/the-kyle/picospeaker/master/picospeaker
)

noextract=(
  "libttspico0_1.0+git20130326-5_${_arch}.deb"
  "libttspico-data_1.0+git20130326-5_all.deb"
  "libttspico-utils_1.0+git20130326-5_${_arch}.deb"
)

depends=('popt')
makedepends=('binutils')
optdepends=('sox: for using the picospeaker script')


package() {
  for deb in "${noextract[@]}"; do
    ar p "$deb" data.tar.xz | tar Jx -C "$pkgdir/"
  done

  mv "$pkgdir/usr/lib/"*-linux-gnu/* "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/lib/"*-linux-gnu

  install -D -m755 picospeaker ${pkgdir}/usr/bin/picospeaker
}
