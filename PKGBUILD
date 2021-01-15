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
pkgver=1.12.1
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go'
  #'yq2-bin'
)
_gh_org="github.com/kata-containers"
source=(
  "ksm-throttler-${_pkgver}.tar.gz::https://${_gh_org}/ksm-throttler/archive/${_pkgver}.tar.gz"
  "proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz"
  "runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz"
  "shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz"
  #"3082.patch"  # https://github.com/kata-containers/runtime/pull/3082 fixing https://github.com/kata-containers/runtime/issues/2982
)
sha512sums=(
  5653a4110e57f3145041b0aef1b9f4b8be67d8d0c04144dfbb3b613362bdb6ce67199e9f34d1224cbf08255efe6d191a6e03ba40c35d4d0650004e2582774de4
  9bd64016374354364d45522239a81b12a7cd3436b0842793e2964bc5b8bc79f6c8be57d71b7384985c416889293688f8c65dffacba23dbf653d9a0ba916263d9
  c831eaa3d0fcddbb5dca0e18f3dfb4e616d45edb42031532c8ea52243a73e685d8f888671a27665f09d0aed41e27ac2035c78ff491f836a044a036d05f922dd7
  acc1592a91f56057a5dc3380824811d436cd82a17e41e028289eb8837aa5fbbb8b811cec51844789f7611b7c009b2050f07bd8c69f7ab28842e4f5fe7accc0b3
  #87568f7db71a816f4953245af4b302da2f0a19543a706bce9d84e9c7e9de8f6ef54f410e426f05c4faf46bcfb330f802fa8261848beda3aaa965bfc11408a5ca
)
b2sums=(
  c930d082e0a9faa4a90751b3d67e91868bda12dea4ee6f3f565a24c1d074e7b4ed09a93ba14f9696e0891452e2d69a685ec837e7183bc9ff86b479034ed40fc9
  206bfe0e7d8be050f934ffbd7516543dfc3aca7339e83b318db8acd6323d4c3e68e8bb4f1dfa3530b7b5404960b27867a79396154d0fc61ec3445a5f0e70a78f
  72d9995a45997c2d407f411f9a177207e23f382b40c08c1930c07029d76bcb3b703d3e80a209e98dc7646d6b1736cab4a1047974a2fb917419a4a6d94e796dd5
  a73a3ce69ff54e7d172ef30e73678d4aaf12ab725798fe6e057f0ca163a95d7ce43c599fec9e7767259b4b793543febd1b7478678400e7f01204a1df89af9556
  #d4f55b660a26ff6dc9e9a7f4eab80f3a45a228b9780054ae0a8d1080ca8db29333818e9e83235c4e6a128117473fe8fcb8f9e5831042aaf71d4defca09808ef2
)

prepare(){
  #install -dm0755 "${srcdir}/bin"
  #ln -sf "$(command -v yq)" "${srcdir}/bin/yq"

  install -dm0755 "${srcdir}/src/${_gh_org}"
  for i in ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
  cd "${srcdir}/src/${_gh_org}/runtime"
  #patch -p1 <"${srcdir}/3082.patch"
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
    'cloud-hypervisor<0.9.0'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
