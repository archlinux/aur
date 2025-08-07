# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
pkgname=steamlink-bin
pkgver=1.3.16.287
pkgrel=1
pkgdesc="Steam Link client (pre-compiled binary)"
arch=('x86_64')
url="https://store.steampowered.com/remoteplay#anywhere"
license=('LicenseRef-Steam')
provides=("steamlink=${pkgver}")
conflicts=('steamlink')
depends=(
	'bzip2'
	'dbus'
	'ffmpeg'
	'freetype2'
	'icu73'
	'libglvnd'
	'opus'
	'sdl3'
	'systemd-libs'
	'zlib'
)
makedepends=('ostree' 'fakeroot')
source=(
    "flathub.gpg"
    "steamlink.sh"
)
_ostree_commit=b3bccfb135f6c53dd1a0407721e54e7e96db8bbcf7461b5e38429fe96a65f8f0
sha256sums=('8bdc20abc4e19c0796460beb5bfe0e7aa4138716999e19c6f2dbdd78cc41aeaa'
            '4d5bd2835b7ccf71e53e0f6f2c4bc9a3fe2477345cb51517f05b019dd63b8fe8')

prepare() {
  mkdir -p ostree
  ostree init --repo ./ostree
  ostree remote add --gpg-import=flathub.gpg --repo ./ostree flathub https://dl.flathub.org/repo/ || true
  fakeroot ostree pull --repo ./ostree flathub app/com.valvesoftware.SteamLink/x86_64/stable@$_ostree_commit
}

build() {
  ostree export --repo ./ostree flathub:$_ostree_commit --subpath files > steamlink.tar
}

package() {
  # Install main application files
  install -dm755 "$pkgdir/opt/steamlink"
  tar -xf ./steamlink.tar -C "$pkgdir/opt/steamlink" bin/ lib/ README.txt
  
  # Install wrapper script
  install -Dm755 "$srcdir/steamlink.sh" "$pkgdir/usr/bin/steamlink"

  # Install desktop entry and icons
  tar -xf ./steamlink.tar -C "$pkgdir/usr" share/applications/ share/icons/
  sed -i 's/\/app\/bin/\/usr\/bin/g' "$pkgdir/usr/share/applications/com.valvesoftware.SteamLink.desktop"

  # Install license files
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  tar -xf ./steamlink.tar -C "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt ThirdPartyLegalNotices.css ThirdPartyLegalNotices.html
}
