# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-next
pkgver=0.42.0_next.20240930.1208.92e8d55d2
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phosh'
_giturl="https://gitlab.gnome.org/guidog/phosh.git"
license=(GPL3)
depends=(gtk3 libhandy gnome-desktop gnome-session upower libpulse gcr
	libnm phoc gnome-shell callaudiod evince fribidi wayland evolution-data-server
	libsecret polkit libadwaita libical libedataserverui4
	squeekboard libgmobile gnome-bluetooth-3.0)
makedepends=(meson git wayland-protocols python-docutils python-packaging feedbackd libgmobile glib2-devel)
checkdepends=(xorg-server-xvfb xorg-xauth)
optdepends=('iio-sensor-proxy: accelerometer and other sensors'
            'feedbackd: haptic/visual/audio feedback'
            'xdg-desktop-portal-gtk: for screenshot support'
            'xdg-desktop-portal-wlr: for screencasts support')
source=("git+${_giturl}#branch=next" "pam_phosh")
validpgpkeys=("0DB3932762F78E592F6522AFBB5A2C77584122D3")
sha256sums=('SKIP'
            '43b94d0d9f4d083f028c77d18cb0d0f8037d160c41f333878c7cae3df0163c3d')
conflicts=(phosh)
provides=(phosh)

pkgver() {
  cd phosh
  printf "%s" $(grep -m 1 ' version:' meson.build | cut -d\' -f2; printf '_'; git describe 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
  cd phosh
  # Run meson once to setup the git submodule for libcall-ui as it should not be packaged
  meson setup -D gtk_doc=false prep
}

build() {
  arch-meson --libexecdir=/usr/lib/phosh  \
    -D tests=true -D phoc_tests=disabled \
    -D man=true -D gtk_doc=false -D callui-i18n=true \
    -D lockscreen-plugins=true phosh build
  meson compile -C build
}

#check() {
#	xvfb-run meson test --no-suite screenshots -C build
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  # make squeekboard the default keyboard
  mkdir -p "$pkgdir"/usr/share/applications
  ln -s sm.puri.Squeekboard.desktop "$pkgdir"/usr/share/applications/sm.puri.OSK0.desktop

  install -Dm644 "$srcdir"/pam_phosh "$pkgdir"/etc/pam.d/phosh
}
