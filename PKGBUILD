pkgname=docker-registry2-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Docker Registry"
arch=('x86_64' 'armv6h' 'aarch64')
url="https://docs.docker.com/registry/"
makedepends=('docker')
provides=('docker-registry2' 'docker-registry')

case "${CARCH}" in
  x86_64)  _IMAGE_PLATFORM="linux/amd64"    && _IMAGE_DIGEST="3a8eef8d0a818b9bbb4bd17667253473e2d99935ccbbd37649af6bcaa064cf0d";;
  aarch64) _IMAGE_PLATFORM="linux/arm64/v8" && _IMAGE_DIGEST="11fe928b25e5d30266ad8593443fd89544b437a70baf4fc78f2c8e625b208e39";;
  armv6h)  _IMAGE_PLATFORM="linux/arm/v6"   && _IMAGE_DIGEST="fe84722f6cb061170ef0bd56023035b4cb6115b46e596d37496707809ebb464a";;
esac

package() {
  install -d "${pkgdir}/usr/bin"
  _CONTAINER_ID="$(docker run -d registry@sha256:${_IMAGE_DIGEST} -- /bin/sh -c 'exit 0')"
  docker cp "${_CONTAINER_ID}:/bin/registry" "${pkgdir}/usr/bin/registry"
  docker rm -fv "${_CONTAINER_ID}"
}
