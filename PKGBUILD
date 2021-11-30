# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Ramon Buldo <ramon@garuda.org>

pkgbase=garuda-settings-manager-git
_pkgbase=garuda-settings-manager
pkgname=('garuda-settings-manager-git' 'garuda-settings-manager-kcm-git' 
         'garuda-settings-manager-notifier-git' 'garuda-settings-manager-knotifier-git')
pkgver=1.0.0.r1.g15c4106
pkgrel=1
pkgdesc="Garuda Linux system settings (Manjaro settings manager ported to work with Arch standards and limited to only DKMS drivers)"
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
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$_pkgbase"
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

  cd "$srcdir/$_pkgbase/build"
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
  pkgdesc="Garuda Linux system settings - Plasma 5 KCM"
  depends=('garuda-settings-manager' 'kcmutils' 'kconfigwidgets')
  provides=('garuda-settings-manager-kcm')
  conflicts=('garuda-settings-manager-kcm')

  cd "$srcdir/$_pkgbase/build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc  
  rm -rf $pkgdir/usr/bin
  rm -rf $pkgdir/usr/lib/kauth
  rm -rf $pkgdir/usr/share/{applications,dbus-1,icons,polkit-1}
}

package_garuda-settings-manager-notifier-git() {
  pkgdesc="Garuda Linux system settings - notifier"
  depends=('garuda-settings-manager')
  provides=('garuda-settings-manager-notifier')
  conflicts=('garuda-settings-manager-notifier')

  cd "$srcdir/$_pkgbase/build"
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
  pkgdesc="Garuda Linux system settings - knotifier"
  depends=('garuda-settings-manager' 'knotifications')
  provides=('garuda-settings-manager-knotifier')
  conflicts=('garuda-settings-manager-knotifier')

  cd "$srcdir/$_pkgbase/build"
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
