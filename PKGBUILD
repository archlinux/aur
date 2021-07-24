# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

_pkgname=linuxsampler
pkgname=linuxsampler-vst
pkgver=2.2.0
pkgrel=1
pkgdesc="Professional-grade audio sampler alternative to Gigasampler (including VST plugin)"
arch=('x86_64')
url="https://www.linuxsampler.org/"
license=('GPL2')
groups=('pro-audio')
depends=('alsa-lib' 'libasound.so' 'gcc-libs' 'glibc' 'libgig' 'libgig.so'
'jack' 'libjack.so' 'libsndfile' 'libsndfile.so' 'sqlite')
makedepends=('clang' 'dssi' 'ladspa' 'lv2' 'steinberg-vst36')
optdepends=('dssi-host: for DSSI plugin'
            'lv2-host: for LV2 plugin')
provides=("${_pkgname}" 'liblinuxsampler.so')
conflicts=("${_pkgname}")
source=("https://download.linuxsampler.org/packages/${_pkgname}-${pkgver}.tar.bz2"
        "${_pkgname}-2.2.0-libdir.patch"
        "${_pkgname}-2.2.0-libgig_package.patch")
sha512sums=('9015bb8d3af125e13c5c2ef3ae2d3987f7b7dda72e238cff25e622a3291019f5e392195dd27e7e783c70d877d9b267915fc443369eb17117e5eb7c54b8496c68'
            'fd552a6efff47ddd0114f7d394d699ba2df624c5a9dfd3b88f754f38b4aa7c9e04523b79b179e1f4d8f73cb142158134d74a11eb8718f8a22ace2a0d5b2f0c86'
            '84c5e2a322783e33e83aa319466c5e49f32d4b5175f63515df7857ddcdb9d2a3a11afde376b77d1f18c474ab341d42d2d1e018ab2525971b680fe36abbd221d1')
b2sums=('9650938d0aace876e817884121b824713dd2f747505344d7895e7d99da62f2214fb4c4bf43c398f4e486202e23e7a57288e19734e8c565a917d823169deb717a'
        '98df780dfe7bf1a0379e7b4a15390aab411b1a5b8ef5c9c9fe04cdcd963ed572eeeaa00eb184017b61248bc396f58cfca571a748d6d17caf5030a447a05ebbf0'
        '599ff6db7c87c4c4ee2306f62c6bec2a612d3c556c371a660430d09c93cda7b0b951f78e742d679407215fabb60939619fc9edcbf3813bf1665a9ee5fe0ddf95')

prepare(){
  cd "${_pkgname}-${pkgver}"
  autoreconf -vfi
  # install shared object in global namespace
  patch -Np1 -i ../"${_pkgname}-2.2.0-libdir.patch"
  # fix generation of instruments in package()
  patch -Np1 -i ../"${_pkgname}-2.2.0-libgig_package.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  CXX=clang++ CC=clang ./configure --prefix=/usr --enable-vstsdk-dir=/usr/include/vst36/
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # docs
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # lscp files conflict with nilfs-utils:
  # https://bugs.archlinux.org/task/45827
  mv -v "${pkgdir}/usr/bin/lscp" "${pkgdir}/usr/bin/lscp-${_pkgname}"
  mv -v "$pkgdir/usr/share/man/man1/lscp.1" \
    "${pkgdir}/usr/share/man/man1/lscp-${_pkgname}.1"
}
# vim:set ts=2 sw=2 et:
