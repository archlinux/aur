# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli
pkgver=1.72.2
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')

makedepends=(git go make)
source=("${pkgname}::git+https://github.com/exoscale/cli.git#tag=v${pkgver}"
        "git+https://github.com/exoscale/go.mk.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule.libs/libdep.url "$srcdir/lib-dependency"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"

  make build
  make completions
  make manpages
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm 755 ./bin/exo "${pkgdir}/usr/bin/exo"
  install -Dm 644 ./contrib/completion/bash/exo -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 ./contrib/completion/zsh/_exo -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -dm 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 ./manpage/* "${pkgdir}/usr/share/man/man1"
}
