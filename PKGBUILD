# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>

pkgname=we-proton
pkgver=ge11.11.31
pkgrel=1
_tag="we-proton-${pkgver//./-}"
pkgdesc='修复 WeGame 和其上游戏在 Linux 的兼容问题，支持游戏加速器。基于 GE-Proton，集成部分 DW-Proton 补丁。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/we-proton'
license=('BSD-3-Clause' 'LGPL-2.1-or-later' 'MIT' 'Zlib' 'OFL-1.1' 'custom')
optdepends=('steam: 在 Steam 里选用 WE-Proton'
            'wegame-launcher: 用 WE-Proton 运行 WeGame')
options=('!strip' '!debug')
source=("$url/releases/download/$_tag/$_tag.tar.xz")
sha512sums=('bf3c34a2cc460877c02e343f3a86a9da94772cf4d8ea0f7639aec1acd4ee6883e3f346cdd8b560b3d83cdab53b3def2bb226d66965e6c253347dc5039f65de50')

package() {
    local _name='WE-Proton Latest'
    local _dest="$pkgdir/usr/share/steam/compatibilitytools.d/$_name"
    install -d "$_dest"
    cp -a --no-preserve=ownership "$_tag"/. "$_dest"/
    rm -rf "$_dest/__pycache__"

    # 固定目录名和 Steam 内部名，升级后游戏里选的兼容性工具不会失效；
    # 版本号只写在显示名里。
    sed -i -e "s|\"$_tag\" // Internal name|\"${_name// /-}\" // Internal name|" \
           -e "s|\"display_name\" \"$_tag\"|\"display_name\" \"$_name ($_tag)\"|" \
           "$_dest/compatibilitytool.vdf"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for _f in LICENSE LICENSE.7zip COPYING.7zip LICENSE.OFL PATENTS.AV1; do
        ln -s "/usr/share/steam/compatibilitytools.d/$_name/$_f" "$pkgdir/usr/share/licenses/$pkgname/$_f"
    done
}
