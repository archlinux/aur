# Maintainer: SEGFAULT <segfault@mailbox.org>
# Maintainer: spacekookie <kookie@spacekookie.de>
pkgname=ratman
pkgver=0.6.0
pkgrel=1
pkgdesc='A modular decentralised userspace packet router.'
arch=('any')
url='https://irde.st'
license=('AGPL3')
makedepends=('git' 'rust' 'pkg-config' 'clang' 'mdbook')
provides=('ratman' 'ratcat' 'ratctl')
conflicts=('ratmand')
source=("${pkgname}::git+https://git.irde.st/we/irdest.git#tag=${pkgver}")
sha1sums=('SKIP')

build () {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
    cp -r LICENSES ${srcdir}/LICENSES
    
    cargo build --release --all-targets --all-features

    pushd docs/user
    mdbook build
    cp -r book ${srcdir}/irdest-user-manual
    popd

    pushd docs/developer
    mdbook build
    cp -r book ${srcdir}/irdest-developer-manual
    popd

}

package() {
  #cp -rv ${srcdir}/LICENCES/ ${pkgdir}/usr/share/licenses/irdest/

  install -Dm755 ${srcdir}/${pkgname}/target/release/ratmand ${pkgdir}/usr/bin/ratmand
  install -Dm755 ${srcdir}/${pkgname}/target/release/ratcat  ${pkgdir}/usr/bin/ratcat
  install -Dm755 ${srcdir}/${pkgname}/target/release/ratctl  ${pkgdir}/usr/bin/ratctl

  # install -Dm644 ${srcdir}/irdest-user-manual ${pkgdir}/usr/share/docs/irdest-user-manual
  # install -Dm644 ${srcdir}/irdest-develope-manual ${pkgdir}/usr/share/docs/irdest-developer-manual
}
