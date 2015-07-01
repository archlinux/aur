# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Alexandr Grigorcea <cahr.gr@gmail.com>

pkgname=nuvolaplayer
pkgver=2.5.0
pkgver_broadcast=`echo $pkgver | sed 's/\(.*\)\../\1.x/g'`
pkgrel=1
pkgdesc="Integrated Google Music, Grooveshark, 8tracks and Hype Machine player."
arch=(i686 x86_64)
url="http://nuvolaplayer.fenryxo.cz"
license=('GPL3')
depends=('json-glib' 'intltool' 'gtk3' 'webkitgtk' 'python2' 'libnotify' 'libx11' 'libunique' 'libgee06' 'libsoup' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly')
makedepends=('vala' 'scour')
provides=('nuvola')
conflicts=('google-musc-frame-bzr')
optdepends=('gnome-shell-extension-mediaplayer-git: Gnome Shell integration' 'tsocks: Socks proxy support' 'lib32-flashplugin: Flash plugin support on 64-bit systems.')
replaces=('google-music-frame-bzr' 'nuvola-bzr' 'nuvola-bzr-stable' 'nuvolaplayer-beta')
options=()
#source=(https://launchpad.net/nuvola-player/${pkgver_broadcast}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
source=(https://launchpad.net/nuvola-player/2.5.x/2.5.0/+download/nuvolaplayer-2.5.tar.gz)
md5sums=(a8be1d992d63f3a36fb6296e4e041458)
install=nuvola.install

build() {
  #only for 2.5
  mv "${srcdir}/${pkgname}-2.5" "${srcdir}/${pkgname}-2.5.0"
  cd "${srcdir}/${pkgname}-${pkgver}"
  LDFLAGS="$LDFLAGS -ldl"

  python2 ./waf configure --prefix=/usr --no-unity-quick-list --with-gstreamer=1.0
  sed -i "s/ctx.env.SCOUR/'python2  \/usr\/bin\/scour'/" wscript
  python2 ./waf build $MAKEFLAGS --skip-tests || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 ./waf install --destdir="${pkgdir}"
}
