# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2026.10.1
pkgrel=1
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
sha512sums=('63b61065e942d17cae8aa4baeed1e0d6724ce026f9c1ea84adb4a68a6003d9c2982484579c9021dce2db9adb2a3bb6aeff0027bdee8ee53e6daba6772b0e0209'
            'd97e1d3718ab89542ac6dbf7a58157a91a74cb3d0b0f1f7c0889bcfba3da5dd120567c1551e7462f51a78cd9049990dfc7aa48828a1c3d6c389f1c2a93cedf13'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '3e93118c84954f829767dc71ce534c5d02c1c95fc8748714c7a2df28a3a297f59962f8fb7cddf721987eb97d62feabb25acda5d38209e365646ca4a4ef4356e3'
            '3fa5a8c4419f4f6150998bc89784e9d241ce305c9430b006c2c09cf85f43a127ec67d1692748532ed96bad04368878ac12f151f042f8f635290e0ed6113439d9'
            '75587cb2d599f8608185562edf54a29c2f9a92b7d7b7d46dd92b36661b2b1dee45ce78ddcf3e1475e42d8d2392b4dd35c0e53c03390f6aa561df6b2cf4f0788f')
b2sums=('d36aa91b876a71a6e413ea94d1e6e6a121829198d13223d1b46f235cd0063f0f96dfc8321ff505cf193f33bf71021b00eeb11edc40a642ec5a48937d8312a6fc'
        '4a4f548ce5b9961bba71d3e81db49da306b2b42019ba982f9123456e12cb33e9a3d50bed6fbacbecfe3c9a6cb8467f7d91948535e512361fcb125857987ea167'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'c4896b5bf2ecee2eb952899e7431a19a2e49c08f414887dfa054e9827b5cbeb88f223c99ac610acc0c11e34c7bf9a7892efea67fbf6ff13c7a27fe4e03f619b9'
        '47e1f892bce55029dbef29eb31e30fb18eb3f4a088f9bfee8cf7ca877982469eb1bb31346734292395c207e468db43b86e1bc3782d0cd2d15e199e5043fbe3e8'
        '62c8898850a76d33d83d0094f6007d80a8a7fe36b564a2bc6a0e7809420cb583f47eb15b140b4154b4c925a1f1e77f9c3508ed93055fcc71fd58aaa9cf8632a5')

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
