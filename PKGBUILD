# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2025.9.4
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
sha512sums=('6dd8577eb224e2c9af1c1a45f7f3d76fcbaf703c6210723f1c4a656450bc968a814956390d7a9559921d944f48b86b5e21a1a4ac00804d601b1eb986eb8c6cbc'
            '1157121d245b6c7471048144e04325b5e1fc422e5ea5b45dc63c3d5d7efd2757a6930514fb35d4e0b8650b7541ef0fadf8f0eba12586d380d931c502e3acfeb4'
            '0a421907c1f53426fa42245bd90823e7d0d2ccbd11cc479a87f9d7cfd5d96bf3de37d10865c00233ef175e6274d4b2bf31cf7915870eb29b279a575235373647'
            'ec05b47011adea19ee71a7793968c20a95648f45e581dab1462faec85ff31d968acd5eac35729e52c46a7eeb046a2961093283160167622d4da9773562ec8273'
            '8babcf544c97ec5ad785014f0b0d5dca556a2f5157dadcbe83d49d4669b74f6349e274810ec9a028fcec208c6c8fbbe6b3899d2933b56163b9e506570879a3ad')
b2sums=('f88a8a8ee45209baacf496e78eebdb4f9252d5e6ca9ad02d1cadb43f1375f7430b1f7dde55b4b02190f1f0531cc439dd288c0fc830a04fe6d7b63c33d3a9fa67'
        '913c766df2ed4a4f5984c3ea75746e380f370ba9b3d6009d329b2089d1f00a538a18608f037593d43bbbc3f9a2c88d2290dfdef3a15094575c28b5a55e8ec1a9'
        '20b1847203eb236c58ce29b6d502fbad2804479dc31edc8f6a5da0a5a0bfaa22519f7262afe503d06c6c2efd26ee7819a549efb0096b661ed6eb277b441533f9'
        '8a023a2215712044fb5115d1b81e55fad2c74f2e836cfe7f3f1e7c3778e4903c25ba7e429aedfd74b566be542aa50ea0d486b616c6d5b0315d993a9599e454f8'
        'ffb45bcc9cc396282f417a066c01f1137f25cc8ccd55f484b442d136ca3eb8569949a88e99f5cc3f4af4ee0ed60392711c5cda772e364b3959ba6e64e6bbfea5')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  # allow any setuptools version to be used
  # also fix FTBFS due to requiring a later version of setuptools
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
