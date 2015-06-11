# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-word-cloud-git
pkgver=1.1.0.r117.6ebeab0
pkgrel=2
pkgdesc='A little word cloud generator in Python 2'
arch=('any')
arch=('i686' 'x86_64')
url='https://github.com/amueller/word_cloud'
license=('MIT')
depends=('python2' 'cython2' 'python2-pillow' 'python2-numpy' 'ttf-droid')
source=('git+https://github.com/amueller/word_cloud.git' 'wordcloud.patch')
sha256sums=('SKIP' '0d3379d5a8c4481c2a3deaa8ab809c1817fa9a5e6178f7a55773ef45f46c8f10')
makedepends=('git' 'python2-setuptools')
provides=('python2-word_cloud')
conflicts=('python2-word_cloud')

pkgver() {
  cd word_cloud
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  # patch to fix font patch for Arch Linux
  #patch word_cloud/wordcloud/wordcloud.py < wordcloud.patch

  cd word_cloud

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd word_cloud

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
