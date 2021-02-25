# Maintainer : Ramon Buldo <ramon@manjaro.org>

pkgbase=croco-settings-manager-git
pkgname=('croco-settings-manager' 'croco-settings-manager-kcm' 
         'croco-settings-manager-notifier' 'croco-settings-manager-knotifier')
pkgver=0.5.6
#_commit=e085b661c3c97e8aa39a5b49896a88a95d84caf9
pkgrel=1
pkgdesc="Croco OS System Settings Tool"
arch=('i686' 'x86_64')
url="https://gitlab.com/croco-os/applications/croco-settings-manager"
license=("GPL")
depends=('icu' 'qt5-base>=5.12.3' 'hwinfo' 'kitemmodels' 'kauth' 
         'kcoreaddons' 'ckbcomp' 'xdg-utils')
optdepends=('croco-settings-manager-notifier: qt-based'
            'croco-settings-manager-knotifier: knotifications-based')
makedepends=('extra-cmake-modules' 'kdoctools' 'qt5-tools' 'knotifications' 
             'kconfigwidgets' 'kcmutils')
conflicts=('kcm-msm')
# source=("msm-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
source=("git+https://gitlab.com/croco-os/applications/croco-settings-manager.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/croco-settings-manager"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
prepare() {
#  mv ${pkgbase}-${_commit} ${pkgbase}-${pkgver}
  cd "$srcdir/croco-settings-manager/"
  # patches here
}

build() {
  cd "$srcdir/croco-settings-manager/"
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

package_croco-settings-manager() {
provides=('croco-settings-manager')
  conflicts=('croco-settings-manager')
  cd "$srcdir/croco-settings-manager//build"
  make DESTDIR=${pkgdir} install 
  rm -rf $pkgdir/usr/bin/msm_notifier
  rm -rf $pkgdir/usr/bin/msm_kde_notifier
  rm -rf $pkgdir/usr/lib/qt
  rm -rf $pkgdir/usr/share/kservices5
  rm -rf $pkgdir/usr/share/applications/msm_notifier_settings.desktop
  rm -rf $pkgdir/usr/share/applications/msm_kde_notifier_settings.desktop
  rm -rf $pkgdir/etc/xdg
}

package_croco-settings-manager-kcm() {
  pkgdesc="Croco OS System Settings Tool (KCM for Plasma 5)"
  depends=('croco-settings-manager' 'kcmutils' 'kconfigwidgets')
  replaces=('kcm-msm')
  cd "$srcdir/croco-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc  
  rm -rf $pkgdir/usr/bin
  rm -rf $pkgdir/usr/lib/kauth
  rm -rf $pkgdir/usr/share/{applications,dbus-1,icons,polkit-1}
}

package_croco-settings-manager-notifier() {
  pkgdesc="Croco OS System Settings Tool (Notifier)"
  depends=('croco-settings-manager')
  provides=('croco-settings-manager-kde-notifier')
  conflicts=('croco-settings-manager-kde-notifier')
  cd "$srcdir/croco-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc/dbus-1
  rm -rf $pkgdir/etc/xdg/autostart/msm_kde_notifier.desktop
  rm -rf $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/share/{kservices5,dbus-1,icons,polkit-1}
  rm -rf $pkgdir/usr/share/applications/croco*
  rm -rf $pkgdir/usr/share/applications/msm_kde_notifier_settings.desktop
  rm -rf $pkgdir/usr/bin/croco*
  rm -rf $pkgdir/usr/bin/msm_kde_notifier
}

package_croco-settings-manager-knotifier() {
  pkgdesc="Croco OS System Settings Tool (Notifier for Plasma 5)"
  depends=('croco-settings-manager' 'knotifications')
  conflicts=('croco-settings-manager-notifier')
  replaces=('croco-settings-manager-kde-notifier')
  cd "$srcdir/croco-settings-manager//build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/etc/dbus-1
  rm -rf $pkgdir/etc/xdg/autostart/msm_notifier.desktop
  rm -rf $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/share/{kservices5,dbus-1,icons,polkit-1}
  rm -rf $pkgdir/usr/share/applications/croco*
  rm -rf $pkgdir/usr/share/applications/msm_notifier_settings.desktop
  rm -rf $pkgdir/usr/bin/croco*
  rm -rf $pkgdir/usr/bin/msm_notifier
} 
