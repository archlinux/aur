# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname=windsurf
pkgver=1.7.2
pkgrel=1
pkgdesc="The new purpose-built IDE to harness magic"
arch=('x86_64')
url="https://windsurf.com/"
license=('custom')
depends=(
    'alsa-lib'
    'bash'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'gcc-libs'
    'glibc>=2.28-4'
    'gnupg'
    'gtk3'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbfile'
    'libxrandr'
    'libxss'
    'libxtst'
    'lsof'
    'mesa'
    'nspr'
    'nss'
    'shared-mime-info'
    'xdg-utils'
)
optdepends=('glib2: Needed for move to trash functionality'
            'org.freedesktop.secrets: Needed for settings sync'
            'libdbusmenu-glib: Needed for KDE global menu'
            'icu69: Needed for live share'
            'vulkan-icd-loader: Vulkan support')

provides=('windsurf')
options=('!strip')

source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb")

sha256sums=('4742fe6a4591572faf75ec0668d0fedf22b3eeff6a9f344372d9edeede3057f5')

prepare() {
    bsdtar -xf "data.tar.xz"
}

package() {
    # Install main binaries
    install -d "${pkgdir}/usr/share/${pkgname}"
    mv "usr/share/${pkgname}" "${pkgdir}/usr/share/"

    # Install binary launcher symbolic link
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/windsurf/windsurf "${pkgdir}/usr/bin/${pkgname}"
    # Install desktop entry files for application and URL handling
    mv usr/share/applications "${pkgdir}/usr/share/applications"
    # Install application metadata (AppStream metainfo)
    install -Dm644 "usr/share/appdata/${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/com.codeium.${pkgname}.metainfo.xml"
    install -Dm644 "usr/share/mime/packages/${pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
    install -Dm644 "usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
	# Shell completions
    mv "usr/share/bash-completion" "${pkgdir}/usr/share/bash-completion"
    install -Dm 644 "usr/share/zsh/vendor-completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
