# Maintainer: MoonlightWeb <octointernational@gmail.com>
# ============================================================================
#  MoonlightWeb — AUR package (TEMPLATE, not a valid PKGBUILD as it stands).
#
#  0.3.0 / c896b19a8dd69867998a3814bb5b902f23da2ebd18eae5bbcdedd11b85afdff0 are substituted by the `aur` job in
#  .github/workflows/release.yml, which pushes the result — together with the
#  matching .SRCINFO, rendered from the same values — to
#  ssh://aur@aur.archlinux.org/moonlightweb-bin.git. Edit this file, not the
#  copy in the AUR repository.
#
#      paru -S moonlightweb-bin
#
#  Why -bin and not a from-source package: the released binary embeds the
#  Internet Access configuration at build time (see backend/CMakeLists.txt),
#  which a rebuild on someone else's machine would not have. Repackaging the
#  official .deb keeps Arch users on the exact artifact everyone else gets.
#
#  Why the .deb and not the AppImage: it carries the .desktop entry, the icon
#  and the AppStream metainfo already laid out under /usr, so package() is a
#  single extraction and the app appears in KDE Discover like any other.
# ============================================================================
pkgname=moonlightweb-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Stream your Sunshine games to any device with a browser"
arch=('x86_64')
url="https://moonlightweb.top/"
license=('GPL-3.0-only')

# Qt and OpenSSL are bundled inside /opt/moonlightweb (linuxdeploy rewrote the
# rpaths to $ORIGIN), so only what linuxdeploy deliberately leaves to the system
# is listed here — the libraries any graphical session already provides, plus
# the driver-coupled stack the native host captures and encodes with (libdrm,
# libva, EGL/GLES via libglvnd, GBM via mesa) and the PipeWire client library
# for the host's audio. libcap provides setcap for the .install hook.
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11' 'libxkbcommon-x11'
         'fontconfig' 'freetype2' 'zlib' 'dbus'
         'libdrm' 'libva' 'mesa' 'pipewire' 'libcap')

provides=('moonlightweb')
conflicts=('moonlightweb')
install=moonlightweb-bin.install

# The bundled Qt libraries ship as-is; stripping them buys nothing and has
# broken plugin loading before.
options=('!strip' '!debug')

source=("moonlightweb-${pkgver}.deb::https://github.com/linckosz/moonlight-web/releases/download/v${pkgver}/moonlightweb-${pkgver}-linux-x64.deb")
sha256sums=('c896b19a8dd69867998a3814bb5b902f23da2ebd18eae5bbcdedd11b85afdff0')

package() {
    # makepkg hands .deb to libarchive, which unpacks it into its ar members;
    # data.tar.* is the payload, already rooted at /opt and /usr.
    bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
