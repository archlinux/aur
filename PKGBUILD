# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=minio
pkgver=2025.07.18
_timever=T21-56-31Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Object storage server compatible with Amazon S3'
arch=('x86_64')
url='https://minio.io'
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
options=(!lto)
source=(git+https://github.com/minio/minio.git#tag=RELEASE.${_pkgver}
        minio.conf
        minio.service
        minio.sysusers)
backup=('etc/minio/minio.conf')
sha512sums=('b18aa99220677d8e557311d6851dd7ebe72e075e5043e83eb614c273fa4e271426c086ba562d7f7cdd40d6ca9bc3baefbdf730a594e9a1e5d56d080eb7eca352'
            '9fb09d19af9d7a00e4680cd92d208ddd44ce52328f6efee68d7ee47f591cbe77ee88ce139a677bcf8836de0643de18c6c7c4005d50b0056f9b861c3d595e5233'
            'f4df8e50618712b6e5f62e2674eca4430ef17ef003426bd83ea6b427da4e0fb519589cc14547b08db4b4a0de114488920071295a680b0c1cb5fd508d31576190'
            'd55f0b62d9236d66c267b57edf40e60756ce3d12be956cd71c0ab306ea70cb58bb9297e2568483963498917e7b64260d4951ed789be3dffa2ece892923c6093a')

build() {
  cd minio

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export MINIO_RELEASE="RELEASE"
  GO_LDFLAGS="\
      -linkmode=external \
      -compressdwarf=false \
      $(go run buildscripts/gen-ldflags.go)"

  go build -ldflags "$GO_LDFLAGS" .
}

package() {
  install -dm750 -o 103 -g 103 "${pkgdir}/srv/minio"
  install -dm750 -o 103 -g 103 "${pkgdir}/var/lib/minio"

  install -Dm755 minio/minio "${pkgdir}/usr/bin/minio"
  install -Dm600 "${srcdir}/minio.conf" "${pkgdir}/etc/minio/minio.conf"
  install -Dm644 "${srcdir}/minio.service" "${pkgdir}/usr/lib/systemd/system/minio.service"
  install -Dm644 "${srcdir}/minio.sysusers" "${pkgdir}/usr/lib/sysusers.d/minio.conf"
}
