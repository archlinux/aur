# Maintainer: Anderson Juhasc <anjhc@proton.me>
pkgname=nostrord-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Nostr NIP-29 group messaging client"
arch=('x86_64')
url="https://github.com/Nostrord/nostrord"
license=('Unlicense')
provides=('nostrord')
conflicts=('nostrord')
depends=('libxtst' 'libxrender' 'fontconfig' 'freetype2')
install=nostrord-bin.install
source=("nostrord-${pkgver}.deb::https://github.com/Nostrord/nostrord/releases/download/v${pkgver}/nostrord-${pkgver}-linux-amd64.deb")
sha256sums=('824e596e4e25d89f37fb77ff1a6ba3e8994d393a0a088d45f9902f19c211eef5')

package() {
  cd "${srcdir}"

  # Extract .deb data archive
  bsdtar -xf "nostrord-${pkgver}.deb" data.tar.xz 2>/dev/null ||
    bsdtar -xf "nostrord-${pkgver}.deb" data.tar.gz 2>/dev/null ||
    bsdtar -xf "nostrord-${pkgver}.deb" data.tar.zst
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # Move .desktop to the standard location
  local desktop_src="${pkgdir}/opt/nostrord/lib/nostrord-Nostrord.desktop"
  if [[ -f "${desktop_src}" ]]; then
    install -Dm644 "${desktop_src}" \
      "${pkgdir}/usr/share/applications/nostrord.desktop"
  fi

  # Launcher wrapper at /usr/bin
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/nostrord" <<'EOF'
#!/bin/sh
exec /opt/nostrord/bin/Nostrord "$@"
EOF
}
