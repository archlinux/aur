# Maintainer:  jyantis <yantis@yantis.net>

# Note it will crash if you run it without arguments
# try reloader --help

# If your windows are jumping around on you it is because you have xdotool installed
# I am not sure if its working as intended but I don't like it so I personally don't have it installed.

pkgname=pythonar-git
pkgver=r19.9b2a3b4
pkgrel=2
pkgdesc='Provides a simple way to restart applications when you change source code or resources thus providing better workflow. Written in Python 2'
arch=('any')
url='https://github.com/kivy/pythonar'
license=('MIT')
depends=('python2'
         'python2-colorama'
         'python2-termcolor'
         'python2-watchdog')
optdepends=('xdotool: x11 automation')
source=('git+https://github.com/kivy/pythonar.git'  'reloader.patch')
sha256sums=('SKIP' '412cd7de6c52f4d3d6e11ff1af059e1e2e995270dd0e483fa834ddc6b7653f43')
makedepends=('git')
provides=('pythonar')
conflicts=('pythonar')
pkgver() {
  cd pythonar
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # patch to fix error messages if xdotool isn't installed
  patch pythonar/reloader.py < reloader.patch

  cd pythonar

  # patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd pythonar

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the program
  install -D -m755 reloader.py "$pkgdir/usr/bin/reloader"
}

# vim:set ts=2 sw=2 et:
