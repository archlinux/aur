# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli
pkgver=1.88.0
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

if [ $SKIPPGPCHECK = 0 ] && ! gpg --list-keys 7100E8BFD6199CE0374CB7F003686F8CDE378D41 >/dev/null 2>&1; then
  warning "This package is signed with a GPG key that is not on your system."
  warning "To install this package, you either need to import the key:"
  warning ""
  warning "    gpg --keyserver keys.openpgp.org --recv-key 7100E8BFD6199CE0374CB7F003686F8CDE378D41"
  warning ""
  warning "Or you may install the package without checking the signature:"
  warning ""
  warning "    makepkg --skippgpcheck"
fi

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # This package builds exo cli from a source tarball.
  # But `make build` will bake the latest git tag into the binary.
  # To provide this information to the build process we set it here.
  git init
  git config --local user.email "tooling@exoscale.ch"
  git config --local user.name "Exoscale Tooling"
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
