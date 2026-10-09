# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=my_basic
pkgname=(${_pkgname}-git ${_pkgname}-docs-git)
pkgver=r1096.gff5bed7
pkgrel=1
pkgdesc="Embeddable BASIC interpreter"
arch=('x86_64' 'i686')
url="https://paladin-t.github.io/my_basic"
license=('MIT')
makedepends=('git')
source=("${_pkgname}-git::git+https://github.com/paladin-t/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '19300b462013ad3320367430fca6a91950c3878167133996abfd61e7603c2dad')

pkgver() {
  cd "${_pkgname}-git"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}-git"

  # Patch CFLAGS
  patch -p1 -s -i "${srcdir}/${_pkgname}-makefile.patch"
}

build() {
  cd "${_pkgname}-git"
  make
}

package_my_basic-git() {
pkgdesc='Embeddable BASIC interpreter'
depends=('glibc')
optdepends=('my_basic-doc-git: manual and sample programs')
conflicts=('my_basic')
provides=('my_basic')

  cd "${_pkgname}-git"

  install -Dvm0755 output/my_basic -t "${pkgdir}/usr/bin"
  install -Dvm0644 README.md HISTORY -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_my_basic-docs-git() {
pkgdesc='Documentation for my_basic'
arch=('any')
optdepends=('my_basic-git: interpreter to run sample programs')
conflicts=('my_basic-doc')
provides=('my_basic-doc')

  cd "${_pkgname}-git"

  install -dvm0755 "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"

  install -vm0644 *.{pdf,html} \
    "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vm0644 sample/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample"
  install -vm0644 sample/yard/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"
}
