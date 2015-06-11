# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-webkit-server-git
pkgver=0.9.r332.e60bd7e
pkgrel=2
pkgdesc='A standalone version of the Webkit server included in capybara-webkit. It includes a slim Python 2 wrapper and the several improvements over the original version'
arch=('i686' 'x86_64')
url='https://github.com/niklasb/webkit-server'
license=('custom')
depends=('python2'
         'qt4'
         'qtwebkit')
optdepends=('xorg-server-xvfg: for headless usage'
            'python2-dryscrape: Dryscape headless webkit scraper library')
source=('git+https://github.com/niklasb/webkit-server.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-webkit-server')
conflicts=('python2-webkit-server')

pkgver() {
  cd webkit-server
  set -o pipefail
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd webkit-server
  cd src
  qmake-qt4
  make
  cd ..

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd webkit-server

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Main install
  # make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
