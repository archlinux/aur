# Maintainer: xanderboy2001 <alexanderechristian@gmail.com>

pkgname=mc-creative-clone
pkgver=0.1.0
pkgrel=1
pkgdesc="Copies a Minecraft world and converts it to a creative mode backup"
arch=('any')
url="https://github.com/xanderboy2001/mc-creative-clone"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-questionary'
  'python-rich'
  'python-numpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-pip'
)
source=("https://files.pythonhosted.org/packages/source/m/mc-creative-clone/mc_creative_clone-${pkgver}.tar.gz")
sha256sums=('5151d9a26ebc864a290f8336fe2bc30fefe8849b4359db3f0ade49bedf5b96d5')

build() {
  cd "mc_creative_clone-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "mc_creative_clone-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # nbtlib is not available in the repos or AUR; bundle it directly
  pip install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    --no-warn-script-location \
    --root-user-action=ignore \
    "nbtlib>=2.0.4"

  # Remove "$pkgdir references from pip's RECORD file
  find "$pkgdir" -name "RECORD" -exec \
    sed -i "s|$pkgdir||g" {} +
}
