_module=mem
_pkgname=moksha-modules-extra
category=('moksha-modules-extra')
pkgname=moksha-module-${_module}-git
pkgver=f7db19e
pkgrel=1
pkgdesc="Moksha memory module, which displays RAM usage - built from git sources"
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('')
source=("$_pkgname::git+https://github.com/JeffHoogland/moksha-modules-extra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/${_module}"
  msg2 "Building $_module"
  ./autogen.sh \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/${_module}"
  msg2 "Installing $_module"
  make DESTDIR="${pkgdir}" install

#   install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#   install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}
