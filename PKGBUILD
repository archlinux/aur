# Maintainer: Roman Lisagor <rlisagor at gmail dot com>

pkgname=calicoctl
pkgver=1.6.3
pkgrel=1
pkgdesc="Calico CLI tool"
arch=('x86_64')
url="https://github.com/projectcalico/calicoctl"
license=("Apache")
makedepends=('go' 'glide')
depends=('glibc')
source=("https://github.com/projectcalico/${pkgname}/archive/v${pkgver}.tar.gz"
        "no-install-during-build.patch")
sha512sums=('d08c38972d0cbe54320366463d60ae6633f687fea6dc94cfe677c8cda178d4637ea6a16875c7d9b0acea4839fa8a630325d489a549d2f3a03fdfc79abb3b3a98'
            '328016b77923eb06a1e816b5065bdac7cf583979098e82709936f2bdc3af9900698d3e056d5a16f49f7a445113cd75f04f751b99ab1d6ca62770c66fbec08962')


prepare() {
  rm -rf ${srcdir}/gopath
  mkdir -p ${srcdir}/gopath/{src,bin,pkg}
  mkdir -p ${srcdir}/gopath/src/github.com/projectcalico/

  mv calicoctl-${pkgver} ${srcdir}/gopath/src/github.com/projectcalico/calicoctl

  cd ${srcdir}/gopath/src/github.com/projectcalico/calicoctl
  patch -Np1 -i "${srcdir}/no-install-during-build.patch"
}

build() {
  cd ${srcdir}/gopath/src/github.com/projectcalico/calicoctl
  export GOPATH=${srcdir}/gopath
  glide install -strip-vendor
  make binary
}

package() {
  install -Dm755 \
    ${srcdir}/gopath/src/github.com/projectcalico/calicoctl/dist/calicoctl-linux-amd64 \
    ${pkgdir}/usr/bin/calicoctl
}
