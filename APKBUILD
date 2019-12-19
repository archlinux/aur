# Maintainer: zer0def <zer0def@zer0def.0>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgname=kata-runtime
subpackages="kata-proxy kata-shim"
pkgver=1.10.0_rc0
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch='x86_64'
url="https://katacontainers.io/"
license='Apache'
makedepends='go make linux-headers'
_gh_org="github.com/kata-containers"
source="proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64"

#abuild-keygen -a && for i in deps fetch checksum unpack prepare build rootpkg; do abuild ${i}; done
prepare(){
  mkdir -p "${srcdir}/src/${_gh_org}" "${srcdir}/bin"
  mv "${srcdir}/yq_linux_amd64" "${srcdir}/bin/yq"
  chmod +x "${srcdir}/bin/yq"
  for i in proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

build(){
  export PATH="${srcdir}/bin:${PATH}"
  for i in proxy runtime shim; do
    echo "Building kata-${i}…"
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package(){
  cd "${srcdir}/src/${_gh_org}/runtime"
  sed -i 's/install --mode 0644 /install /' Makefile
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

proxy(){
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${subpkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${subpkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
sha512sums="0471b8e876c3a49772d56a72e99dd4d36ad5136bbefc212250c83a78f29f0f6e03cc5fd94d70fc61d2b07613ff19fc9a1dfde915364e15838b6b4f6916278e5a  proxy-1.10.0-rc0.tar.gz
93c1be4386563e246276f5e10a4a65f2fe084c5fbf9e79b65b0541f9ec72281119380bd94eb4022c573461b6b2ddbd3777b0b50de9645f54b5499e40107117d6  runtime-1.10.0-rc0.tar.gz
426baf82874b614347772d824f7e8a8c02505f41f060ebef931c6f2bc112b41ad4209703994e22808d35e046f8e9e750177a8a07fe596028081595b1ccf3c807  shim-1.10.0-rc0.tar.gz
224b9d6b48ba565c792af465962293e994b8922b83649348771a27c026468b823cdb8e49ba4a8f989b26d31ea46be0032b44a7af253b251eeafab2077299fac0  yq_linux_amd64"
