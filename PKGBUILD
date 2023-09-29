# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli-git
pkgver=1.74.0.r1.g96a32d26
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

makedepends=(git go make)
source=("${pkgname}::git+https://github.com/exoscale/cli.git"
        "git+https://github.com/exoscale/go.mk.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule.libs/libdep.url "$srcdir/lib-dependency"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"

  # This package builds the latest commit on the master branch,
  # which may be ahead of the latest release. But `make build`
  # will bake the latest tag into the binary which is not accurate.
  # Thus we set a temporary tag, so that the `exo version` command doesn't mislead.
  git tag v${pkgver}

  make build
  make completions
  make manpages

  # cleanup the tag as it is not an official release
  git tag -d v${pkgver}
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm 755 ./bin/exo "${pkgdir}/usr/bin/exo"
  install -Dm 644 ./contrib/completion/bash/exo -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 ./contrib/completion/zsh/_exo -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -dm 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 ./manpage/* "${pkgdir}/usr/share/man/man1"
}
