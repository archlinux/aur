# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
url="https://github.com/VN-Linux-Family/zalo-for-linux"
_api_url="https://api.github.com/repos/VN-Linux-Family/zalo-for-linux/releases/latest"

_release_data=$(python3 -c '
import urllib.request, json, re
assets = json.loads(urllib.request.urlopen("'"${_api_url}"'").read()).get("assets", [])
x86 = next(a for a in assets if "+ZaDark-" in a["name"] and a["name"].endswith("-x86_64.AppImage"))
arm = next(a for a in assets if "+ZaDark-" in a["name"] and a["name"].endswith("-aarch64.AppImage"))
m = re.search(r"^Zalo-([^+]+)\+ZaDark-([^-]+)-([a-f0-9]+)-", x86["name"])
print(m.group(1), m.group(2), m.group(3), x86["browser_download_url"], arm["browser_download_url"], sep="|")
')

IFS='|' read -r _zalover _zadarkver _commithash _url_x86_64 _url_aarch64 <<< "$_release_data"

_file_x86_64="${_url_x86_64##*/}"
_file_aarch64="${_url_aarch64##*/}"
_rev=1
pkgver=${_zalover}.${_zadarkver}.r${_rev}.${_commithash}
pkgrel=1
epoch=1
pkgdesc="Zalo for Linux (with ZaDark)"
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
provides=(zalo)
conflicts=(zalo)
makedepends=('python' 'git')
depends=(
    'glibc'
    'python'
    'opus'
    'libpulse'
    'alsa-utils'
    'pipewire'
    'rtkit'
)
optdepends=(
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
    'zenity: call window when the engine is run standalone'
)
source=(
    "zalo.desktop"
    "Zalo.png"
    "zalo-repo::git+${url}.git"
)
source_x86_64=("${_file_x86_64}::${_url_x86_64}")
source_aarch64=("${_file_aarch64}::${_url_aarch64}")

options=(!strip !debug)
sha256sums=(
    'b9478f6156fc65858971ca8fb0cc0b94d327ed34f704ce4c614b10e7510dbfe9'
    '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
    'SKIP'
)
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    cd "${srcdir}/zalo-repo"
    local _rev_count
    _rev_count=$(git rev-list --count "${_commithash}")
    printf "%s.%s.r%s.%s" "${_zalover}" "${_zadarkver}" "${_rev_count}" "${_commithash}"
}

package() {
    local _target_file="_file_${CARCH}"
    install -Dm755 "${srcdir}/${!_target_file}" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
