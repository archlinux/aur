# Maintainer: lucaszhou007@163.com>
pkgname=mpv-sidebarsubtitles
pkgver=1.0.8
pkgrel=5
pkgdesc="Show subtitle lines in a sidebar for mpv, with uosc integration"
arch=('any')
url="https://github.com/magnumpv/sidebarsubtitles"
license=('MIT')
depends=('mpv' 'ffmpeg')
# mpv-uosc 在 AUR，构建 chroot 无法解析；补丁目标脚本需用户自行安装
optdepends=('mpv-uosc: uosc 界面（apply-patch.sh 的补丁目标）')
makedepends=('git')
_commit='911271990bd3b5ab5319295e248c009bae24b53f'
source=(
    "git+https://github.com/magnumpv/sidebarsubtitles.git#commit=${_commit}"
    "uosc-sidebarsubtitles.patch"
    "linux-compat.patch"
    "apply-patch.sh"
    "mpv-sidebarsubtitles.hook"
)
sha256sums=(
    'SKIP'
    '372e7cd9a3318e5816bed8a0ac9ead3ee8514f23c3d526188de22db69ed72a9c'
    '44cfd42683488de391658195d80823be14fac96781f8c1a802776f2bfb117237'
    '1d3a78fe44cc0a25417f754e575f92f2ed3a5348aa882c37b02563def38818a9'
    '05349ff8913aa6d61334fb8c4c4e2e43a3d31bc6672e7c6129363de3c53bfa16'
)
install="${pkgname}.install"

prepare() {
    cd "${srcdir}/sidebarsubtitles"
    # Fix Linux compatibility: upstream uses powershell to create temp dir
    # and has the path separator logic inverted.
    patch -p1 -i "${srcdir}/linux-compat.patch"
}

package() {
    cd "${srcdir}/sidebarsubtitles"

    # Install the script to /etc/mpv/scripts/ (mpv auto-scans this dir)
    install -Dm644 sidebarsubtitles.lua "${pkgdir}/etc/mpv/scripts/sidebarsubtitles.lua"

    # Install the uosc integration patch and the apply/revert helper script
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -m644 "${srcdir}/uosc-sidebarsubtitles.patch" \
        "${pkgdir}/usr/share/${pkgname}/"
    install -m755 "${srcdir}/apply-patch.sh" \
        "${pkgdir}/usr/share/${pkgname}/"

    # Pacman hook: re-apply the patch when mpv-uosc is installed/upgraded
    install -Dm644 "${srcdir}/mpv-sidebarsubtitles.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/mpv-sidebarsubtitles.hook"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
