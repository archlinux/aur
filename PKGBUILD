# Maintainer: epitron <chris@ill-logic.com>

pkgname=svox-pico-bin
pkgver=1.0+git20130326
pkgrel=8
pkgdesc='The text-to-speech engine used on Android phones'
url='https://android.googlesource.com/platform/external/svox/+/master'
license=('custom')
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
  _arch=i386
  sha256sums=(
    5275da0a7cc2369fe2980e83d3d2959b05b8e6ab1655762716852e538309934a
    bd3e471e5628e1d9efd65eebd5384741ea3934adee1a735ed6ea7f5ca02c1d4c
    66df82ab92c39608961813ede5c59b42eae83595aef625b115aeaed8946f5ec2
    631b2474fbef11a7c56b9470354f066f8f6b5545f5793d06cdf37f9a28738a40
  )
else
  _arch=amd64
  sha256sums=(
    3243fc7a917ccbe0bf2d870c0f1f202a485b238b7a0193aaad6a16bf503e192d
    bd3e471e5628e1d9efd65eebd5384741ea3934adee1a735ed6ea7f5ca02c1d4c
    7f2f292f5e7dcf5eb003f2e6d1797fc5d00d10a0d4cce39615009e10228fd2ce
    5b665aa42175bbc919dc2ccd15e4556ab0e79189b981273bf9f858025d11d387
  )
fi

sha256sums+=(a1fa3f1938b6856254d09cf51d7c6344b79cff25c807adf39bb26b141910e492) # picospeaker

source=(
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico0_1.0+git20130326-${pkgrel}_${_arch}.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-data_1.0+git20130326-${pkgrel}_all.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-dev_1.0+git20130326-${pkgrel}_${_arch}.deb"
  "http://mirrors.kernel.org/ubuntu/pool/multiverse/s/svox/libttspico-utils_1.0+git20130326-${pkgrel}_${_arch}.deb"
  "picospeaker" # source: https://raw.githubusercontent.com/the-kyle/picospeaker/master/picospeaker
)

noextract=(
  "libttspico0_1.0+git20130326-${pkgrel}_${_arch}.deb"
  "libttspico-data_1.0+git20130326-${pkgrel}_all.deb"
  "libttspico-utils_1.0+git20130326-${pkgrel}_${_arch}.deb"
  "libttspico-dev_1.0+git20130326-${pkgrel}_${_arch}.deb"
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
