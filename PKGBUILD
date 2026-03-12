#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
_tag=3.1.0
pkgname=watt-toolkit-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=${_tag//-/.}
pkgrel=2
arch=('x86_64')
url=https://steampp.net/
license=('GPL-3.0-only')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('staticlibs' '!strip')
source=(
    'watt-toolkit.desktop'
    'set-cap.hook'
    'watt-toolkit'
    'environment_check.sh')
source_x86_64=("Steam++_${pkgver}_x86_64.tar.gz::https://github.com/BeyondDimension/SteamTools/releases/download/${_tag}/Steam++_v${_tag}_linux_x64.tgz")
sha256sums=('50cfc2d50271e97d818004f1777826cedd666a16014bd08b288cdd35e3d47fb1'
            '2dbf57bb3cfbc45f3307f2db63ae86907364044b81137f2592363cd120da4f3e'
            '822897eafe72886f06e2d6b0911d323a5716da8f2acbeca630f36382f38b64ec'
            'da96b337ef8f79f170fb5976dffee4c52ecf5bc842e3dac9d8479a198887b8b1')
sha256sums_x86_64=('fb99bcd4fa6ac649228700f908819fe19a16cc29a866ad43d2873e504a41783f')

case "${CARCH}" in
    x86_64)
        _arch=linux-x64
        ;;
    *)
        echo "Unsupported \$CARCH ${CARCH}"
        exit 1
        ;;
esac

package(){
    depends=(
        # runtime
        'libcap' 'aspnet-runtime-10.0' 'nss' 'dotnet-runtime-10.0' 'bash' 'hicolor-icon-theme'
        # e_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so
        'glibc'
        # Steam++.Accelerator
        'gcc-libs'
        # libSkiaSharp.so
        'fontconfig' 'freetype2' 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli' 'glib2' 'graphite' 'pcre2')
    optdepends=('steam: need official or flatpak version of steam')

    # See ./src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj#L8
    local -r _appid=net.steampp.app

    mkdir -p "${pkgdir}/usr/lib/watt-toolkit" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership -t "${pkgdir}/usr/lib/watt-toolkit" \
        "${srcdir}/assemblies/." "${srcdir}/native/$_arch/." \
        "${srcdir}/modules"
    # Fix permission
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -exec chmod 644 {} +
    find "${pkgdir}/usr/lib/watt-toolkit/modules" -type f -name 'Steam++.*' -exec chmod 755 {} +
    # Strip binary
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -name '*.so' -exec strip $STRIP_SHARED {} +
    install -Dm644 "${srcdir}/Icons/Watt-Toolkit.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appid}.png"
    install -Dm755 "${srcdir}/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
    # Steam++.sh is required by https://github.com/BeyondDimension/SteamTools/issues/3403
    install -Dm755 "${srcdir}/watt-toolkit" "${pkgdir}/usr/lib/watt-toolkit/Steam++.sh"
    ln -srfv "$pkgdir/usr/lib/watt-toolkit/Steam++.sh" "$pkgdir/usr/bin/watt-toolkit"
}
