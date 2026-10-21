# SPDX-License-Identifier: AGPL-3.0-only
# Maintainer: OctoberPrayRain
pkgname=netease-songrec-linux-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial NetEase Music song recognition client for Linux'
arch=('x86_64')
url='https://github.com/OctoberPrayRain/NeteaseSongRec_Linux'
license=('AGPL-3.0-only' 'GPL-3.0-or-later' 'LicenseRef-NetEase-Extension')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd'
         'libpulse' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'libxrandr' 'nodejs' 'pipewire' 'python' 'wayland')
optdepends=('pipewire-pulse: PulseAudio-compatible system playback monitor'
            'noto-fonts-cjk: Chinese interface fonts')
provides=('netease-songrec-linux')
conflicts=('netease-songrec-linux')
options=('!strip' '!debug')
_archive="netease-songrec-linux-${pkgver}-linux-${CARCH}"
_extension='NetEase-1.0.4.crx'
source=("${_archive}.tar.gz::${url}/releases/download/v${pkgver}/${_archive}.tar.gz"
        "${_extension}::https://clients2.google.com/service/update2/crx?response=redirect&prodversion=130.0.0.0&acceptformat=crx3&x=id%3Dkemcalcncfhmdkgglekijclbomdoohkp%26installsource%3Dondemand%26uc")
noextract=("${_extension}")
sha256sums=('28ba839e85c6645938f4bd0bc55130128d455b521c0eed0f2d43a58801d2e506'
            'ef746443a0f240c525b6cdf8ff6cf27ab22f4ac0399cd3b2564452e753ce3b75')

prepare() {
    local data_dir="${srcdir}/${_archive}/share/netease-songrec-linux"
    python "${data_dir}/scripts/sync-netease-resources.py" \
        --archive "${srcdir}/${_extension}" \
        --cache-dir "${srcdir}/netease-extension" \
        --destination "${data_dir}"
}

package() {
    cd "${srcdir}/${_archive}"
    install -Dm755 bin/netease-songrec-linux "${pkgdir}/usr/bin/netease-songrec-linux"
    install -d "${pkgdir}/usr/share"
    cp -r share/. "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/share/licenses/netease-songrec-linux" "${pkgdir}/usr/share/licenses/${pkgname}"
}
