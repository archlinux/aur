# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2026.10.3
pkgrel=2
epoch=1
arch=(any)
url='https://home-assistant.io/'
license=(Apache-2.0)
depends=(
  bluez-libs ffmpeg gcc lapack libffi libjpeg-turbo libtiff openjpeg2 openssl
  python-orjson tzdata zlib
)
makedepends=(
  python-build python-setuptools python-wheel
)
install=$pkgname.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/home-assistant/core/archive/${pkgver}.tar.gz"
  home-assistant.service
  home-assistant.sysusers
  home-assistant.tmpfiles
  0001-allow-any-setuptools-version-to-be-used.patch::https://github.com/graysky2/core/commit/2f4384684a235dfcaea22520c5fb99e5a5005b3a.patch
  0002-Revert-Pin-cffi-to-2.0.0-in-package-constraints-1759.patch::https://github.com/graysky2/core/commit/10f5eccc1e3e089e3ae1426fba43d4c547a5547c.patch
)
sha512sums=('15c3bea7a0c782b96e28613cca399d859c2e7b5eac6ff543590eb697254cffa250b0fe37a14f156c136e2aa21f992d75b2dfa2351b2036f407634e182c277dd7'
            'd97e1d3718ab89542ac6dbf7a58157a91a74cb3d0b0f1f7c0889bcfba3da5dd120567c1551e7462f51a78cd9049990dfc7aa48828a1c3d6c389f1c2a93cedf13'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '3e93118c84954f829767dc71ce534c5d02c1c95fc8748714c7a2df28a3a297f59962f8fb7cddf721987eb97d62feabb25acda5d38209e365646ca4a4ef4356e3'
            '060c104b130580555a5fac7887817b30205b843e11d73099d50357be8f72ab1080cdcbeda5b6d7fb3d4dad950cbbbe240ce5a7200e2fcc370e3ad09aca1d022b'
            'f8854066ec8328fd8cf10d0f82e4899c712382476cbabdd7ba3fb5889b52e8daf03fa3a93b91d1e1da951f83eee55a179cda5cc92535e7f5ca66ff33a955a6f4')
b2sums=('22c09e8aa440c3ba3138e8328b4fa0e839aadcfa74f3f3c54c5f7cdee66004f10d091cc82cca7213d5ab819a38468fef3200eed79041be268cba8e8ff50d748c'
        '4a4f548ce5b9961bba71d3e81db49da306b2b42019ba982f9123456e12cb33e9a3d50bed6fbacbecfe3c9a6cb8467f7d91948535e512361fcb125857987ea167'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'c4896b5bf2ecee2eb952899e7431a19a2e49c08f414887dfa054e9827b5cbeb88f223c99ac610acc0c11e34c7bf9a7892efea67fbf6ff13c7a27fe4e03f619b9'
        'd69e220696fa37e7c86a222dfcf9961e58cff5f0eb08ed4e8ba6407f7df8911dec20ba838098b9120b68d96de7fce9c22e2a08adde19aad0352f40c0c52d7ba0'
        '7d342337be6261e5097dbc1366c473d084dd9ac15003526d837c2f94a2decefb59fa16cb3260f3b3b1cf87c553dfcc0b88fb30a580a4685a7d414c6187444a73')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  cd "core-${pkgver}"
  # Apply all patches in order
  local patch
  for patch in "$srcdir"/*.patch; do
    if [ -f "$patch" ]; then
      msg2 "Applying patch: $(basename "$patch")"
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "core-${pkgver}"
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
}

package() {
  install -Dm 644 "core-${pkgver}"/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant/
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 home-assistant.sysusers "${pkgdir}"/usr/lib/sysusers.d/home-assistant.conf
  install -Dm 644 home-assistant.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/home-assistant.conf
}

# vim: ts=2 sw=2 et:
