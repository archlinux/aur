# Maintainer : fuero <fuerob@gmail.com>
# Co-Mantainer: Jeff Henson <jeff@henson.io>
# Co-Mantainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Josef Vybíhal <josef.vybihal at gmail dot com>

pkgname=govmomi
pkgdesc='A Go library for interacting with VMware vSphere APIs (ESXi and/or vCenter).'
pkgver=0.44.1
pkgrel=1
url="https://github.com/vmware/${pkgname}"
license=('Apache')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a7246dd5ab2c99c6a283020e1567266e53850d24eca72eaca9f789979d7e7fb0e5d4712be5c76b37a4c05e1941a49ee82730d621b50a849f09a2fc95f88456ed')

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
