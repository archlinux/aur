# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2025.3.0
pkgrel=2
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
  'home-assistant.service'
  'remove-setuptools-constraint.patch'
  'home-assistant.sysusers'
  'home-assistant.tmpfiles'
)
sha512sums=('c30e7ec392b3b2df741445bafc964a4d2bf8b4c3b669205d417d9f1647c4d423fb9f4cfea7a4dc8f1ffebb7903018bdcebeba8e5b886fcc31b9073ce66af6837'
            'bfe03048e169e968d0a85b995325524acee5e36d919c6e0172f6bb11e33316b6b8ca667ad9ca53e11f35d73bafc68bf612c954e508e741434e1766cb7672113a'
            'f32cbdc8a94088493e06adf57de9407341ec1c16d641ad6a3bfcafa1983946a32d207af8af63590e99d915be4df6ab2a7405a096cfa127a10df16692eb2afe00'
            'c50d91645483cc00fc47a3e430f03751896efe1b9d0e45ef15f7b01a2683c7c2fbb0d1a114414e13aa7aaa826c8628254975db804b4fd87ece29302e80504be5'
            'b30c3c8439b4b33f0334f3b8e4f3bca8d4365755e09488bdf42436253d197f6fc62ad5523144186439988ed44f14de0e48dff5ea7319c8719673dc7da192b15b')
b2sums=('655ee80d4e75028ea5254574d0695dcaa66b0822c29bbe91cbf2289b79c4c9885a6143cd4cb962d3d7f889b507370fe2ca0ab392c6616dbb48b6343eddf40a79'
        'b0f2f1aff52a01bd42a6bd90bddbd5a71399a1af89fcb6bc21ea73b1870cfe6f1cca7373730e29e285a2a4ecd7a42bebbb95ec4dbad577f3283b45e101c89bd0'
        'b64675219c7b8d909275dd2dfce16a5f5049fef91ba3cf0a4c02f6f4b9dbc360e68b7025a9d3a21aac8457d5378508b4d7bfa5eae86ed7ab98bace77ea10a6c3'
        '4414b95c656ecf17b6c4b56ca087d04159b803b241828b5ce612c4157897b0aeb85004ca748e1198b133789413813e072a8384d43b319550a14e6e58879b3972'
        '3a5c97ee10a165768c6a9a5576d8fbe9e9568449098947380411da69fe74c5916c04fd36ed6414e4ac17d6dcaf38aa0bbd14f58f3f2a336f61273616f1e55a06')

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
