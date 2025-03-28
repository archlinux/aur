# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2025.3.4
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
  'tzdata'
  'zlib'
)
makedepends=(
  'git'
  'python-build'
  'python-setuptools'
  'python-wheel'
)
install=$pkgname.install
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=$pkgver"
  'remove-setuptools-constraint.patch'
  'home-assistant.service'
  'home-assistant.sysusers'
  'home-assistant.tmpfiles'
)
sha512sums=('4b90feff4fd58cdefae8633b06ec5d060d7b7ec96102dde57cf1037a82ba711587fa11c7e3e6d892bee8d4cf92ef824f7941a8318ee1492f8cd0e5b2d719227c'
            'f32cbdc8a94088493e06adf57de9407341ec1c16d641ad6a3bfcafa1983946a32d207af8af63590e99d915be4df6ab2a7405a096cfa127a10df16692eb2afe00'
            '0a421907c1f53426fa42245bd90823e7d0d2ccbd11cc479a87f9d7cfd5d96bf3de37d10865c00233ef175e6274d4b2bf31cf7915870eb29b279a575235373647'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '8babcf544c97ec5ad785014f0b0d5dca556a2f5157dadcbe83d49d4669b74f6349e274810ec9a028fcec208c6c8fbbe6b3899d2933b56163b9e506570879a3ad')
b2sums=('416059110265b0807c8ad923167e97bf38630e32574368098c845825a25ba90d5f3543a721c762a0f2d6fd2f570d20e2f5ddb476a5cbe04a2b9ffa580da42c3f'
        'b64675219c7b8d909275dd2dfce16a5f5049fef91ba3cf0a4c02f6f4b9dbc360e68b7025a9d3a21aac8457d5378508b4d7bfa5eae86ed7ab98bace77ea10a6c3'
        '20b1847203eb236c58ce29b6d502fbad2804479dc31edc8f6a5da0a5a0bfaa22519f7262afe503d06c6c2efd26ee7819a549efb0096b661ed6eb277b441533f9'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'ffb45bcc9cc396282f417a066c01f1137f25cc8ccd55f484b442d136ca3eb8569949a88e99f5cc3f4af4ee0ed60392711c5cda772e364b3959ba6e64e6bbfea5')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  # allow any setuptools version to be used
  cd "$pkgname"
  patch -p1 -i "$srcdir/remove-setuptools-constraint.patch"
}

build() {
  cd home-assistant
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
}

package() {
  install -Dm 644 home-assistant/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant/
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 home-assistant.sysusers "${pkgdir}"/usr/lib/sysusers.d/home-assistant.conf
  install -Dm 644 home-assistant.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/home-assistant.conf
}

# vim: ts=2 sw=2 et:
