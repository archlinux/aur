# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=olaris-git
_pkgname=olaris-server
epoch=1
pkgver=0.4.0.r66.gbdb2aeb
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

sha256sums=('SKIP'
            'd31b643147646c2955b645df34dcc817bc8150cde486c83843914b8032b3c3e7'
            'b2c13331eff6dcdc0ff13a36cef8523beca22521b8f2ed56b9984e0f39f5e2b8'
            '85650f61664eadb299212082ad54d6322ae3b63aa924fb64ab15591e1a0b32ff')
