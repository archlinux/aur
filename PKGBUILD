# Maintainer:  jyantis <yantis@yantis.net>

# Thanks to kstep for this great tool
# optional dependencies taken from the PKGBUILD of Konstantin Stepanov <me@kstep.me>

pkgname=python2-pushybullet-git
pkgver=1.5.4.r154.3f34a2b
pkgrel=2
pkgdesc='Python 2 bindings for Pushbullet API v2 with freedom of usage in mind'
arch=('any')
url='https://github.com/kstep/pushybullet'
license=('custom')
depends=('python2' 'python2-setuptools' 'python2-simplejson')
source=('git+https://github.com/kstep/pushybullet.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-pushybullet')
conflicts=('python2-pushybullet')
optdepends=('python2-websocket-client: read pushes stream in real-time'
            'python2-dateutil: parse datetime in string format'
            'python2-magic: file type autodetection')
pkgver() {
  cd pushybullet
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
  cd pushybullet

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd pushybullet

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Readme since no license
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
