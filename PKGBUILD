# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Ramon Buldo <ramon@garuda.org>

pkgbase=garuda-settings-manager-git
pkgname=('garuda-settings-manager-git' 'garuda-settings-manager-kcm-git' 
         'garuda-settings-manager-notifier-git' 'garuda-settings-manager-knotifier-git')
pkgver=r16.011593f
#_commit=e085b661c3c97e8aa39a5b49896a88a95d84caf9
pkgrel=1
pkgdesc="Garuda Linux System Settings Tool (manjaro settings manager ported to work with arch standards and limited to only dkms drivers)"
arch=('i686' 'x86_64')
url="https://gitlab.com/garuda-linux/applications/garuda-settings-manager"
license=("GPL")
depends=('icu' 'qt5-base>=5.12.3' 'hwinfo' 'kitemmodels' 'kauth' 
         'kcoreaddons' 'ckbcomp' 'xdg-utils' 'mhwd-garuda-git')
optdepends=('garuda-settings-manager-notifier-git: qt-based'
            'garuda-settings-manager-knotifier-git: knotifications-based')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'qt5-tools' 'knotifications' 
             'kconfigwidgets' 'kcmutils')
conflicts=('kcm-msm')
# source=("msm-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
source=("git+https://gitlab.com/garuda-linux/applications/garuda-settings-manager.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/garuda-settings-manager"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
prepare() {
#  mv ${pkgbase}-${_commit} ${pkgbase}-${pkgver}
  cd "$srcdir/garuda-settings-manager/"
  # patches here
}

build() {
  cd "$srcdir/garuda-settings-manager/"
  mkdir -p build
  cd build
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  CXXFLAGS+="-std=gnu++98" make
}

package_garuda-settings-manager-git() {
provides=('garuda-settings-manager')
  conflicts=('garuda-settings-manager')
  replaces=('garuda-settings-manager')
  cd "$srcdir/garuda-settings-manager//build"
  make DESTDIR=${pkgdir} install 
  rm -rf $pkgdir/usr/bin/msm_notifier
  rm -rf $pkgdir/usr/bin/msm_kde_notifier
  rm -rf $pkgdir/usr/lib/qt
  rm -rf $pkgdir/usr/share/kservices5
  rm -rf $pkgdir/usr/share/applications/msm_notifier_settings.desktop
  rm -rf $pkgdir/usr/share/applications/msm_kde_notifier_settings.desktop
  rm -rf $pkgdir/etc/xdg
}

package_garuda-settings-manager-kcm-git() {
  pkgdesc="Garuda Linux System Settings Tool (KCM for Plasma 5) (manjaro settings manager ported to work with arch standards and limited to only dkms drivers)"
  depends=('garuda-settings-manager' 'kcmutils' 'kconfigwidgets')
  provides=('garuda-settings-manager-kcm')
  conflicts=('garuda-settings-manager-kcm')
  replaces=('garuda-settings-manager-kcm')
  cd "$srcdir/garuda-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc  
  rm -rf $pkgdir/usr/bin
  rm -rf $pkgdir/usr/lib/kauth
  rm -rf $pkgdir/usr/share/{applications,dbus-1,icons,polkit-1}
}

package_garuda-settings-manager-notifier-git() {
  pkgdesc="Garuda Linux System Settings Tool (Notifier) (manjaro settings manager ported to work with arch standards and limited to only dkms drivers)"
  depends=('garuda-settings-manager')
  provides=('garuda-settings-manager-notifier')
  conflicts=('garuda-settings-manager-notifier')
  replaces=('garuda-settings-manager-notifier')
  cd "$srcdir/garuda-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc/dbus-1
  rm -rf $pkgdir/etc/xdg/autostart/msm_kde_notifier.desktop
  rm -rf $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/share/{kservices5,dbus-1,icons,polkit-1}
  rm -rf $pkgdir/usr/share/applications/garuda*
  rm -rf $pkgdir/usr/share/applications/msm_kde_notifier_settings.desktop
  rm -rf $pkgdir/usr/bin/garuda*
  rm -rf $pkgdir/usr/bin/msm_kde_notifier
}

package_garuda-settings-manager-knotifier-git() {
  pkgdesc="Garuda Linux System Settings Tool (Notifier for Plasma 5) (manjaro settings manager ported to work with arch standards and limited to only dkms drivers)"
  depends=('garuda-settings-manager' 'knotifications')
  provides=('garuda-settings-manager-knotifier')
  conflicts=('garuda-settings-manager-knotifier')
  replaces=('garuda-settings-manager-knotifier')
  cd "$srcdir/garuda-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc/dbus-1
  rm -rf $pkgdir/etc/xdg/autostart/msm_notifier.desktop
  rm -rf $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/share/{kservices5,dbus-1,icons,polkit-1}
  rm -rf $pkgdir/usr/share/applications/garuda*
  rm -rf $pkgdir/usr/share/applications/msm_notifier_settings.desktop
  rm -rf $pkgdir/usr/bin/garuda*
  rm -rf $pkgdir/usr/bin/msm_notifier
} 
