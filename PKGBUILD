# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=minio
pkgver=2016.12.13
_pkgver='2016-12-13T17-19-42Z'
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
sha512sums=('34c376f36e90c88ebf9d08caadc7834ac45a413be808614e8c407657c322a2cb8d09696af76a010724265798bf146a24855d817072622af89977d4063a7bcd37'
            'c48b359000fe933b1aa3d4f5384b579187b17388734e16d4fdaa2a8a81457b7cea6f3809edf5f6396318982ba22d69affe7d697ff0a05eeabe4a9458c14410f1'
            'ebf8cf15964ca9dee800407e0b723367de72dec1d1b5bf5988d4e6702695193c61c1b3ee79dc1c13382a7fba15d79e0b8e923c9a7c2a31bc74414b02a0858a97')

build() {
  export GOPATH=${srcdir}/go
  mkdir -p ${GOPATH}/src/github.com/minio
  mv ${srcdir}/minio-RELEASE.${_pkgver} ${GOPATH}/src/github.com/minio/minio
  cd ${GOPATH}/src/github.com/minio/minio
  go build
}

package() {
  export GOPATH=${srcdir}/go
  cd ${GOPATH}/src/github.com/minio/minio
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/minio.conf ${pkgdir}/etc/minio/${pkgname}.conf
  install -Dm644 ${srcdir}/minio.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  install -dm750 ${pkgdir}/srv/minio
}
