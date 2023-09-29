# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli
pkgver=1.74.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')

makedepends=(git go make)
validpgpkeys=('7100E8BFD6199CE0374CB7F003686F8CDE378D41')
source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/exoscale/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz.sig")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # This package builds exo cli from a source tarball.
  # But `make build` will bake the latest git tag into the binary.
  # To provide this information to the build process we set it here.
  git init
  git add Makefile
  git commit -m "dummy commit"
  git tag v${pkgver}

  make build
  make completions
  make manpages
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  install -Dm 755 ./bin/exo "${pkgdir}/usr/bin/exo"
  install -Dm 644 ./contrib/completion/bash/exo -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 ./contrib/completion/zsh/_exo -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -dm 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 ./manpage/* "${pkgdir}/usr/share/man/man1"
}
