# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: graysky <graysky AT proton DOT me>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2026.8.3
pkgrel=1
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
  '02-Revert-Pin-cffi-to-2.0.0-in-package-constraints-1759.patch'

)
sha512sums=('c9117ae9fee87d4fc5495547fdd185942d91766ff67f5440d4fa586b7119adf91994f182ddf236110e4f12e567b979239feab9f831b9c01df5cd327e68141e93'
            'd97e1d3718ab89542ac6dbf7a58157a91a74cb3d0b0f1f7c0889bcfba3da5dd120567c1551e7462f51a78cd9049990dfc7aa48828a1c3d6c389f1c2a93cedf13'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '3e93118c84954f829767dc71ce534c5d02c1c95fc8748714c7a2df28a3a297f59962f8fb7cddf721987eb97d62feabb25acda5d38209e365646ca4a4ef4356e3'
            '076bde49564b339cd2e624510ea17cb29d47881f926115e207ea91781ae14807868b406457bd961d51672bb08ed80027c6561a196cc99a60171f25d962e09f13'
            '67089b1ee1bbba729b05ac31057c00ed0ee3c566bcaa98232d51377ed918268f024787f5ef48ddd73d36f8e0a416f895a48bec078361ebfb9e13662abe455eac')
b2sums=('9e6f56fecb50f854a43cb30f5515b37d6af2b04e3f542ad30722eecfa86a0ae4de4ab14903081d0eddfdb7793df07631d99bae1f3ad86b83caf991bde4350e48'
        '4a4f548ce5b9961bba71d3e81db49da306b2b42019ba982f9123456e12cb33e9a3d50bed6fbacbecfe3c9a6cb8467f7d91948535e512361fcb125857987ea167'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'c4896b5bf2ecee2eb952899e7431a19a2e49c08f414887dfa054e9827b5cbeb88f223c99ac610acc0c11e34c7bf9a7892efea67fbf6ff13c7a27fe4e03f619b9'
        'f520ef730eeb21cb518133c86c053a97a4238791eefd558c1b3a6ca61c3fe13641c8ecfdd02308f4d47b522c1cd2aff4cc5e3fe266a4ed58a1851c178ad35b93'
        '7c45dd9ce324fee9a8bf7ca56ec832fe410b443e933f9cd1ccddfccb9ae498b795ba8c4ae9d95bb7ce3710faa32e6c9d8500eb58377af8653167b3e559c103a6')

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
