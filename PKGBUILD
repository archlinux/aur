# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(
  kata-ksm-throttler
  kata-runtime
  kata-proxy
  kata-shim
)
pkgver=1.11.4
_pkgver=${pkgver/\~/-}
pkgrel=3
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=('go')

_gh_org="github.com/kata-containers"

source=(
  "ksm-throttler-${_pkgver}.tar.gz::https://${_gh_org}/ksm-throttler/archive/${_pkgver}.tar.gz"
  "proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz"
  "runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz"
  "shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz"
)
sha512sums=(
  326fe4e74313110b7afd4a701946ac90808ecd02643656cef27a180d5d47645e4bad5ede3ba9fb29cbfce1a691fb10d2136485fff4bcc651192c28e795102e43
  e19619110b4162e22bc4fa6c17330d9d77519a015971acbd8101ef9b4fbab728eb5779dc8c98c77e99a9a6355ce09408b37ecd440cef24ff8bb3e2e3156ef160
  f5b932d19b13a6150037d4929038142e218e752bf8cd52bf5a19b29abcf0bb377683ba84c9412b5f744549099d12ba82c2a35188230af759991ffff5eca7bce1
  8632772e67c2e045a9363eb00af3309632a5b15b8afe12a1756ae74fa484a0e7f9293b019355f483c6771a9294e09d518d40f34d15c114a0ca2bca90712171ab
)
b2sums=(
  5302020c94d0fe47ae605be048da8080e4aa9ab9ba8a669772ba4389240917e94d7ab61252b0866db17d471942ccefba9b4871b365f359b7d9d6fae3e70b801e
  f514bb42482fcdf54454cb6e2362a45a897f6e3cd748ebd1bab7d1fe4a0736ec27bfa07d8ccc7bd7b037c4cf097bb23ecd69b2f93d31f9028c8dafc28fecd39d
  4721581ccc2c4af854091dd60ef6134e7285672993c99a0e0f4932de422d887b197ad80176fbc1a2f4085dfe9ae8baf044ee0728a92b7aedbc02139e62e84c0c
  0625dc648f976b2aa0dc8b9a8b06eb0e25b043f68506861aa85888646648df347adfe7d1b94c24315315f6f81e1fb9c89d6f07102401b6eb2b4de8c818001d55
)

prepare(){
  install -dm0755 "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  install -dm0755 "${srcdir}/src/${_gh_org}"
  for i in ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

build(){
  for i in ksm-throttler proxy runtime shim; do
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package_kata-ksm-throttler(){
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata-proxy(){
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-runtime(){
  depends=('qemu-headless' "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container" "kata-containers-image")
  optdepends=(
    "kata-ksm-throttler=${pkgver}"
    'firecracker<0.22.0'
    'cloud-hypervisor<0.8.0'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
