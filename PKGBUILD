# Maintainer: hawkeye116477 <hawkeye11647 at gmail dot com>
pkgname=steamachievementnotifier
_pkgname="Steam Achievement Notifier"
_mainver=1.9
_subver=44
pkgver="${_mainver}.${_subver}"
_electron=electron42
pkgrel=3
pkgdesc="Shows fully customisable notifications when you unlock any achievement on Steam!(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/SteamAchievementNotifier/SteamAchievementNotifier"
license=('LicenseRef-unknown')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    "${_electron}"
)
makedepends=(
    'asar'
    'git'
    'nodejs-lts'
    'npm'
    'python'
)
source=("git+https://github.com/SteamAchievementNotifier/SteamAchievementNotifier.git#tag=${pkgver}")
sha256sums=('SKIP')


build() {
  cd SteamAchievementNotifier
  HOME="${srcdir}/.electron-gyp" npm install
  npx tsc --build --clean && npx tsc && ./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)
}

package() {
    cd "SteamAchievementNotifier"
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -rf _release/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/bash
exec $_electron /usr/lib/${pkgname}/app.asar --no-sandbox "\$@"
EOF

    for i in 32 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    done

    ln -Ts /usr/lib/${pkgname}/img/sanlogo.png \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    ln -Ts /usr/lib/${pkgname}/img/32x32.png \
      "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"

    install -Dm755 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Steam Achievement Notifier
Exec=steamachievementnotifier %U
Terminal=false
Type=Application
Icon=steamachievementnotifier
StartupWMClass=Steam Achievement Notifier
Comment=Steam Achievement Notifier
Categories=Utility;
EOF
}