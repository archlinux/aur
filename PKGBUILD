# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-display-manager-git
pkgver=1.3.2.gxde2.r124.g9e4078d
pkgrel=1
pkgdesc='GXDE Display Manager is a fork of SDDM maintained by GXDE OS contributors.'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(GPL-3.0-or-later MIT CC-BY-3.0 Apache-2.0 OFL-1.1)
_mods=(gxde-display-manager gxdm-emergency-mode)

depends=(gxde-dtk2-qt6-git gxde-dtk6-git
         qt6-base qt6-declarative qt6-svg layer-shell-qt gsettings-qt6
         pam systemd systemd-libs dbus kbd wayland xorg-xauth bash
         libx11 libxau libxcb libxcursor libxfixes libxi libxrandr libxtst
         libstdc++ libgcc glibc)
optdepends=('flakewm-git: Wayland compositor for the greeter (preferred)'
            'labwc: fallback Wayland compositor for the greeter'
            'sway: fallback Wayland compositor for the greeter'
            'weston: fallback Wayland compositor for the greeter'
            'xorg-server: X11 sessions'
            'accountsservice: user avatars and per-user settings in the greeter')
makedepends=(git cmake ninja python-docutils qt6-tools wayland-protocols cargo clang)
provides=(gxdm)
conflicts=(gxdm)
backup=(etc/pam.d/gxdm
        etc/pam.d/gxdm-autologin
        etc/pam.d/gxdm-greeter
        etc/pam.d/gxdm-rescue
        etc/gxdm/OMG.conf)
_mavenpro=1c21ee500b7b87a4871696519fc84107a1a001df
source=("gxde-display-manager::git+$url/gxde-display-manager.git"
        "gxdm-emergency-mode::git+$url/gxdm-emergency-mode.git"
        "MavenPro-OFL-$_mavenpro.txt::https://raw.githubusercontent.com/googlefonts/mavenproFont/$_mavenpro/OFL.txt"
        gxdm-rescue.pam)
sha256sums=('SKIP'
            'SKIP'
            'e0cde1a4993ed689d463d5e2401f4a60c54cc48a14253ab0f8012d722c417038'
            '713b61067ac2fd7a23b458c6a7395c8439b07d4adbb299eff05f5b42be23b383')

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(git -C gxde-display-manager describe --tags --abbrev=0 | tr - .)" "$_count" \
    "$(git -C gxde-display-manager rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_mods[@]}"; do
    _tag=$(git -C "$_m" describe --tags --abbrev=0)
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done

  sed -i 's|/usr/sbin/gxdm-emergency-mode|/usr/bin/gxdm-emergency-mode|' \
    gxdm-emergency-mode/data/gxdm-rescue.service
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path gxdm-emergency-mode/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cmake -S gxde-display-manager -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/gxdm \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_WITH_QT6=ON \
    -DBUILD_CLASSIC_GREETER=ON \
    -DBUILD_MAN_PAGES=ON \
    -DINSTALL_PAM_CONFIGURATION=ON \
    -DUID_MIN=1000 \
    -DUID_MAX=60513
  cmake --build build

  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$srcdir/build-gxdm-emergency-mode"
  cargo build --frozen --release --manifest-path gxdm-emergency-mode/Cargo.toml
}

check() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$srcdir/build-gxdm-emergency-mode"
  cargo test --frozen --release --manifest-path gxdm-emergency-mode/Cargo.toml
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "gxde-display-manager/data/configs/OMG.conf" -t "$pkgdir/etc/gxdm/"
  install -Dm644 "gxde-display-manager/debian/copyright" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "MavenPro-OFL-$_mavenpro.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL-MavenPro.txt"

  install -Dm755 build-gxdm-emergency-mode/release/gxdm-emergency-mode -t "$pkgdir/usr/bin/"
  install -Dm755 gxdm-emergency-mode/scripts/gxdmr -t "$pkgdir/usr/bin/"
  install -Dm644 gxdm-rescue.pam "$pkgdir/etc/pam.d/gxdm-rescue"
  install -Dm644 gxdm-emergency-mode/data/gxdm-rescue.service -t "$pkgdir/usr/lib/systemd/system/"
}
