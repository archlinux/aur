# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2026.6.3
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
  '02-add-usb-aioesphomeapi-dependency.patch'

)
sha512sums=('f5c843853980b3c243d39bad8904544360ffbf08b5cd44cece00c9363ccbbd9ae9b26a619512fa9d6afc9235b46b85e960808fcc575275a83e2f3653d08fbcd8'
            '0a421907c1f53426fa42245bd90823e7d0d2ccbd11cc479a87f9d7cfd5d96bf3de37d10865c00233ef175e6274d4b2bf31cf7915870eb29b279a575235373647'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '8babcf544c97ec5ad785014f0b0d5dca556a2f5157dadcbe83d49d4669b74f6349e274810ec9a028fcec208c6c8fbbe6b3899d2933b56163b9e506570879a3ad'
            '90e102a454c92e91d8f9f348a12e81edd6103beb4d45530f8ed72b505761252666749860c036b7e27ca67167963bf6caa0e839b9ecfc22ca7526e34f8929eef4'
            'a23c51628c42d80f7b9af5ac31a43c0cbbb84fa3d49286276c9e70885c62e59d7ce303f1f5e924763c7a2d0b1fbfdc55817d76e6d382abd73f02ef0805c36b6f')
b2sums=('5ae8ba0078bcc08c01c70229abab602052de757dae330432f37e9d1537de11f878fe1dd4b710f9c38950d56e843a0462409cc9ae23d3177361ee470724c09686'
        '20b1847203eb236c58ce29b6d502fbad2804479dc31edc8f6a5da0a5a0bfaa22519f7262afe503d06c6c2efd26ee7819a549efb0096b661ed6eb277b441533f9'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'ffb45bcc9cc396282f417a066c01f1137f25cc8ccd55f484b442d136ca3eb8569949a88e99f5cc3f4af4ee0ed60392711c5cda772e364b3959ba6e64e6bbfea5'
        'a637d00b464518120e50eba195d77da8ff053940724a965166375358ada38d1b00c48984b0664b4fb472f7514280804a8e8d941bd5b250e63d7a5bd21a2ff353'
        '118a38fb979081059ea04da84cf288ed8d0043b776b3f2f3b85ff5d2c0be07dca636b595249b446ea238f1304049b3af64830f2f1286e1bb5c83a2cc14bd12f9')

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
