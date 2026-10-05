# Maintainer: Alex3236 <me@alex3236.moe>

pkgname=zed-i18n-bin
pkgver=1.22.0+i18n.1
pkgrel=1
pkgdesc="Localized build of the Zed editor (community i18n release)"
arch=('x86_64')
url="https://github.com/LI-NA/zed-i18n"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'          # libasound.so.2
    'gcc-libs'          # libgcc_s.so.1, libstdc++.so.6
    'glib2'             # libgio-2.0, libglib-2.0, libgobject-2.0
    'glibc'
    'hicolor-icon-theme'
    'libx11'            # libX11-xcb.so.1
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-icd-loader' # dlopen'd by wgpu for GPU rendering
)
optdepends=(
    'git: Git integration'
    'vulkan-driver: GPU acceleration'
)

# An alternative to the other Zed packages, not a companion: they all install
# the same editor, so only one may be present. The provided zed version is the
# upstream release this build is based on (pkgver minus the +i18n suffix).
provides=("zed=${pkgver%%+*}" 'zed-i18n')
conflicts=('zed' 'zed-bin' 'zed-git' 'zed-preview-bin' 'zed-i18n')
options=('!debug' '!strip')

# Upstream tags are "v<zed version>-i18n.<n>" while the deb (and hence pkgver)
# uses "1.22.0+i18n.1", matching the deb's control Version field.
_tag="v${pkgver/+i18n./-i18n.}"

source=("${pkgname}-${pkgver}.deb::https://github.com/LI-NA/zed-i18n/releases/download/${_tag}/zed-i18n-linux-x86_64.deb")
sha256sums=('5116eb38758937b6c4e8f96e5064dc107458bf619744b1b0dcb4d8d737c1ee12')

package() {
    cd "$srcdir"

    # .deb is an ar archive holding control.tar.gz and data.tar.xz
    rm -rf root
    mkdir root
    bsdtar -xf "${pkgname}-${pkgver}.deb" -C root
    bsdtar -xf root/data.tar.xz -C "$pkgdir"

    # Upstream bundles nine shared libraries which RPATH ($ORIGIN/../lib) loads
    # in preference to the system copies. All of them exist in the repos and the
    # binary only needs GLIBC <= 2.30 / GLIBCXX <= 3.4.29, so drop them: the
    # bundled libxkbcommon is built against older X11 protocol headers, lacks
    # the dead_hamza keysym and fails to parse the system Compose file.
    rm -rf "$pkgdir/usr/lib/zed-i18n/lib"

    # Arch's name for Zed's CLI is zeditor, because /usr/bin/zed belongs to
    # zfs-utils (ZED, the ZFS Event Daemon).
    mv "$pkgdir/usr/bin/zed-i18n" "$pkgdir/usr/bin/zeditor"

    # The launcher is written for a dpkg install: it blocks upstream's bundled
    # install.sh uninstaller and disables in-app updates. Keep that logic, but
    # correct the distro-specific user-visible strings for Arch.
    sed -i \
        -e 's|sudo apt remove zed-i18n|sudo pacman -R zed-i18n-bin|' \
        -e 's|This Zed i18n build was installed as a Debian package\.|This Zed i18n build was installed as an Arch package.|' \
        -e 's|Zed i18n was installed as a Debian package\. Download the latest package from https://github.com/LI-NA/zed-i18n/releases/latest to update\.|Zed i18n was installed as an Arch package. Update it with pacman -Syu or your AUR helper.|' \
        "$pkgdir/usr/bin/zeditor"

    # Point the menu entry at the installed command name. The icon name stays as
    # shipped, since the window's app_id is dev.zed-i18n.Zed and a matching
    # desktop file name is what associates the two.
    sed -i \
        -e 's|^Exec=zed-i18n|Exec=zeditor|' \
        -e 's|^TryExec=zed-i18n|TryExec=zeditor|' \
        "$pkgdir/usr/share/applications/dev.zed-i18n.Zed.desktop"
}
