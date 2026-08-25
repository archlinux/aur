# Maintainer: Jon Tsiros <jon@brightblock.ai>
#
# Template. scripts/release-linux-remote.sh substitutes 0.7.1 / 361fd694e54761a02a133678e017e563c185b30280d46f0770bd6b9d0f976816 and
# runs `makepkg --printsrcinfo`; scripts/release-local.sh pushes the pair to
# ssh://aur@aur.archlinux.org/hyprlayer-desktop-bin.git.
#
# A binary package because the source repo is private. The .deb is itself built
# on Arch against Arch's webkit2gtk-4.1, so unpacking it here is only transport
# — no Debian runtime is involved.

pkgname=hyprlayer-desktop-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Native desktop app for spec-driven development with coding agents"
arch=('x86_64')
url="https://brightblock.ai/hyprlayer"
license=('LicenseRef-proprietary')
# webkit2gtk-4.1 pulls glib2/cairo/pango/gdk-pixbuf2/libsoup3 transitively; gtk3
# is listed because the binary links it directly. git is spawned for every
# network/branch operation, and xdg-utils backs tauri-plugin-opener.
depends=('webkit2gtk-4.1' 'gtk3' 'git' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('claude-code: run Claude Code agent sessions in-app'
            'nodejs: runtime for agent CLIs installed through npm')
provides=('hyprlayer-desktop')
conflicts=('hyprlayer-desktop')
# Vendor binary: cargo's [profile.release] already stripped it, and re-stripping
# someone else's ELF only risks breaking it.
options=('!strip' '!debug' '!emptydirs')
_deb="Hyprlayer_${pkgver}_amd64.deb"
source=("${_deb}::https://github.com/BrightBlock/hyprlayer-releases/releases/download/v${pkgver}/${_deb}")
sha256sums=('361fd694e54761a02a133678e017e563c185b30280d46f0770bd6b9d0f976816')
noextract=("${_deb}")

package() {
  # A .deb is an ar archive holding data.tar.<compression>; unpack the outer
  # layer to a scratch dir so the inner tarball's name doesn't have to be
  # guessed at the glob level.
  local _unpack="${srcdir}/deb"
  rm -rf "${_unpack}"
  install -d "${_unpack}"
  bsdtar -xf "${srcdir}/${_deb}" -C "${_unpack}"
  bsdtar -xpf "${_unpack}"/data.tar* -C "${pkgdir}"
}
