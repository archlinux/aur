# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=onorca-bin
pkgver=1.4.155
pkgrel=1
pkgdesc="Orca - next-gen IDE for working with a fleet of parallel coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/stablyai/orca"
license=('MIT')
# Electron runtime + the AT-SPI/automation stack the deb declares
# (python3, python3-gi, gir1.2-atspi-2.0, xdotool, xclip, xvfb) that Orca uses
# to drive GUIs for its parallel agents. python-gobject + at-spi2-core cover
# python3-gi and the Atspi-2.0 typelib.
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'python'
    'python-gobject'
    'xclip'
    'xdotool'
    'xorg-server-xvfb'
)
optdepends=('libappindicator-gtk3: system tray indicator support')
provides=('orca-ide')
conflicts=('orca-ide')
# Prebuilt Electron binaries: never strip (breaks them) and skip debug pkg.
options=('!strip' '!debug')

_relurl="https://github.com/stablyai/orca/releases/download/v${pkgver}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/stablyai/orca/v${pkgver}/LICENSE")
# ponytail: pkgver in the local .deb name so makepkg re-fetches on bump
# instead of reusing a stale cached tarball ([[pkgbuild-source-filename-versioned]]).
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_relurl}/orca-ide_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_relurl}/orca-ide_${pkgver}_arm64.deb")

sha256sums=('ff1b611f80580d49f4b97e93a97b24eb050b0671b26b8afe16341fab699112f3')
sha256sums_x86_64=('3ea7316bc1951df2253a2b30d3b1faa2014c3c4b01055fa4500b2723018cec3c')
sha256sums_aarch64=('1f3c94ebefd3b38a9cbdcdb23e4faa474ece9b31ada9c6f0829c77cfcb6dde26')

package() {
    cd "$srcdir"
    # .deb is an ar archive of {debian-binary, control.tar.*, data.tar.*};
    # bsdtar (libarchive, always present) unpacks both layers, no binutils needed.
    bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.deb"
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # Upstream postinst suid's the sandbox helper for hosts without unprivileged
    # user namespaces; match it.
    chmod 4755 "$pkgdir/opt/Orca/chrome-sandbox"

    # The deb ships no /usr/bin entry; its postinst symlinks the CLI shim there.
    # orca-ide = upstream's own name, chosen to avoid the GNOME Orca clash.
    install -d "$pkgdir/usr/bin"
    ln -s /opt/Orca/resources/bin/orca-ide "$pkgdir/usr/bin/orca-ide"

    install -Dm644 "$srcdir/LICENSE-${pkgver}" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
