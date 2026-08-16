# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>
#
# Patches applied:
#   1. Sasasu/PR#1220 - Fingerprint background polling (https://github.com/sddm/sddm/pull/1220)
#   2. xCaptaiN09 - Parallel auth fix: stop fingerprint on password submit, 300ms termination timeout

pkgname=sddm-fingerprint
pkgver=0.21.0
pkgrel=6
pkgdesc='SDDM with fingerprint + password parallel authentication (PR#1220 + parallel auth fix)'
arch=(x86_64)
url='https://github.com/sddm/sddm'
license=(GPL-2.0-or-later)
depends=(bash glibc libgcc libstdc++ libxau libxcb pam qt6-base qt6-declarative systemd-libs ttf-font xorg-server xorg-xauth)
makedepends=(extra-cmake-modules git python-docutils qt5-base qt5-declarative qt5-tools qt6-tools)
optdepends=('qt5-declarative: for using Qt5 themes')
provides=(sddm display-manager)
conflicts=(sddm)
backup=('usr/share/sddm/scripts/Xsetup' 'usr/share/sddm/scripts/Xstop' 'etc/pam.d/sddm' 'etc/pam.d/sddm-autologin' 'etc/pam.d/sddm-greeter' 'etc/pam.d/sddm-fingerprint')
source=(
    "git+https://github.com/sddm/sddm#tag=v$pkgver"
    "pr1220-fingerprint.patch::https://patch-diff.githubusercontent.com/raw/sddm/sddm/pull/1220.patch"
    "parallel-auth-fix.py"
)
sha256sums=('67394c93f331fc02f89559f68e149a992efaed07690f548e6a83ec384ebb8000' 'SKIP' 'SKIP')

prepare() {
    cd sddm
    git cherry-pick -n 228778c2b4b7e26db1e1d69fe484ed75c5791c3a
    patch -Np1 -i "$srcdir/pr1220-fingerprint.patch" --fuzz=3 || true
    python3 "$srcdir/parallel-auth-fix.py"
}

build() {
    cmake -B build -S sddm \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DBUILD_WITH_QT6=ON \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=OFF \
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
