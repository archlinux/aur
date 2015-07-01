# Maintainer: Daniel Seymour <dannyseeless at gmail dot com>

pkgname=emby-server-git
pkgver=r6210.0334458
pkgrel=1
pkgdesc="Emby Server is a home media server built using other popular open source technologies."
arch=('i686' 'x86_64' 'armv6h')
url="http://emby.media"
license=('GPL')
groups=()
depends=('mono' 'libmediainfo' 'sqlite' 'ffmpeg' 'imagemagick')
makedepends=('git' 'imagemagick')
optdepends=()
conflicts=('emby-server' 'emby-server-beta' 'mediabrowser-server-beta'
           'mediabrowser-server' 'mediabrowser-server-git')
provides=('emby-server')
install=emby-server.install
source=("git+https://github.com/MediaBrowser/MediaBrowser#branch=dev" 
        "emby-server.service" "emby-server" 
        "emby-server.conf")
backup=("etc/conf.d/emby-server")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "MediaBrowser"
  (  
    set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  MAGICKWAND=$(ldconfig -p | grep MagickWand.*.so$ | cut -d" " -f4)
  sed -i "s/libMagickWand-6.Q8.so/${MAGICKWAND##*/}/" ${srcdir}/MediaBrowser/MediaBrowser.Server.Mono/ImageMagickSharp.dll.config
}

build(){
  cd ${srcdir}/MediaBrowser
  xbuild /p:Configuration="Release Mono" /p:Platform="Any CPU" /p:OutputPath="${srcdir}/usr/lib/emby-server" /t:build MediaBrowser.Mono.sln
  rm -rf ${srcdir}/MediaBrowser
}

package() {
  install -Dm644 ${srcdir}/emby-server.conf ${pkgdir}/etc/conf.d/emby-server
  install -Dm755 ${srcdir}/emby-server ${pkgdir}/usr/bin/emby-server
  install -Dm644 ${srcdir}/emby-server.service ${pkgdir}/usr/lib/systemd/system/emby-server.service
  cp -r ${srcdir}/usr/lib/emby-server ${pkgdir}/usr/lib
}
