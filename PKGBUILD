# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.1
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal (binary release)"
arch=('x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/ouch-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b27902df86aa2b4df28e1d53214af1d5391beabd4c1cbee850d80c2168329d62')

package() {
  # Binary releaes is archived in a folder with a generic name, it is not ideal
  # (e.g. aur helpers will complain about name clashes)
  # So we fix it
  cd "${srcdir}"
  mkdir "${_pkgname}-${pkgver}"
  mv "${srcdir}/ouch-x86_64-unknown-linux-gnu/"* "${_pkgname}-${pkgver}"
  rmdir ouch-x86_64-unknown-linux-gnu

  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # install manpages
  install -Dm0644 "man/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "man/${_pkgname}-compress.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "man/${_pkgname}-decompress.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "man/${_pkgname}-list.1" -t "${pkgdir}/usr/share/man/man1"

  # install shell completions
  install -Dm0644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm0644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm0644 "completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
