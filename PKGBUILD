# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-ubuntu
_ppa_ver=2.6.5
_ppa_rel=2~webupd8~vivid02
pkgver=2.6.5
pkgrel=1
pkgdesc="Cinnamon file manager (Nautilus fork)"
arch=(i686 x86_64)
url="https://github.com/linuxmint/nemo"
license=(GPL)
depends=(libexif gvfs dconf desktop-file-utils exempi python2
         gnome-icon-theme libnotify libxml2 cinnamon-translations)
makedepends=(gtk-doc gobject-introspection intltool gnome-common
             python2-gobject python2-polib)
provides=("nemo=${pkgver}")
conflicts=(nemo)
options=(!emptydirs)
install=nemo.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/nemo/tarball/${pkgver}"
        "http://ppa.launchpad.net/webupd8team/nemo/ubuntu/pool/main/n/nemo/nemo_${_ppa_ver}-${_ppa_rel}.debian.tar.xz")
sha512sums=('d5e6f3e06cb63140498a7b883fdbf6934ac7d9d7493ccde2038281733c28f82c942b5f7709a6bc8a126fedfd980631410f80c4ffd8477303f8a89bca3ce4eb48'
            'a516bf1a6ec5fa1598225c6ca0043fc546240ab1d5bd86b928a617764fedfde34e17003e3c1d1abc18a1ade9dbc2ef0ace9f4f58d068154d3beffd1d792ad2f9')

prepare() {
  cd linuxmint-nemo-*

  # Disable patches
  sed -i '/15_use_ubuntu_help.patch/d' ../debian/patches/series

  for i in $(grep -v '#' ../debian/patches/series); do
    patch -p1 -i ../debian/patches/${i}
  done

  # Python2 fix
  sed -i 's/bin\/python/bin\/python2/g' files/usr/share/nemo/actions/myaction.py
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Fix desktop style with Adwaita theme
  sed -i 's/add_class (\(.*\), "nemo-/add_class (\1, "nautilus-/' \
    libnemo-private/nemo-icon-{canvas-item,container}.c

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in.in

  sed -i '/gnome_bg_set_draw_background/d' libnemo-private/nemo-desktop-background.c
}

build() {
  cd linuxmint-nemo-*

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nemo \
      --disable-update-mimedb \
      --disable-tracker \
      --disable-gtk-doc-html \
      --disable-schemas-compile
  make
}

package() {
  cd linuxmint-nemo-*

  make DESTDIR="${pkgdir}/" install
}
