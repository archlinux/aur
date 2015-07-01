# Maintainer: Daniel Seymour <dannyseeless at gmail dot com>

pkgname=emby-server-beta
pkgver=3.0.5641.4
_commit=f35263111847d9f8b7679104fd52e34db00f542a
pkgrel=1
pkgdesc="Emby Server is a home media server built using other popular open source technologies."
arch=('i686' 'x86_64' 'armv6h')
url="http://emby.media"
license=('GPL')
groups=()
depends=('mono' 'libmediainfo' 'sqlite' 'ffmpeg' 'imagemagick')
makedepends=('imagemagick')
optdepends=()
conflicts=('emby-server' 'emby-server-git' 'mediabrowser-server'
           'mediabrowser-server-beta' 'mediabrowser-server-git')
provides=('emby-server')
install=emby-server.install
source=("https://github.com/MediaBrowser/MediaBrowser/archive/$_commit.tar.gz"
        "emby-server.service" "emby-server" 
        "emby-server.conf")
backup=('etc/conf.d/emby-server')
md5sums=('bd049dd1d1b965fdc449a7e919c358ea'
         '07948b362480a371c4be50c3b9854eeb'
         '69d0ebc1fff9c8ac2f5ff4a6db20ce42'
         '184f023f2a407be2fdd60b236e9f792e')

prepare() {
  MAGICKWAND=$(ldconfig -p | grep MagickWand.*.so$ | cut -d" " -f4)
  sed -i "s/libMagickWand-6.Q8.so/${MAGICKWAND##*/}/" ${srcdir}/MediaBrowser-$_commit/MediaBrowser.Server.Mono/ImageMagickSharp.dll.config
}

build(){
  cd ${srcdir}/MediaBrowser-$_commit
  xbuild /p:Configuration="Release Mono" /p:Platform="Any CPU" /p:OutputPath="${srcdir}/usr/lib/emby-server" /t:build MediaBrowser.Mono.sln
  rm -rf ${srcdir}/MediaBrowser-$_commit
}

package() {
  install -Dm644 ${srcdir}/emby-server.conf ${pkgdir}/etc/conf.d/emby-server
  install -Dm755 ${srcdir}/emby-server ${pkgdir}/usr/bin/emby-server
  install -Dm644 ${srcdir}/emby-server.service ${pkgdir}/usr/lib/systemd/system/emby-server.service
  cp -r ${srcdir}/usr/lib/emby-server ${pkgdir}/usr/lib
}
