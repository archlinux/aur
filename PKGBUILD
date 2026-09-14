# The zz-bin package published to aur.archlinux.org/packages/zz-bin, and the
# zz-beta-bin package prereleases publish to. This file is the template: the
# release workflow fills in the name, version, and checksums with
# scripts/render-aur.sh and pushes the result to the AUR, so edit this copy.
# packaging/arch/PKGBUILD is the local-development variant that packages a
# bundle built in-tree; keep the two in sync.
#
# The name carries the -bin suffix because this repackages the released Linux
# bundle rather than compiling one, and because plain `zz` on the AUR belongs
# to an unrelated project.

pkgname=zz-beta-bin
# The release tag's version; pkgver cannot carry a prerelease hyphen.
_version=0.9.1
pkgver=0.9.1
pkgrel=1
pkgdesc='Terminal, browser, and agent workspace'
arch=('x86_64' 'aarch64')
url='https://github.com/demfabris/zz'
license=('MIT OR Apache-2.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libcups'
    'libgcc'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'wayland'
)
optdepends=('org.freedesktop.secrets: import encrypted Chrome cookies')
# /usr/bin/zz and /usr/lib/zz can only have one owner.
provides=('zz')
conflicts=('zz' 'zz-bin')
# The bundle ships prebuilt and carries a full Chromium; stripping libcef.so
# would chew minutes to save nothing.
options=('!debug' '!strip')
source_x86_64=("$url/releases/download/v$_version/zz-$_version-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$_version/zz-$_version-linux-aarch64.tar.gz")
sha256sums_x86_64=('8e0d5ec2bc04ce3c52661c17d79535df5deaf94e0fc23e0cba325bcad5e8a4fc')
sha256sums_aarch64=('a01b7a0f4f29363cb173c73be1a95d6d46425d7dec3df7f461dfe2f25e1ebe69')

package() {
    install -d "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/zz-$_version-linux-$CARCH/usr/." "$pkgdir/usr/"
    chmod 0755 "$pkgdir/usr/lib/zz/zz" "$pkgdir/usr/lib/zz/cli" "$pkgdir/usr/lib/zz/chrome-sandbox"
    # The tarball ships its licenses under the app name.
    ln -s zz "$pkgdir/usr/share/licenses/$pkgname"
}
