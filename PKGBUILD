# Maintainer: lzsnyy <710080675@qq.com>

pkgname=workbuddy-agent
_pkgver=5.6.2.40046327
_build=c7b525f3
pkgver=${_pkgver}_${_build}
pkgrel=2
pkgdesc="腾讯云代码助手推出的 AI Agent 办公工具"
arch=('x86_64' 'aarch64')
url="https://www.workbuddy.cn/app"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
         'libxkbcommon' 'libxrandr' 'mesa' 'libsecret' 'libappindicator'
         'libpulse' 'libnotify' 'json-glib' 'wayland' 'systemd-libs' 'dbus')
optdepends=(
	'python-pip'
	'nodejs-lts: frontend skills'
	'imagemagick'
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=('workbuddy')
_registry="https://registry.npmjs.org"
source=(
  WorkBuddy.desktop
  "${_registry}/better-sqlite3/-/better-sqlite3-13.0.3.tgz"
  workbuddy-cn-16.png
  workbuddy-cn-24.png
  workbuddy-cn-32.png
  workbuddy-cn-48.png
  workbuddy-cn-64.png
  workbuddy-cn-96.png
  workbuddy-cn-128.png
  workbuddy-cn-256.png
  workbuddy-cn-512.png
)
sha256sums=('c093969b3d9b3a1828af23728144185ada452baaf706020aa179d5f4d5dd6b8c'
            '77e0513dc1a469fb3bceec4c7fb5ad3f403109787eda05be047ec17fd56868cb'
            '7bb2f875b641770db3918eca62831398ef5328ce516f3dce37b899cfcf8e2054'
            'f4ff4531dc86f25f7e0d0f0fe5580ec6ef5c1dd709cbc929884403de1ab55d77'
            '0a37763b8d0ec1f139e3207bf06f1a88a0beaa741c04485e78eedba3b80498e5'
            '48e7003ba8e53d007a1a47fe0a1f71b0f0c6036d5521c590fe95ff599ababeec'
            '6fa72887edc2c50c1ecf5c346a32758325fae340917a3c77d2c70bbd404db666'
            '353d4444155e399fb264610e1bcc188116ca380d17ad94f749211f0b97cbda8c'
            'cc68649f15ad7285ca926e83ed04f35d0f21e16c498e8483b9a80e47f4710aef'
            '58d58c5c5f07e51d9a2fe6bbc0eb0fcb1594c26fcd5a091200cc79c44bf4d348'
            'a9d8aaac19eb71eca4b3ab051733b74540c74ca9bed99230d77f486b95376af1')
source_x86_64=("WorkBuddy-linux-x64-deb-${_pkgver}-${_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${_pkgver}-${_build}.deb")
source_aarch64=("WorkBuddy-linux-arm64-deb-${_pkgver}-${_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${_pkgver}-${_build}.deb")
sha256sums_x86_64=('12149ad8c0cd748fd5062d8f62c7827d688d8095427ada99b1ae9e7019897523')
sha256sums_aarch64=('561822578435d382a06d0a0b079a4b157f68b588c9fe72d589e2a88b2fd155fa')

options=(!strip !debug)

prepare() {
    tar xf data.tar.xz
}

package() {
    install -d ${pkgdir}/opt/WorkBuddy
    cp -a usr ${pkgdir}/
    # 覆盖 deb 自带图标：国内版加 CN 角标，与国际版区分。
    local _size
    for _size in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${srcdir}/workbuddy-cn-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/workbuddy.png"
    done
    install -m644 WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd opt/WorkBuddy
    cp -a * ${pkgdir}/opt/WorkBuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec /opt/WorkBuddy/workbuddy "\$@"
EOF
}
