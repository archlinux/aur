# Maintainer: /dev/rs0 <rs0@secretco.de.com>

pkgname=creddump-git
pkgver=r10.3df4a14
pkgrel=1
pkgdesc="Extracts credentials from Windows registry hives."

arch=('any')
url="https://github.com/Neohapsis/creddump7"
license=('GPL3')

replaces=('creddump' 'creddump-svn')
conflicts=('creddump' 'creddump-svn')
provides=('creddump=0.3')

makedepends=('git')
depends=('python2' 'python2-crypto')

source=("creddump::git+https://github.com/Neohapsis/creddump7.git")
md5sums=('SKIP')

pkgver() {
  cd "creddump"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "creddump"

  install -d "${pkgdir}/usr/share/licenses/creddump"
  install -Dm0644 "COPYING" "${pkgdir}/usr/share/licenses/creddump/LICENSE"

  rm CHANGELOG COPYING

  install -d "${pkgdir}/usr/share/creddump"  
  cp -a . "${pkgdir}/usr/share/creddump"

  install -d "${pkgdir}/usr/bin"
  for file in *.py; do
    sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "$file"
    install -Dm0755 "$file" "${pkgdir}/usr/share/creddump"
    ln -s "/usr/share/creddump/${file}" "${pkgdir}/usr/bin/${file%.*}"
  done
}
