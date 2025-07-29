#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
_tag=3.0.0-rc.16
pkgname=watt-toolkit-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=${_tag//-/.}
pkgrel=2
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL-3.0-only')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('staticlibs' '!strip')
source=(
    'watt-toolkit.desktop'
    'set-cap.hook'
    'watt-toolkit')
source_x86_64=("Steam++_${pkgver}_x86_64.tar.gz::https://github.com/BeyondDimension/SteamTools/releases/download/${_tag}/Steam++_v${_tag}_linux_x64.tgz")
source_aarch64=("Steam++_${pkgver}_aarch64.tar.gz::https://github.com/BeyondDimension/SteamTools/releases/download/${_tag}/Steam++_v${_tag}_linux_arm64.tgz")
sha256sums=('7fc1323d4a8f6512494624ad84fdb8433ddc56da39a91add825d1adcabaebf89'
            '2dbf57bb3cfbc45f3307f2db63ae86907364044b81137f2592363cd120da4f3e'
            '9b5bb8387964688168e8d928fe6ecca31d9d545681f3a4b7cece444ae0f609a2')
sha256sums_x86_64=('99493f821f063d8c21b39399ccaa2b90d20c30a97e6a616bc1b4ed1f40271d32')
sha256sums_aarch64=('c5fcf1c7130ab28330c3d3f307f9ef45cc6a3aaca7eb97ac72fc64ccaf5cb02a')

package(){
    depends=(
        # runtime
        'libcap' 'aspnet-runtime-9.0' 'nss' 'dotnet-runtime-9.0' 'sh' 'hicolor-icon-theme'
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
    # Fix permission
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/watt-toolkit/modules" -type f -name 'Steam++.*' -exec chmod 755 {} \;
    # Strip binary
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -name '*.dll' -exec strip $STRIP_STATIC {} \;
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -name '*.so' -exec strip $STRIP_SHARED {} \;
    install -Dm644 "${srcdir}/Icons/Watt-Toolkit.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/watt-toolkit.png"
    install -Dm755 "${srcdir}/script/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    install -Dm755 "${srcdir}/watt-toolkit" "${pkgdir}/usr/bin/watt-toolkit"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    # Steam++.sh is required by https://github.com/BeyondDimension/SteamTools/issues/3403
    ln -srfv "$pkgdir/usr/bin/watt-toolkit" "$pkgdir/usr/lib/watt-toolkit/Steam++.sh"
}
