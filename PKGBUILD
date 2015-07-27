# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Hussam Al-Tayeb ht990332@gmail.com
# Contributor: Khashayar Naderehvandi <khashayar [at] naderehvandi [dot] net>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>

_name=compiz
pkgname=compiz-gtk-standalone
pkgdesc="Compiz compositing window manager with gtk decorator. No specific DE integration. Sane defaults. Good for minimal Compiz setups."
pkgver=0.8.10
pkgrel=2
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL' 'LGPL' 'MIT')
depends=('startup-notification' 'librsvg' 'libgl' 'dbus' 'glu' 'libxslt' 'fuse' 'libsm' 'gconf' 'libwnck' 'metacity2' 'zenity')
makedepends=('intltool')
optdepends=("compiz-fusion-plugins-main: Compiz Main plugins"
            "compiz-fusion-plugins-extra: Compiz Extra plugins"
            "compiz-fusion-plugins-unsupported: Unsupported Compiz plugins"
            "ccsm: CompizConfig Settings Manager in Python2")
conflicts=('compiz-core' 'compiz-decorator-gtk')
provides=("compiz-core=${pkgver}" 'compiz-decorator-gtk')
install="${pkgname}.install"

source=("${_name}-core-${pkgver}.tar.gz::http://www.northfield.ws/projects/${_name}/releases/${pkgver}/core.tar.gz"
        'compiz-standalone-defaults.patch'
        'compiz-gtk-decorator-theme-selector'
        'compiz-gtk-decorator-theme.desktop')

sha1sums=('8487aa83ff46d0fcef6a21591b56f4acdd8016df'
          '59f37feafedd0cb949498fcbaebe3a298aab3af6'
          'fe98e5f52d93166a9966d03486a486420df6f706'
          '9b3dd487e9142e826848dc6b5d95a98fbb648f3c')

prepare() {
  cd "${srcdir}/core"
  # Some sane defaults
  patch -Np1 -i "${srcdir}/compiz-standalone-defaults.patch"
}

build() {
  cd "${srcdir}/core"
  ./autogen.sh   --prefix=/usr \
	    --enable-gtk \
	    --enable-metacity \
	    --enable-gconf \
            --with-gconf-schema-file-dir=/etc/gconf/schemas \
	    --enable-dbus \
	    --enable-librsvg \
	    --disable-gnome \
	    --disable-kde \
	    --disable-kde4 \
	    --with-default-plugins="ccp,decoration,resize,place,move,regex,fade,expo,switcher"
  make
}

package() {  
  cd "${srcdir}/core"
  install -Dm644 gtk/window-decorator/gwd.schemas "${pkgdir}/usr/share/gconf/schemas/gwd.schemas"
  for i in dbus gconf ini inotify png regex svg glib kconfig
  do
    rm "${srcdir}"/core/metadata/compiz-$i.schemas
  done
  gconf-merge-schema "${pkgdir}"/usr/share/gconf/schemas/compiz-decorator-gtk.schemas "${srcdir}"/core-compiz-0.8.9/metadata/*.schemas
  make DESTDIR="${pkgdir}" install
  # install MIT license
  install -Dm644 "${srcdir}/core/COPYING.MIT" "${pkgdir}/usr/share/licenses/compiz/COPYING.MIT"
  
  install -Dm755 "${srcdir}/compiz-gtk-decorator-theme-selector" "${pkgdir}/usr/bin/compiz-gtk-decorator-theme-selector"
  install -Dm644 "${srcdir}/compiz-gtk-decorator-theme.desktop" "${pkgdir}/usr/share/applications/compiz-gtk-decorator-theme.desktop"
}
