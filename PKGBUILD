pkgname=steamlink
_name=steamlink
pkgver=1.2.0.241
pkgrel=1
pkgdesc="Steam Link client"
arch=('x86_64')
url="https://store.steampowered.com/remoteplay#anywhere"
license=('custom')
depends=(
	'cairo'
	'freetype2'
	'gtk3'
	'harfbuzz'
	'icu69'
	'libdrm'
	'libglvnd'
	'libice'
	'libjpeg6-turbo'
	'libpng'
	'libsm'
	'libssl.so=1.1-64'
	'libva'
	'libvdpau'
	'libx11'
	'libxcomposite'
	'libxkbcommon'
	'libxkbcommon-x11'
	'opus'
	'pango'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'xcb-util-wm'
)
makedepends=('ostree' 'fakeroot')
source=(
    "flathub.gpg"
    "steamlink.sh"
)
# Ensuring we're serving the correct image
_ostree_commit=e618ca0305663bcc2879f71bd4e392fab8027ae685c3e60b707b8167000ac27d
sha256sums=('8bdc20abc4e19c0796460beb5bfe0e7aa4138716999e19c6f2dbdd78cc41aeaa'
            '4d5bd2835b7ccf71e53e0f6f2c4bc9a3fe2477345cb51517f05b019dd63b8fe8')

build() {
  mkdir -p ostree
  ostree init --repo ./ostree
  ostree remote add --gpg-import=flathub.gpg --repo ./ostree flathub https://dl.flathub.org/repo/ || true
  fakeroot ostree pull --repo ./ostree flathub app/com.valvesoftware.SteamLink/x86_64/stable@$_ostree_commit
  ostree export --repo ./ostree flathub:$_ostree_commit --subpath files > steamlink.tar
}

package() {
  mkdir -p $pkgdir/opt/steamlink
  tar -xf ./steamlink.tar -C $pkgdir/opt/steamlink bin/ lib/ README.txt
  
  # Wrapper script - needed as we need Steam's shipped libraries
  install -Dm755 $srcdir/steamlink.sh $pkgdir/usr/bin/steamlink

  # desktop entry / icon
  mkdir -p $pkgdir/usr
  tar -xf ./steamlink.tar -C $pkgdir/usr share/applications/ share/icons/
  sed -i 's/\/app\/bin/\/usr\/bin/g' $pkgdir/usr/share/applications/com.valvesoftware.SteamLink.desktop

  # License
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  tar -xf ./steamlink.tar -C $pkgdir/usr/share/licenses/$pkgname LICENSE.txt ThirdPartyLegalNotices.css ThirdPartyLegalNotices.html
}
