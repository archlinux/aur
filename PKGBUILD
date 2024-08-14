# Maintainer: Thorsten Toepper <atsutane-aur at freethoughts dot de>
# Contributor: éclairevoyant
# Contributor: Brian Bidulock <bidulock at openss7 dot org>
# Contributor: Jan de Groot <jgc at archlinux dot org>
# Contributor: Aline Freitas <aline at alinefreitas dot com dot br>

pkgname='polkit-git'
pkgver=125.r0.112752c
pkgrel=1
epoch=1
pkgdesc='Application development toolkit for controlling system-wide privileges'
arch=('i686' 'x86_64')
license=(LGPL-2.0-or-later)
url='https://github.com/polkit-org/polkit'
depends=('duktape' 'expat' 'glib2' 'glibc' 'pam' 'systemd-libs')
makedepends=('dbus' 'git' 'glib2-devel' 'gobject-introspection' 'gtk-doc' 'meson')
checkdepends=('python-dbusmock')
backup=('etc/pam.d/polkit-1')
provides=("polkit=${pkgver%%.r*}" 'libpolkit-agent-1.so' 'libpolkit-gobject-1.so')
conflicts=("polkit")
source=('git+https://github.com/polkit-org/polkit.git')
b2sums=('SKIP')

pkgver() {
  cd 'polkit'
  git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D examples=true
    -D gtk_doc=true
    -D man=true
    -D os_type=redhat
    -D polkitd_uid=102
    -D polkitd_user=polkitd
    -D session_tracking=logind
    -D tests=true
  )

  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -d -o root -g 102 -m 750 "${pkgdir}"/{etc,usr/share}/polkit-1/rules.d
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/polkit.conf" <<END
u polkitd 102 "polkit daemon"
m polkitd proc
END
}

# vim:set sw=2 sts=-1 et:
