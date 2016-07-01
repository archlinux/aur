# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
_pkgname=pjproject
pkgname=${_pkgname}-savoirfairelinux
pkgver=2.4.5
pkgrel=1
pkgdesc="Open source SIP stack and media stack, built with patches from SavoirFaire Linux (mostly GnuTLS support)"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL')
depends=('gnutls' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux-ng' 'ffmpeg' 'libsrtp' 'opus')
provides=("${_pkgname}=${pkgver}")
source=("http://www.pjsip.org/release/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        endianness.patch
        gnutls.patch
        notestsapps.patch
        ipv6.patch
        ice_config.patch
        multiple_listeners.patch
        pj_ice_sess.patch)
sha256sums=('086f5e70dcaee312b66ddc24dac6ef85e6f1fec4eed00ff2915cebe0ee3cdd8d'
            '294d9fba18a8c903979de2c9b531a3ca32a28f90658bf0613a32ebfa7d5e3a69'
            '5de398030b9a872981d9f0f5c830c781faa3d22a05513e895174628f54cc1b90'
            'f88f3e73d2f62ae60d93e84e08f98da7d5febe93f1f390286cafa106178c4f27'
            'fdf64f3260aecbbc5433ae784e12dde462f1a15361f14c5cd0f7be0a3d13f802'
            'b15829c960bf7b58b4b7660e5ce98f59c72b71fce714602bca479b58891621db'
            '49ddd0acbb7b947798d8d8c3c2db15e8e6adea00597160bc4b5f784115b81185'
            '6eb446817c9a1e1c1c2922da18a2fb98c4acecb85aa0e2f9981ded1a6bf32b1f')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for patch in endianness.patch gnutls.patch notestsapps.patch ipv6.patch ice_config.patch multiple_listeners.patch pj_ice_sess.patch
  do
    msg2 "Applying patch $patch"
    patch -p1 < ../"$patch"
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export CXXFLAGS="${CXXFLAGS} -fPIC"
  export CFLAGS="${CXXFLAGS}"
  ./configure \
      --prefix=/usr \
      --enable-shared \
      --enable-ssl=gnutls \
      --with-external-speex \
      --with-external-srtp \
      --with-external-pa \
      --with-external-gsm \
      --enable-ext-sound \
      --disable-oss \
      --disable-opencore-amr \
      --disable-v4l2 \
      --disable-video \
      --disable-sound
  make -j1 dep
  make -j1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
}
