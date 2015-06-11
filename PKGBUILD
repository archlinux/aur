# Maintainer: jyantis <yantis@yantis.net>

pkgname=pywallet-git
pkgver=v1.2.1.r57.gb52c955
_gitname=pywallet
_binname=pywallet
pkgrel=2
pkgdesc='Bitcoin wallet tool written in Python 2. Lots of features including exporting with balances to JSON and some great wallet recovery tools'
arch=('any')
url='https://github.com/jackjack-jj/pywallet'
license=('custom')
depends=('python2'
         'python2-twisted'
         'python2-bsddb'
         'python2-ecdsa')
source=('git://github.com/jackjack-jj/pywallet.git'
        'https://help.github.com/articles/github-terms-of-service'
        'pywallet.patch')
sha256sums=('SKIP'
            'SKIP'
            'e2c5a63535b0dc6d8ba8e646e21fc178eb520ff4b491e339a1bab9e669da1c5e')
makedepends=('git')
conflicts=('pywallet')

pkgver() {
  cd pywallet
  set -o pipefail

  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion
  else
    printf "%s" $_gitversion
  fi
}

build() {

  # Patch crashing out due to exceptions on finding non bitcoin private keys
  patch ${_gitname}/pywallet.py < pywallet.patch

  # Patch #!/usr/bin/env python to #!/usr/bin/env python2 if needed
  if ! grep "env python2"  "${_gitname}/pywallet.py"; then
    sed -i.bak 's/env python/env python2/g' ${_gitname}/pywallet.py
  fi
}

package() {
    # Since this project has no license github defaults to normal copyright plus some extra rights
    # like allowing users to view and fork projects.
    install -D -m644 "github-terms-of-service" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -D -m755 "${_gitname}/pywallet.py" "$pkgdir/usr/bin/pywallet"
}

# vim:set ts=2 sw=2 et:
