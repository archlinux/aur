# Maintainer : fuero <fuerob@gmail.com>

pkgname='govmomi'
pkgdesc='A Go library for interacting with VMware vSphere APIs (ESXi and/or vCenter).'
pkgver=0.19.0
pkgrel=1
_repo_prefix='github.com/vmware'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('Apache')
arch=('x86_64')
makedepends=('go-pie' 'git')
depends=('glibc')
conflicts=('govmomi-git')
provides=('govmomi')
_commit='e3a01f9611c32b2362366434bcd671516e78955d'
source=("${pkgname}-${pkgver}.tar.gz::https://${_repo_prefix}/${_repo_name}/archive/v${pkgver}.tar.gz")
sha512sums=('463f7f01161166da274ea7b53d8659b37345e58130b1040d2acb715e8f3ed6499a7d84f3e2d8eab9454456044d294ce34ee8c20cf118c4e0565e54035aa05333')

prepare () {
  mkdir -p "src/${_repo_prefix}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_repo_prefix}/${_repo_name}"
}

clean() {
  # Clean up symlink
  rm -f "src/${_repo_prefix}/${_repo_name}"
  for i in govc vcsim
  do
    cd $i
    rm -f ${i}.bin
    cd -
  done
}

_gobuild() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"

  go build -x -i -v -ldflags "-X main.commit=${pkgver##*.} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(cat VERSION).${pkgver##*.}" -o $1
}

build() {
  cd "src/${_repo_prefix}/${_repo_name}"

  for i in govc vcsim
  do
    cd $i
    _gobuild ${i}.bin
    cd -
  done
}

package () {
  cd "src/${_repo_prefix}/${_repo_name}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for i in govc vcsim
  do
    cd $i
    install -Dm755 ${i}.bin "${pkgdir}/usr/bin/${i}"
    for _file in *.md
    do
      install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${i}/${_file}"
    done
    cd -
  done
  
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}
