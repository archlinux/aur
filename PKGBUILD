# Maintainer: ShadowKyogre <shadowkyogre.public@gmail.com>

pkgname=python-word-cloud-git
pkgver=1.2.1.r1.g00488b8
pkgrel=1
pkgdesc='A little word cloud generator in Python 2'
arch=('any')
arch=('i686' 'x86_64')
url='https://github.com/amueller/word_cloud'
license=('MIT')
depends=('python' 'cython' 'python-pillow' 'python-numpy' 'ttf-droid')
source=('git://github.com/amueller/word_cloud.git' 'wordcloud.patch')
sha256sums=('SKIP' '0d3379d5a8c4481c2a3deaa8ab809c1817fa9a5e6178f7a55773ef45f46c8f10')
makedepends=('git' 'python-setuptools')
provides=('python-word_cloud')
conflicts=('python-word_cloud')

pkgver() {
  cd word_cloud
  set -o pipefail
  _gitversion=$( git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  echo "$_gitversion"
}

build() {
  # patch to fix font patch for Arch Linux
  #patch word_cloud/wordcloud/wordcloud.py < wordcloud.patch

  cd word_cloud

  python setup.py build
}

package() {
  cd word_cloud

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
