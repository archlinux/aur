# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=peerbeat
pkgver=0.1.0
pkgrel=1
pkgdesc="Local-first music player with LAN peer-to-peer sharing"
arch=('x86_64')
url="https://github.com/RamazanBerk20/PeerBeat"
license=('GPL-3.0-or-later')
depends=('gtk3' 'alsa-lib')
makedepends=('flutter' 'rust' 'cargo' 'cmake' 'ninja' 'clang' 'pkgconf' 'git' 'imagemagick')
provides=('peerbeat')
conflicts=('peerbeat-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f0149baf16c78df09334e3626ad57464fcd86eebaa1aa392e9cbc0fe69894b5f')

prepare() {
  cd "PeerBeat-${pkgver}"
  dart pub global activate melos
  export PATH="$PATH:$HOME/.pub-cache/bin"
  melos bootstrap
  bash scripts/frb_gen.sh
}

build() {
  cd "PeerBeat-${pkgver}"
  export PATH="$PATH:$HOME/.pub-cache/bin"
  flutter config --enable-linux-desktop --no-analytics
  (cd apps/peerbeat && flutter build linux --release)
  bash scripts/gen_icons.sh
}

package() {
  cd "PeerBeat-${pkgver}"
  local bundle="apps/peerbeat/build/linux/x64/release/bundle"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${bundle}/." "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 packaging/linux/peerbeat.desktop \
    "${pkgdir}/usr/share/applications/peerbeat.desktop"
  install -Dm644 packaging/linux/io.github.ramazanberk20.PeerBeat.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.ramazanberk20.PeerBeat.metainfo.xml"
  for s in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "assets/icon/generated/hicolor/${s}x${s}/apps/peerbeat.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/peerbeat.png"
  done
}
