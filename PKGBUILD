# Maintainer: shbernal <shbernal.01@gmail.com>
# Contributor: Rishon Jonathan R (RishonDev on GitHub)
# Issues and fixes: https://github.com/shbernal/aur-packages

# Kenning and its patched Plasma Login Manager are built together because the
# login manager needs a small patch to support Kenning's face sign-in option.
pkgbase=kenning
pkgname=(kenning plasma-login-manager-kenning)
pkgver=0.8.1
_plmver=6.8.2
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/RishonDev/kenning'
license=(GPL-2.0-or-later MIT Apache-2.0)
makedepends=(cmake extra-cmake-modules ninja qt6-tools
             # plasma-login-manager
             kauth kcmutils kconfig kcoreaddons kdbusaddons ki18n kio kirigami kpackage kservice
             layer-shell-qt libkscreen libplasma libxau pam plasma-workspace qt6-5compat qt6-base qt6-declarative systemd-libs
             # engine
             opencv libarchive
             # kenning runtime, required in makedepends for a split package
             libnotify plasma-desktop python)
source=("kenning-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        https://download.kde.org/stable/plasma/$_plmver/plasma-login-manager-$_plmver.tar.xz{,.sig}
        https://github.com/opencv/opencv_zoo/raw/f12e12798e8314f7c074a6656816c048dcc95b7a/models/face_detection_yunet/face_detection_yunet_2023mar.onnx
        https://github.com/opencv/opencv_zoo/raw/ba91a3b91d00d76e86540d4013f944bd6b514e39/models/face_recognition_sface/face_recognition_sface_2021dec.onnx)
sha256sums=('ed424ec2da6fbec41a3f9e2fe7c1da52255110739ad3fa7f06bf5e04e37dae19'
            '4a6e2b65b5d462fcf43b2a5be3c3e6244f479451b6dcfa00dcbf33fbc5cd093a'
            'SKIP'
            '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4'
            '0ba9fbfa01b5270c96627c4ef784da859931e02f04419c829e83484087c34e79')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  "$srcdir/kenning-$pkgver/login-manager/apply.sh" plasma-login-manager-$_plmver
}

build() {
  cmake -B kenning-build -G Ninja -S "$srcdir/kenning-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib -DKENNING_NETWORKS_DIR="$srcdir" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build kenning-build

  cmake -B plm-build -G Ninja -S plasma-login-manager-$_plmver -DKDE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build plm-build
}

package_kenning() {
  pkgdesc='Kenning: face unlock for KDE Plasma'
  license=(GPL-2.0-or-later MIT Apache-2.0)  # MIT: YuNet model, Apache-2.0: SFace model
  depends=(kauth kcmutils kconfig kcoreaddons ki18n kirigami libplasma plasma-desktop qt6-base qt6-declarative
           libarchive libnotify opencv pam python systemd-libs)
  optdepends=('plasma-login-manager-kenning: start face unlock as soon as the login screen appears'
              'qt6-speech: read the setup steps aloud'
              'speech-dispatcher: read the setup steps aloud (with a voice such as espeak-ng)')
  backup=(etc/kenning/config.ini)
  conflicts=(plasma-faceunlock)
  replaces=(plasma-faceunlock)
  install=kenning.install

  DESTDIR="$pkgdir" cmake --install kenning-build
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" "$srcdir/kenning-$pkgver"/packaging/arch/*.hook
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/kenning-$pkgver"/engine/native/models/LICENSE.{yunet,sface}
}

package_plasma-login-manager-kenning() {
  pkgdesc='Plasma Login Manager that starts face unlock as soon as it appears'
  license=(GPL-2.0-or-later)
  depends=(glibc kauth kcmutils kconfig kcoreaddons kdbusaddons ki18n kio kirigami kpackage kservice layer-shell-qt
           libkscreen libplasma libstdc++ libxau pam plasma-workspace qt6-5compat qt6-base qt6-declarative sh systemd-libs)
  optdepends=('kenning: face unlock settings and themes')
  provides=("plasma-login-manager=$_plmver")
  conflicts=(plasma-login-manager plasma-login-manager-faceunlock)
  replaces=(plasma-login-manager-faceunlock)

  DESTDIR="$pkgdir" cmake --install plm-build
  install -Dm644 /dev/stdin "$pkgdir/usr/share/kenning/login-manager" <<< "plasma-login-manager-kenning $_plmver"
}
