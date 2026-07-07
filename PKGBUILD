# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2026.7.1
pkgrel=3
epoch=1
arch=('any')
url='https://home-assistant.io/'
license=('Apache-2.0')
depends=(
  'bluez-libs'
  'ffmpeg'
  'gcc'
  'lapack'
  'libffi'
  'libjpeg-turbo'
  'libtiff'
  'openjpeg2'
  'openssl'
  'python'
  'python-orjson'
  'tzdata'
  'zlib'
)
makedepends=(
  'python-build'
  'python-setuptools'
  'python-wheel'
)
install=$pkgname.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/home-assistant/core/archive/${pkgver}.tar.gz"
  'home-assistant.service'
  'home-assistant.sysusers'
  'home-assistant.tmpfiles'
  '01-remove-setuptools.patch'
  '02-add-usb-aioesphomeapi-dependency.patch'

)
sha512sums=('459bf1d1b0cb39e54c639da2bc951d4ea27ff989cf8033edb1e509e3fb63173f40dce73d286709c933ac7f0766e5c85f510597cd026d625dfe143cc31c2ab0cf'
            '8c8190e91296377bedca058a7d13e0b6ebbfed8ec6d0bb4daf1182385d0079e9f418194b7f1f5ba5fda7a1129cd59ab5732a47189fe75dc42745b791f88bacf1'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '8babcf544c97ec5ad785014f0b0d5dca556a2f5157dadcbe83d49d4669b74f6349e274810ec9a028fcec208c6c8fbbe6b3899d2933b56163b9e506570879a3ad'
            '076bde49564b339cd2e624510ea17cb29d47881f926115e207ea91781ae14807868b406457bd961d51672bb08ed80027c6561a196cc99a60171f25d962e09f13'
            'e85f73b9e6b6c32ca871ab8532ae2bd393201f81fa4c992abb20a85fcf6a6d96c57650b882274280a90f5dd72131d1013fd0ecd81d1db58f4a6a8b24b06f968c')
b2sums=('69c2b333543d0a55b952ed7383a509dbbe19c24161288c1f13b90c831f024bdaf7e514e581b03ac6ae5bd79bc3075a4f1894174377c085d2356b05cedf27c9e3'
        '2ec091f51faef40c35ad38f937d067ec72d72baca2db4b0c80f4af092ca39533d798e27e2c04e2c2a5125a1a8bac77a73caf32f891aea1b34c174f1885819d81'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'ffb45bcc9cc396282f417a066c01f1137f25cc8ccd55f484b442d136ca3eb8569949a88e99f5cc3f4af4ee0ed60392711c5cda772e364b3959ba6e64e6bbfea5'
        'f520ef730eeb21cb518133c86c053a97a4238791eefd558c1b3a6ca61c3fe13641c8ecfdd02308f4d47b522c1cd2aff4cc5e3fe266a4ed58a1851c178ad35b93'
        'be3227d596a0ffd0975ab060932b384d15361c50253bc0c18c76352c4f29a4ccf2d24e93596914b6af1144fa9d46f575ed57eea3484bc81f20884321986dc6a3')

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
