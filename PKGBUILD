# Maintainer: Claudia Pellegrino <auerhuhn ät archlinux.org>

pkgname=libmakepkg-hexora
pkgver=0.2.0
pkgrel=1
pkgdesc='Drop-in that enables makepkg to scan upstream Python sources for suspicious patterns using Hexora'
arch=('any')
url='https://gitlab.archlinux.org/auerhuhn/libmakepkg-hexora'
license=('GPL-2.0-or-later')
depends=('bash' 'hexora' 'jq' 'libmakepkg-srcaudit' 'moreutils')
makedepends=('python-myst-parser' 'python-sphinx')
options=('!debug' '!strip')
install="libmakepkg-hexora.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.archlinux.org/auerhuhn/libmakepkg-hexora/-/archive/v${pkgver}/libmakepkg-hexora-v${pkgver}.tar.gz"
)

sha512sums=('bf3be3e9db06bcdd946865f33729e38f0b80934aa2adbed5ff3e8dc9b312fc6c38603fc51a69a94a3cd6cd7b79c2e3da4003eb1a5bd591b6bdf51aad8139dbd6')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  sphinx-build -aqEW -b man doc/sphinx build/man
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -D -m 644 -t "${pkgdir}/usr/share/makepkg/srcaudit" \
    src/srcaudit/*.sh
  install -D -m 755 -t "${pkgdir}/usr/share/makepkg/srcaudit/hexora" \
    src/srcaudit/hexora/*.jq
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man7" \
    build/man/*.7
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples/hxignore" \
    contrib/examples/hxignore/.hxignore.jsonl
}
