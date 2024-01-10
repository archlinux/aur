# Maintainer: Michał Kopeć <michal@nozomi.space>
# Contributor: Michał Kopeć <michal@nozomi.space>

_pkgname=xone
pkgname=xone-dkms
pkgver=0.3
pkgrel=4
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
arch=('x86_64' 'aarch64')
url='https://github.com/medusalix/xone'
license=('GPL2')
depends=(
  'dkms'
  'xone-dongle-firmware'
)
makedepends=('git')
conflicts=(
  'xone-dkms'
  'xow'
)
provides=('xone-dkms')
source=(
  https://github.com/medusalix/xone/archive/refs/tags/v${pkgver}.tar.gz
  'fix_6.3_compilation.patch'
)
sha256sums=(
  '993f6b2b07c3236ce283d5de4da47dbfc16a86e056af504a4958d87f718ece20'
  '6ce597ef7a916216584c99bd8fdf382b6a720d8550315c87142aeff2b226d70b'
)

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "* Applying patch $src..."
    patch -Np1 < "../$src"
  done

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  echo "* Blacklisting xpad module..."
  install -D -m 644 install/modprobe.conf "${pkgdir}/usr/lib/modprobe.d/xone-blacklist.conf"
}

