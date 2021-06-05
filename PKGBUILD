# See AUR interface for current maintainer
# Edited to include libxnvctrl dependancy
# Based on http://xfce.10915.n7.nabble.com/NVidia-data-td16172.html
# also based on arch bug report https://bugs.archlinux.org/task/25548

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

_pkgname=xfce4-sensors-plugin
pkgname=xfce4-sensors-plugin-nvidia
pkgver=1.3.95
pkgrel=1
pkgdesc="A lm_sensors plugin for the Xfce panel with nvidia gpu support"
arch=('i686' 'x86_64')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors' 'libnotify' 'hicolor-icon-theme' 'libxnvctrl')
makedepends=('intltool' 'hddtemp' 'gnu-netcat')
optdepends=('hddtemp: for monitoring the temperature of hard drives')
conflicts=('xfce4-sensors-plugin')
source=(
	https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
	nvidia.c.patch
)
sha256sums=('83c64ae4618dd592971cfa0bc285a9b47af801a3ed856835cdb2a4c533c7846c'
            '5ed9142eb3b213f7b9b354ba3e967994a9046c78579256567ebda7e462237d8a')

prepare() {
  patch ./"$_pkgname-$pkgver"/lib/nvidia.c -i ./nvidia.c.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --datadir=/usr/share \
    --datarootdir=/usr/share \
    --disable-static \
    --disable-debug \
    --disable-pathchecks
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
