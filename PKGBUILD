

pkgname=voicevox-bin
pkgver=0.24.2
pkgrel=2
pkgdesc='A text-to-speech software'
arch=('any')
license=('LGPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
# see https://raw.githubusercontent.com/VOICEVOX/voicevox/refs/tags/${pkgver}/package.json
_electron=electron36
depends=(7zip bash $_electron)
optdepends=(voicevox-engine)
provides=(voicevox)
conflicts=(voicevox)
DLAGENTS=('https::/bin/true')
source=(voicevox.desktop
${url}/releases/download/${pkgver}/voicevox-linux-cpu-x64-${pkgver}.tar.gz)
noextract=(${source[1]})
sha256sums=('SKIP' 'SKIP')

prepare() {
  curl -L ${source[1]} -o -|bsdtar xzvf - VOICEVOX/{resources,vv-engine/resources/engine_manifest_assets/icon.png}
}

package() {
  install -Dm644 VOICEVOX/resources/app.asar "$pkgdir"/usr/lib/VOICEVOX/resources/app.asar
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 VOICEVOX/vv-engine/resources/engine_manifest_assets/icon.png "$pkgdir"/usr/share/pixmaps/voicevox.png
  # Use system binaries
  ln -sf /usr/lib/7zip/7z "$pkgdir"/usr/lib/VOICEVOX/7zzs
  echo -e "#!/bin/bash\n/usr/bin/${_electron} /usr/lib/VOICEVOX/resources/app.asar \"\$@\"" | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/voicevox
  install -d "$pkgdir"/usr/lib/$_electron
  ln -sf /usr/lib/VOICEVOX/vv-engine -t "$pkgdir"/usr/lib/$_electron
}
