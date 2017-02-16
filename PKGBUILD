# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=minio
pkgver=2017.02.16
_pkgver="${pkgver//./-}T01-47-30Z"
pkgrel=1
pkgdesc='Object storage server compatible with Amazon S3'
arch=('x86_64' 'i686')
url='https://minio.io'
license=('APACHE')
makedepends=('go')
depends=('glibc')
options=('!strip')
install=minio.install
source=(https://github.com/minio/minio/archive/RELEASE.${_pkgver}.tar.gz
        minio.conf
        minio.service)
sha512sums=('8db8bddeba6e69b675857cc32fee8cbdc3bbf31db683f3cc7234b9c146c5d67e849c01ab732508789fc321a2847b0ddf42c95a30fd60757177d38b4d6cc7927a'
            '630a5d109409074b67be71b663a43ad09104121cca3637bb0542df19e375023bff7d7e2cbf39e52cc3cd060d41c363a90bd4ff7734aed1a5ca43a600f6d6d275'
            '36dbd6b9d27d66b3e7dfb4f6b20fc1939dc42286b5c0ffc399760e5bebffee08548834a0a780d45b815c7c78ca6c738bf0da61ec734131fcc704e65874e04486')

build() {
  export GOPATH=${srcdir}/go
  mkdir -p ${GOPATH}/src/github.com/minio
  mv ${srcdir}/minio-RELEASE.${_pkgver} ${GOPATH}/src/github.com/minio/minio
  cd ${GOPATH}/src/github.com/minio/minio
  go build
}

package() {
  install -dm750 ${pkgdir}/srv/minio
  
  export GOPATH=${srcdir}/go
  cd ${GOPATH}/src/github.com/minio/minio
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/minio.conf ${pkgdir}/etc/minio/${pkgname}.conf
  install -Dm644 ${srcdir}/minio.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
