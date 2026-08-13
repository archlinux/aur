# Maintainer: Maxime Lewandowski <lywel@lywel.link>

pkgname=nsight-systems-bin
pkgver=2026.4.1.191
pkgrel=1
pkgdesc='System-wide statistical sampling profiler with tracing features (upstream .deb)'
arch=(x86_64)
url='https://developer.nvidia.com/nsight-systems'
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus fontconfig glib2 glibc libdrm libglvnd libx11 libxcb libxext libxi
  libxkbcommon libxkbcommon-x11 libxkbfile libxshmfence nspr nss wayland
  xcb-util-cursor xcb-util-image xcb-util-keysyms xcb-util-renderutil
)
optdepends=('cuda: for GPU profiling on the local system')
provides=("nsight-systems=$pkgver")
conflicts=(nsight-systems)
options=(!strip)

_short=${pkgver%.*}                       # 2026.3.1
_year=${pkgver%%.*}                       # 2026
_rest=${pkgver#*.}; _month=${_rest%%.*}   # 3
_deb=nsight-systems-${_short}_${pkgver}-1_amd64.deb

source=(
  "https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/${_year}_${_month}/$_deb"
  nsight-systems.desktop
)
sha256sums=('8aeaf8c73401ccafb0b9bbe59981a6fcc97a038388462b15ef48ff75458aba19'
            '31fb773b641c477b0ccd4b6d081ddbb7acf390c1db6233439ad70deb321f7cc5')

package() {
  bsdtar -xf "$_deb"
  bsdtar -xf data.tar.*

  install -d "$pkgdir/opt/nvidia/nsight-systems"
  cp -a "opt/nvidia/nsight-systems/$_short" "$pkgdir/opt/nvidia/nsight-systems/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/nvidia/nsight-systems/$_short/bin/nsys" "$pkgdir/usr/bin/nsys"
  ln -s "/opt/nvidia/nsight-systems/$_short/bin/nsys-ui" "$pkgdir/usr/bin/nsys-ui"

  install -Dm644 nsight-systems.desktop \
    "$pkgdir/usr/share/applications/nsight-systems-$_short.desktop"
  sed -i "s|^Exec=.*|Exec=/opt/nvidia/nsight-systems/$_short/bin/nsys-ui|" \
    "$pkgdir/usr/share/applications/nsight-systems-$_short.desktop"
}
