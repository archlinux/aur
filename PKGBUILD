# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-pyecho-git
pkgver=r11.1fdb0f5
pkgrel=2
pkgdesc='A Python 2 wrapper for the (undocumented) Amazon Echo API'
arch=('any')
url='https://github.com/scotttherobot/PyEcho'
license=('custom')
depends=('python2'
         'python2-beautifulsoup4'
         'python2-requests')
source=('git+https://github.com/scotttherobot/PyEcho.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-pyecho')
conflicts=('python2-pyecho')

pkgver() {
  cd PyEcho
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
  cd PyEcho

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd PyEcho

  # We don't need anything related to git in the package
  rm -rf .git*

  # No license so install the readme as the license 
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  msg "Since no setup.py lets set it up by hand"
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()"`
  mkdir -p "${pkgdir}/${pydir}"
  mkdir -p "${pkgdir}/${pydir}/pyecho"
  touch "${pkgdir}/${pydir}/pyecho/__init__.py"
  cp *.py "${pkgdir}/${pydir}/pyecho"
}

# vim:set ts=2 sw=2 et:
