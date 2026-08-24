# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>
#
# Builds SDDM directly from xCaptaiN09/sddm, branch fingerprint-parallel-auth:
# https://github.com/xCaptaiN09/sddm/tree/fingerprint-parallel-auth
# That branch is 2 commits on top of upstream sddm/sddm develop:
#   1. feat: add fingerprint authentication support
#      (based on Sasasu's PR#1220: https://github.com/sddm/sddm/pull/1220)
#   2. fix: allow password auth when fingerprint auth is active
#      (xCaptaiN09 - parallel auth: stop fingerprint on password submit,
#       suppress false "crashed" error, auto-restart fingerprint on failure)
# Also submitted upstream as https://github.com/sddm/sddm/pull/2176

pkgname=sddm-fingerprint
pkgver=0.21.0.r1640
pkgrel=1
pkgdesc='SDDM with fingerprint + password parallel authentication (built from xCaptaiN09/sddm fingerprint-parallel-auth branch)'
arch=(x86_64)
url='https://github.com/xCaptaiN09/sddm/tree/fingerprint-parallel-auth'
license=(GPL-2.0-or-later)
depends=(bash glibc libgcc libstdc++ libxau libxcb pam qt6-base qt6-declarative systemd-libs ttf-font xorg-server xorg-xauth)
makedepends=(extra-cmake-modules git python-docutils qt5-base qt5-declarative qt5-tools qt6-tools)
optdepends=('qt5-declarative: for using Qt5 themes')
provides=(sddm display-manager)
conflicts=(sddm)
backup=('usr/share/sddm/scripts/Xsetup' 'usr/share/sddm/scripts/Xstop' 'etc/pam.d/sddm' 'etc/pam.d/sddm-autologin' 'etc/pam.d/sddm-greeter' 'etc/pam.d/sddm-fingerprint')
source=(
    "sddm::git+https://github.com/xCaptaiN09/sddm.git#branch=fingerprint-parallel-auth"
)
sha256sums=('SKIP')

pkgver() {
    cd sddm
    printf "0.21.0.r%s" "$(git rev-list --count upstream/develop..HEAD 2>/dev/null || git rev-list --count HEAD)"
}

build() {
    cmake -B build -S sddm \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DBUILD_WITH_QT6=ON \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=OFF \
        -DINSTALL_PAM_CONFIGURATION=ON \
        -DUID_MAX=60513
    cmake --build build
    cmake -B build5 -S sddm -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build5/src/greeter
    cmake --build build5/components
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build5/src/greeter
    DESTDIR="$pkgdir" cmake --install build5/components
    install -d "$pkgdir"/usr/lib/sddm/sddm.conf.d
    "$pkgdir"/usr/bin/sddm --example-config > "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
    sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
    sed -e "/^InputMethod/s/qtvirtualkeyboard//" -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
}
