# Maintainer: zbe <aur at zbe dot bz>
# Contributor: Winston Astrachan <rew1red at rew1 dot red>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=pcloud-drive
pkgver=2.2.1
pkgrel=2
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=("LicenseRef-${pkgname}")
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3: Tray menu support')
options=(!strip !debug)
install="${pkgname}.install"
replaces=('pcloud-git' 'pcloud')
_shortname='pcloud'
_appimage="${pkgname}-${pkgver}-${pkgrel}.AppImage"
_api_code='XZopbc5ZpqOBs9mkVRk4zDHD7TjDJpQBcfzk'
_api_response="$(curl -s "https://api.pcloud.com/getpublinkdownload?code=${_api_code}")"
_dlhost="$(echo ${_api_response} | grep -E -o '[a-zA-Z0-9\-]+\.pcloud\.com' | head -n 2 | sort -R | head -n 1)"
_dlpath="$(echo ${_api_response} | grep -E -o "\"path\":\s{0,1}\".+\"" | cut -d '"' -f 4 | tr -d '\\')"
source=('LICENSE'
        "${_appimage}::https://${_dlhost}${_dlpath}")
sha256sums=('9dce0249569d9dc9f00217009880458cf669a657ebb6604b4e52be4e875f1a42'
            '3fddf5e975ffb38b968f5814cd8d0f2db1473ba49c1b2072f02911b5755e1f42')

prepare() {
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

package() {
    cd "${srcdir}"

    # Self-contained bundle under /opt; kept out of /usr/lib so its private
    # Electron/Chromium libs can't collide with real system ones.
    install -d "${pkgdir}/opt/${_shortname}"
    cp -r squashfs-root/. "${pkgdir}/opt/${_shortname}/"

    # appimage-extract can leave entries owner-only; make everything
    # traversable/usable by normal users without touching non-exec files.
    chmod -R u+rwX,go+rX "${pkgdir}/opt/${_shortname}"

    # Setuid chrome-sandbox is dead weight here: pacman strips setuid on
    # install, so it could never engage; app already runs unsandboxed.
    find "${pkgdir}/opt/${_shortname}" -name chrome-sandbox -delete

    # Install License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -r "${pkgdir}/opt/${_shortname}/usr/share/icons/hicolor/." \
        "${pkgdir}/usr/share/icons/hicolor/"
    # Drop the bundle's now-unused icon copy and the symlinks left dangling by it.
    rm -rf "${pkgdir}/opt/${_shortname}/usr/share/icons" \
           "${pkgdir}/opt/${_shortname}/.DirIcon" \
           "${pkgdir}/opt/${_shortname}/pcloud.png"

    # Same desktop-file ID pCloud self-writes on every launch, so its copy
    # shadows ours by XDG precedence -- one menu entry instead of two.
    install -Dm644 "${pkgdir}/opt/${_shortname}/${_shortname}.desktop" \
        "${pkgdir}/usr/share/applications/appimagekit-${_shortname}.desktop"
    sed -i "s/Name=pcloud/Name=pCloud/" \
        "${pkgdir}/usr/share/applications/appimagekit-${_shortname}.desktop"
    sed -i "s|Exec=AppRun|Exec=/usr/bin/${_shortname}|" \
        "${pkgdir}/usr/share/applications/appimagekit-${_shortname}.desktop"

    # AppRun sets up LD_LIBRARY_PATH and execs the real binary directly, so
    # there's no runtime squashfs mount left for a crash to tear down.
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_shortname}/AppRun" "${pkgdir}/usr/bin/${_shortname}"

    # Permanent compat shim: pCloud hardcodes this old path into files it
    # self-manages under $HOME and doesn't reliably regenerate them.
    ln -sf AppRun "${pkgdir}/opt/${_shortname}/pCloud.AppImage"
}
