# Maintainer: GT610 <myddz1005@163.com>
# Ported from gcr-git
# Contributer of gcr-git: Veli Tasalı (tasali) <me@velitasali.com>
pkgbase=gcr-338
pkgname=(gcr-338 gcr-docs-338)
pkgver=3.38.1
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing (Version 3.38)"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64)
license=(GPLv2)
depends=(gtk3 gtk-doc libgcrypt p11-kit openssh libsecret)
makedepends=(gobject-introspection vala libxslt git gi-docgen meson)
options=(debug)
source=("https://download.gnome.org/sources/gcr/3.38/gcr-3.38.1.tar.xz")
md5sums=('e7f9e86da73b7308aae16cac0f392721')
sha256sums=('17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9')

prepare() {
  cd gcr-3.38.1
  sed -i 's:"/desktop:"/org:' schema/*.xml
  # Fix a known issue:
  #gcr-3.38.1/gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
  # https://gitlab.gnome.org/GNOME/gcr/-/issues/89
  sed -i '134d' gck/meson.build
  sed -i '192d' gcr/meson.build
  sed -i '156d' ui/meson.build
}

build() {
  arch-meson gcr-3.38.1 build --prefix=/usr -Dgtk_doc=true
  cd build
  ninja
}

check() {
  # 43 of 43 should pass
  cd build
  ninja test
}

package_gcr-338() {
  provides=(gcr libgck-1.so libgcr-base-3.so libgcr-ui-3.so)
  conflicts=(gcr gcr-git)
  backup=(etc/security/limits.d/10-gcr.conf)
  install=gcr.install
  cd build
  DESTDIR=$pkgdir ninja install

  # gcr wants to lock some memory to prevent swapping out private keys
  # https://bugs.archlinux.org/task/32616
  # https://bugzilla.gnome.org/show_bug.cgi?id=688161
  install -Dm644 /dev/stdin "$pkgdir/etc/security/limits.d/10-gcr.conf" <<END
@users - memlock 1024
END
}

package_gcr-docs-338() {
  provides=(gcr-docs)
  conflics=(gcr-docs gcr-docs-git)
  pkgdesc+=" (documentation)"
  depends=()
  mkdir "$pkgdir"/usr "$pkgdir"/usr/share "$pkgdir"/usr/share/doc
  cd build
  mv docs/* "$pkgdir"/usr/share/doc
}

# vim:set sw=2 sts=-1 et:
