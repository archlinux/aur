# Maintainer : fuero <fuerob@gmail.com>
# Co-Mantainer: Jeff Henson <jeff@henson.io>
# Co-Mantainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Josef Vybíhal <josef.vybihal at gmail dot com>

pkgname=govmomi
pkgdesc='A Go library for interacting with VMware vSphere APIs (ESXi and/or vCenter).'
pkgver=0.24.0
pkgrel=2
url="https://github.com/vmware/${pkgname}"
license=('Apache')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('8922adb4a4c3dc8ee03ca5ce2485df7e45343b318a01f6addc7b6bd7f45c8ed0b908a5c706ec7cfe65d5904b6d5bccf80bdd31dab5721f17357b73600fbe5918')

build() {
  cd "${pkgname}-${pkgver}"

  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  for i in govc vcsim; do
    cd "${i}"

    go build -o "${i}.bin"

    cd -
  done
}

package () {
  cd "${pkgname}-${pkgver}"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve='ownership' "scripts/" "${pkgdir}/usr/share/${pkgname}/"

  install -d "${pkgdir}/usr/share/bash-completion/completions"
  ln -s "/usr/share/${pkgname}/scripts/govc_bash_completion" "${pkgdir}/usr/share/bash-completion/completions/govc"

  for i in govc vcsim; do
    cd "${i}"

    install -Dm755 ${i}.bin "${pkgdir}/usr/bin/${i}"

    for _file in *.md; do
      install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${i}/${_file}"
    done

    cd -
  done

  for _file in *.md; do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}
