# Maintainer:  jyantis <yantis@yantis.net>

pkgname=getaltname-git
pkgver=1.0.0.r18.g574e38a
pkgrel=1
pkgdesc='Script that can extract Subject Alt Names for SSL Certificates directly from HTTPS web sites which can provide you with DNS names or virtual servers'
arch=('any')
url='https://github.com/franccesco/getaltname'
license=('custom')
depends=('python' 
        'python-colorama'
        'python-ndg-httpsclient'
        'python-pyperclip'
        'python-requests'
        'python-tldextract'
        'xclip')
source=('git+https://github.com/franccesco/getaltname.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')

pkgver() {
  cd getaltname
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

package() {
  cd getaltname


  # Install Script
  mkdir -p $pkgdir/usr/bin/
  install -D -m755 getaltname.py "$pkgdir/usr/bin/getaltname"

  # Install License
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
