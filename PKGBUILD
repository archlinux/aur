# Maintainer : fuero <fuerob@gmail.com>
# Co-Mantainer: Jeff Henson <jeff@henson.io>

pkgname=govmomi
pkgdesc='A Go library for interacting with VMware vSphere APIs (ESXi and/or vCenter).'
pkgver=0.22.1
pkgrel=2
_repo_prefix='github.com/vmware'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('Apache')
arch=('x86_64')
makedepends=('go' 'git')
depends=('glibc')
_commit='e3a01f9611c32b2362366434bcd671516e78955d'
source=("${pkgname}-${pkgver}.tar.gz::https://${_repo_prefix}/${_repo_name}/archive/v${pkgver}.tar.gz")
sha512sums=('d63dd7d82dda867aae93e78261b464eb6d4af99c434ad37faaf506d1dd48294701b48b288307da17a250534c4b31215027b45c8fbca5076f6d6ae8c73afd3d24')

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
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"

  go build -v \
        -ldflags "-X main.commit=${pkgver##*.} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(cat VERSION).${pkgver##*.}" \
        -mod=readonly \
        -modcacherw \
        -trimpath \
        -buildmode=pie \
        -o $1
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
