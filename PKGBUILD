# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-ubuntu
_ppa_ver=2.4.4
_ppa_rel=2~webupd8~utopic0
pkgver=2.4.4
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
sha512sums=('a4d0d488fdd7c4315f106874ac752801554b0cf7d5d246028e7aedae4bf8df28c5473660a2da6d65c184f7cc4a91ecc0af8b3ea3b896b0b37e90199f3fc73781'
            'ec9aaed6ffd0ea92b58da27fc3f081938e35e88364079d64d9bfa6f25f72bd9012fe543438a1771ea607e0dedb77b88c87dceb1e1d72e0f03440162b82957797')

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

  # Fix build
  sed -i '/AC_SUBST(DISABLE_DEPRECATED_CFLAGS)/d' configure.in

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in.in
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
