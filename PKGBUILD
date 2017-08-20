# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=emby-server-unlocked
pkgver=3.2.28.0
pkgrel=1
pkgdesc='Emby Server compiled with a patch to unlock Emby Premiere features'
arch=('i686' 'x86_64')
url='http://emby.media'
license=('GPL2')
depends=('ffmpeg' 'imagemagick' 'mono' 'referenceassemblies-pcl' 'sqlite')
install='emby-server.install'
provides=('emby-server')
source=("emby-server-${pkgver}.tar.gz::https://github.com/MediaBrowser/Emby/archive/${pkgver}.tar.gz"
        'emby-server'
        'emby-migrate-database'
        'emby-server.conf'
        'emby-server.service'
        'PluginSecurityManager.cs.patch')
backup=('etc/conf.d/emby-server')
sha256sums=('34e335973d0a9a00232f3e4ed0a6518e6005d253ad8f2b691fb56ff0fd240684'
            '7b1974f7bba8ac4b76e51ef7fe1257d165c7c4abbd0915e192391336048a3d74'
            'b25bf83a0ab371aff3b13b82f7af71b51bfe6d7e51eb8a8a3dd8f0774ffce6a5'
            'c9ad78f3e2f0ffcb4ee66bb3e99249fcd283dc9fee17895b9265dc733288b953'
            '8a91ea49a1699c820c4a180710072cba1d6d5c10e45df97477ff6a898f4e1d70'
            'c501e359a7c1268374e8b1cb8be6afe324d8a16788ba27c980efc7bf286ce9d5')

prepare() {
  cd Emby-${pkgver}

  sed 's/libMagickWand-6.Q8.so/libMagickWand-6.Q16HDRI.so/' -i MediaBrowser.Server.Mono/ImageMagickSharp.dll.config
}

build() {
  cd Emby-${pkgver}

  patch -N -p1 -r - Emby.Server.Implementations/Security/PluginSecurityManager.cs < ../PluginSecurityManager.cs.patch

  xbuild \
    /p:Configuration='Release Mono' \
    /p:Platform='Any CPU' \
    /p:OutputPath="${srcdir}/build" \
    /t:build MediaBrowser.sln
  mono --aot='full' -O='all' ../build/MediaBrowser.Server.Mono.exe
}

package() {
  install -dm 755 "${pkgdir}"/{etc/conf.d,usr/{bin,lib/systemd/system}}
  cp -dr --no-preserve='ownership' build "${pkgdir}"/usr/lib/emby-server
  find "${pkgdir}" -type f -name *.dylib -delete
  install -m 755 emby-server "${pkgdir}"/usr/bin/
  install -m 755 emby-migrate-database "${pkgdir}"/usr/bin/
  install -m 644 emby-server.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server

  install -dm 755 "${pkgdir}"/var/lib/emby
  chown 422:422 -R "${pkgdir}"/var/lib/emby
}
