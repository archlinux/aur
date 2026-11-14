# Maintainer: mensylisir <710080675@qq.com>
#
# Repack of the official Linux build from Baidu's release CDN. Upstream only
# publishes x86_64. The CDN serves a versioned object
# (Dumate-linux-amd64-v<ver>.deb) alongside the mutable "-latest.deb" alias;
# this package pins the versioned one so the checksum keeps matching after
# upstream ships a new build.

pkgname=dumate-app-bin
pkgver=1.0.92
pkgrel=1
pkgdesc='Baidu DuMate desktop AI client (official Linux build)'
arch=('x86_64')
url='https://www.dumate.cn/'
license=('custom:baidu-dumate')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=("dumate=${pkgver}" "qianfan-desktop-app=${pkgver}")
conflicts=('dumate' 'dumate-bin' 'qianfan-desktop-app')
install="${pkgname}.install"
options=('!strip' '!debug')
noextract=("Dumate-linux-amd64-v${pkgver}.deb")
source_x86_64=("Dumate-linux-amd64-v${pkgver}.deb::https://dumate-app-public.cdn.bcebos.com/release-info/linux-artifacts/Dumate-linux-amd64-v${pkgver}.deb")
sha256sums_x86_64=('72995d729193a83f5d227c9d812ebdeeb27adaec9f49f288b3342cc7269774de')

prepare() {
  rm -rf _deb _root
  mkdir -p _deb _root
  # .deb is an ar archive; the payload lives in data.tar.*.
  bsdtar -xf "${srcdir}/Dumate-linux-amd64-v${pkgver}.deb" -C _deb
  local _data=(_deb/data.tar.*)
  if (( ${#_data[@]} != 1 )); then
    echo "data.tar.* 数量异常: ${#_data[@]}" >&2
    return 1
  fi
  bsdtar -xf "${_data[0]}" -C _root
  if [[ ! -x _root/opt/DuMate/qianfan-desktop-app ]]; then
    echo "缺少主程序 opt/DuMate/qianfan-desktop-app" >&2
    return 1
  fi
}

package() {
  cp -a _root/. "${pkgdir}/"

  # 上游 deb 的 postinst 建立这两个命令名。
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/DuMate/qianfan-desktop-app "${pkgdir}/usr/bin/dumate"
  ln -s /opt/DuMate/qianfan-desktop-app "${pkgdir}/usr/bin/qianfan-desktop-app"

  # chrome-sandbox 在包里保持 0755；是否提权由 .install 按目标机
  # unprivileged userns 是否可用决定，与上游 postinst 的策略一致。
  # 上游只随包提供 Electron/Chromium 的许可证文本。
  install -Dm644 "${pkgdir}/opt/DuMate/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/DuMate/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
