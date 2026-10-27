# Maintainer: agony <27015 at riseup dot net>

pkgname=liquidsoap-bin
pkgver=2.5.0rc1
_deb=2.5.0-debian-forky-ocaml5.5.1-1
pkgrel=1
pkgdesc='Audio and video streaming language (upstream Debian build)'
arch=('x86_64' 'aarch64')
url='https://www.liquidsoap.info/'
license=('GPL-2.0-or-later' 'LicenseRef-Fraunhofer')
depends=(
  'alsa-lib'
  'bzip2'
  'glibc'
  'gmp'
  'jack'
  'libao'
  'libatomic'
  'libcurl-gnutls'
  'libffi'
  'libgcc'
  'liblo'
  'libmad'
  'libpulse'
  'libsamplerate'
  'libstdc++'
  'libtheora'
  'lilv'
  'portaudio'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
  'soundtouch'
  'speex'
  'sqlite'
)
makedepends=('patchelf')
optdepends=(
  'bubblewrap: sandbox for external processes'
  'frei0r-plugins: frei0r video effects'
)
provides=("liquidsoap=${pkgver}")
conflicts=('liquidsoap')
options=('!strip' '!debug')
install=liquidsoap-bin.install
_tag="v${pkgver/rc/-rc}"
_release="https://github.com/savonet/liquidsoap/releases/download/${_tag}"
source=(
  'liquidsoap.sysusers'
  'liquidsoap.tmpfiles'
  'fdk-aac-NOTICE::https://raw.githubusercontent.com/mstorsjo/fdk-aac/6cfabd35363c3ef5e3b209b867169a500b3ccc3c/NOTICE'
)
# Two release candidates and the release can share one asset name, so the
# saved name holds pkgver as well as the asset value
source_x86_64=("liquidsoap-${pkgver}-${_deb}-amd64.deb::${_release}/liquidsoap_${_deb}_amd64.deb")
source_aarch64=("liquidsoap-${pkgver}-${_deb}-arm64.deb::${_release}/liquidsoap_${_deb}_arm64.deb")
sha256sums=('a8a759a71362cd405d12381effc4d41a9f70dcfb3b039b7a6236ab82e363c6d0'
            '8ea34e0054bcb937c86121abd8b230801a73ca1874ac5769708a049f699a6522'
            '95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836')
sha256sums_x86_64=('4d9b2290cb90864b1859d543b65f1c847810d7e1aa3cbbeee35b57a3f423aa56')
sha256sums_aarch64=('c6651cae0d58619e79c3e937d6e013e32b8d22a83fa08c8e6ace9cbe29499325')

prepare() {
  bsdtar -xf data.tar.xz ./etc/bash_completion.d/liquidsoap
}

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}" --exclude ./usr/share/doc ./usr

  # Debian builds soundtouch with autotools (libSoundTouch.so.1), Arch with
  # CMake (libSoundTouch.so.2), from the same 2.4.1 source
  patchelf --replace-needed libSoundTouch.so.1 libSoundTouch.so.2 "${pkgdir}/usr/bin/liquidsoap"

  install -Dm644 etc/bash_completion.d/liquidsoap \
    "${pkgdir}/usr/share/bash-completion/completions/liquidsoap"
  install -Dm644 liquidsoap.sysusers "${pkgdir}/usr/lib/sysusers.d/liquidsoap.conf"
  install -Dm644 liquidsoap.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/liquidsoap.conf"
  install -Dm644 fdk-aac-NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/fdk-aac-NOTICE"
}
