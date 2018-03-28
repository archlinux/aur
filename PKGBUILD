# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=emby-server-dev-unlocked
pkgver=3.3.1.10
pkgrel=1
pkgdesc='Latest development version of Emby Server compiled with a patch to unlock Emby Premiere features'
arch=('i686' 'x86_64')
url='https://github.com/nicolahinssen/emby-dev-unlocked'
license=('GPL2')
makedepends=('git')
depends=('ffmpeg' 'imagemagick' 'mono' 'referenceassemblies-pcl' 'sqlite')
install='emby-server.install'
provides=('emby-server')
conflicts=('emby-server')
source=('git+https://github.com/nicolahinssen/emby-dev-unlocked.git'
        'emby-server'
        'emby-migrate-database'
        'emby-server.conf'
        'emby-server.service')
backup=('etc/conf.d/emby-server')
sha256sums=('SKIP'
            '7b1974f7bba8ac4b76e51ef7fe1257d165c7c4abbd0915e192391336048a3d74'
            'b25bf83a0ab371aff3b13b82f7af71b51bfe6d7e51eb8a8a3dd8f0774ffce6a5'
            'c9ad78f3e2f0ffcb4ee66bb3e99249fcd283dc9fee17895b9265dc733288b953'
            '8a91ea49a1699c820c4a180710072cba1d6d5c10e45df97477ff6a898f4e1d70')

pkgver() {
  git ls-remote --tags --refs https://github.com/MediaBrowser/Emby.git | awk '{print $2}' | grep -v '{}' | awk -F"/" '{print $3}' | sort -V | tail -n 1
}

prepare() {
  git clone --depth 1 https://github.com/MediaBrowser/Emby.git -b dev

  cd Emby

  sed 's/libMagickWand-6.Q8.so/libMagickWand-6.Q16HDRI.so/' -i MediaBrowser.Server.Mono/ImageMagickSharp.dll.config
}

build() {
  export TERM=xterm

  cd Emby

  patch -N -p1 -r - Emby.Server.Implementations/Security/PluginSecurityManager.cs < \
      ../emby-dev-unlocked/patches/PluginSecurityManager.cs.patch

  xbuild \
    /p:Configuration='Release Mono' \
    /p:Platform='Any CPU' \
    /p:OutputPath="${srcdir}/build" \
    /t:build MediaBrowser.sln
  mono --aot='full' -O='all' ../build/MediaBrowser.Server.Mono.exe

  cp ../emby-dev-unlocked/replacements/connectionmanager.js ../build/dashboard-ui/bower_components/emby-apiclient
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
