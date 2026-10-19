# Maintainer: burningserenity <burningserenity@novo-ordo.com>

# RozeLynx from the precompiled release tarballs published upstream: the
# same dist/rozelynx-<ver>-<arch>.tar.xz the build script's --tarball stage
# produces, i.e. a complete staged /usr tree built against glibc.

pkgname=rozelynx-bin
pkgver=158.0.2
pkgrel=5
pkgdesc='RozeLynx Web Browser: Firefox fork with LibreWolf privacy patches and per-tab network interface binding (binary release; Wayland-only builds - build rozelynx-git for X11/XWayland)'
arch=(x86_64)
url='https://bytewheel.org/rozelynx'
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  alsa-lib
  aom
  at-spi2-core
  cairo
  dav1d
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  harfbuzz
  'icu>=78.1'
  libdrm
  libepoxy
  libevent
  libjpeg-turbo
  libpulse
  libvpx
  libwebp
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  mesa
  'nspr>=4.39'
  'nss>=3.130'
  pam
  pango
  pixman
  zlib
)
optdepends=(
  'libva: VAAPI hardware video decoding'
  'networkmanager: geolocation via nearby Wi-Fi networks (necko-wifi)'
  'vulkan-icd-loader: Vulkan rendering (hwaccel vulkantest)'
  'howdy: face recognition for local passkeys (pam-passkeys; password prompt is the fallback)'
)
provides=("rozelynx=${pkgver}")
conflicts=(rozelynx)
install=rozelynx-bin.install
_tag="v${pkgver}"
source=("https://github.com/Bytewheel/RozeLynx/releases/download/${_tag}/rozelynx-${pkgver}-${CARCH}.tar.xz")
sha256sums=('4206f7b816a1fea72d272d44c7817a3863e03b40552825b71b43cc95666be61f')

package() {
  # the tarball contains a complete staged usr/ tree
  cp -a "${srcdir}/usr" "${pkgdir}/"

  # PAM service for the local passkey platform authenticator (the
  # browser resolves this name first, then system-auth); face
  # recognition comes from pam_howdy.so when the system carries it.
  install -Dm644 /dev/stdin "${pkgdir}/etc/pam.d/rozelynx" <<'PAMCONF'
#%PAM-1.0
# RozeLynx passkeys: user verification (howdy face auth first when
# configured, then the account password).
#auth     sufficient   pam_howdy.so
auth     include      system-auth
account  include      system-auth
PAMCONF
}