# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=emby-server-dev-unlocked
pkgver=3.2.33.14
pkgrel=3
pkgdesc='Emby Server compiled with a patch to unlock Emby Premiere features'
arch=('i686' 'x86_64')
url='https://github.com/nicolahinssen/emby-dev-unlocked'
license=('GPL2')
depends=('ffmpeg' 'imagemagick' 'mono' 'referenceassemblies-pcl' 'sqlite')
install='emby-server.install'
provides=('emby-server')
conflicts=('emby-server')
source=("emby-server-${pkgver}.tar.gz::https://github.com/MediaBrowser/Emby/archive/${pkgver}.tar.gz"
        "emby-dev-unlocked-${pkgver}.tar.gz::https://github.com/nicolahinssen/emby-dev-unlocked/archive/${pkgver}.tar.gz"
        'emby-server'
        'emby-migrate-database'
        'emby-server.conf'
        'emby-server.service')
backup=('etc/conf.d/emby-server')
sha256sums=('71613aecb867fe4bc85cdadde1ff33af0d534f49b8bdda89935f437d6539f0b2'
            '5717d7de17dcb97187d86327d279bd12e5aca42a6d48a897d241623c035d436d'
            '7b1974f7bba8ac4b76e51ef7fe1257d165c7c4abbd0915e192391336048a3d74'
            'b25bf83a0ab371aff3b13b82f7af71b51bfe6d7e51eb8a8a3dd8f0774ffce6a5'
            'c9ad78f3e2f0ffcb4ee66bb3e99249fcd283dc9fee17895b9265dc733288b953'
            '8a91ea49a1699c820c4a180710072cba1d6d5c10e45df97477ff6a898f4e1d70')

prepare() {
  cd Emby-${pkgver}

  sed 's/libMagickWand-6.Q8.so/libMagickWand-6.Q16HDRI.so/' -i MediaBrowser.Server.Mono/ImageMagickSharp.dll.config
}

build() {
  cd Emby-${pkgver}

  patch -N -p1 -r - Emby.Server.Implementations/Security/PluginSecurityManager.cs < \
      ../emby-dev-unlocked-${pkgver}/patches/PluginSecurityManager.cs.patch

  xbuild \
    /p:Configuration='Release Mono' \
    /p:Platform='Any CPU' \
    /p:OutputPath="${srcdir}/build" \
    /t:build MediaBrowser.sln
  mono --aot='full' -O='all' ../build/MediaBrowser.Server.Mono.exe

  cp ../emby-dev-unlocked-${pkgver}/replacements/connectionmanager.js ../build/dashboard-ui/bower_components/emby-apiclient
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
