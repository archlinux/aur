# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=olaris-git
_pkgname=olaris-server
epoch=1
pkgver=0.4.0.r5.g8fb0611
pkgrel=1
pkgdesc='open-source, community driven, media manager and transcoding server'
arch=('x86_64')
url="https://gitlab.com/olaris/olaris-server"
license=('GPL3')
makedepends=('go' 'git' 'unzip' 'go-bindata-assetfs')
conflicts=('olaris')
provides=('olaris')
source=("${_pkgname}::git+https://gitlab.com/olaris/olaris-server.git"
    "react-static.zip::https://gitlab.com/api/v4/projects/olaris%2Folaris-react/jobs/artifacts/develop/download?job=build"
    "ffmpeg-build.zip::https://gitlab.com/api/v4/projects/olaris%2Fffmpeg/jobs/artifacts/master/download?job=compile"
    "olaris.service"
)
noextract=('react-static.zip' 'ffmpeg-build.zip')
sha256sums=('SKIP' 'SKIP' 'SKIP'
    '2592546c3ac1ee3c7c7120edbfeecfe1053106a78bd5179c4a2077f3c764c871')

pkgver() {
  cd ${_pkgname}
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  unzip -o $srcdir/react-static.zip -d react/

  # adjusted  from the upstream Makefile, olaris needs to include
  # their own version of ffmpeg binaries
  FFMPEG_LOC=ffmpeg/executable/build/linux-amd64
  mkdir -p $FFMPEG_LOC
  unzip -j -o $srcdir/ffmpeg-build.zip \
      ffmpeg-static/bin/ffmpeg ffmpeg-static/bin/ffprobe \
      -d $FFMPEG_LOC

  make generate
  make build-local
}

package() {
  cd ${_pkgname}
  install -Dm755 build/olaris "$pkgdir"/usr/bin/olaris
  install -Dm644 doc/config-examples/systemd/olaris.service "$pkgdir"/usr/lib/systemd/user/olaris.service
  install -Dm644 $srcdir/olaris.service "$pkgdir"/usr/lib/systemd/system/olaris.service
}
