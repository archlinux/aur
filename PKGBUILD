#Maintainer: hidiyou<hidiyou@gmx.com>
#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
_tag=3.0.0-rc.5
pkgname=watt-toolkit-bin-gitee
pkgdesc=一个开源跨平台的多功能Steam工具箱,本包完全等同于watt-toolkit-bin,只是将下载源替换为了gitee
pkgver=${_tag//-/.}
pkgrel=1
arch=('x86_64')
url=https://steampp.net/
license=('GPL-3.0-only')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('!strip')
source=(
    'watt-toolkit.desktop'
    'set-cap.hook'
    'watt-toolkit')
source_x86_64=("Steam++_${pkgver}_x86_64.tar.gz::https://gitee.com/rmbgame/SteamTools/releases/download/${_tag}/Steam%20%20_v${_tag}_linux_x64.tgz")
sha256sums=('251dceba9814b53e56e175d60965ffab8160b5cc58640c3069f927dae5b7a46f'
            '2dbf57bb3cfbc45f3307f2db63ae86907364044b81137f2592363cd120da4f3e'
            '9b5bb8387964688168e8d928fe6ecca31d9d545681f3a4b7cece444ae0f609a2')
sha256sums_x86_64=('869ed9e1fc20ee54d4b667b4b990ff001c2abd66ef0c2340caea3c32d701a34b')

package(){
    depends=(
        # runtime
        'libcap' 'aspnet-runtime-8.0' 'nss' 'dotnet-runtime-8.0' 'sh' 'hicolor-icon-theme'
        # e_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so
        'glibc'
        # Steam++.Accelerator
        'gcc-libs'
        # libSkiaSharp.so
        'fontconfig' 'freetype2' 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli' 'glib2' 'graphite' 'pcre2')
    optdepends=('steam: need official or flatpak version of steam')
    case ${CARCH} in
        x86_64)
            _arch=x64
            ;;
        aarch64)
            _arch=arm64
            ;;
        armv7l)
            _arch=arm
            ;;
        *)
            _arch=${CARCH}
            ;;
    esac
    mkdir -p "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/assemblies" "${pkgdir}/usr/lib/watt-toolkit"
    cp -r "${srcdir}/native" "${pkgdir}/usr/lib/watt-toolkit"
    cp -r "${srcdir}/modules" "${pkgdir}/usr/lib/watt-toolkit/modules"
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/watt-toolkit/modules" -type f -name 'Steam++.*' -exec chmod 755 {} \;
    install -Dm644 "${srcdir}/Icons/Watt-Toolkit.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/watt-toolkit.png"
    install -Dm755 "${srcdir}/script/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    install -Dm755 "${srcdir}/watt-toolkit" "${pkgdir}/usr/bin/watt-toolkit"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
}
