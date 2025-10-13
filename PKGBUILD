

pkgname=voicevox
pkgver=0.24.2
pkgrel=3
pkgdesc='A text-to-speech software'
arch=(any) # no native modules
license=('LGPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
depends=(7zip bash)
optdepends=(voicevox-engine)
makedepends=(npm pnpm nodejs-lts-jod git)
source=( #"git+${url}.git#tag=$pkgver"
${url}/archive/refs/tags/${pkgver}.tar.gz
voicevox.desktop)
sha256sums=('b10fd4c55d706fdd3df1e849924e415261f702dbe1a25af73016d10ebbc6bb27'
            '90694d6010e4ab7ea7813958653b511801242ccd1248da10bc6f277266cc58c8')

export HOME=/tmp/pnpmhome

prepare(){
  cd voicevox-$pkgver
  sed -i "s|vv-engine/run.exe|/usr/lib/VOICEVOX/vv-engine/run|" .env.production # for system Electron
  pnpm install --ignore-scripts # do not DL 900 MB Chromiums
}

build(){
  cd voicevox-$pkgver
  mkdir -p vendored/7z && touch vendored/7z/{7zzs,electron} # missing by --ignore-scripts
  #_electron=electron$(npm pkg get devDependencies.electron | grep -oE '[0-9][0-9]')
  pnpm run electron:build --linux --dir -c.electronDist=vendored/7z #-c.electronVersion=$(cat /usr/lib/${_electron}/version)
  ln -sf /usr/lib/7zip/7z dist_electron/linux-unpacked/7zzs
  rm dist_electron/linux-unpacked/voicevox
}

package() {
  cd voicevox-$pkgver
  _electron=electron$(npm pkg get devDependencies.electron | grep -oE '[0-9][0-9]') # for --repackage
  depends+=($_electron)
  install -d "$pkgdir"/usr/lib #sync install path with -bin
  cp -r --reflink=auto dist_electron/linux-unpacked "$pkgdir"/usr/lib/VOICEVOX
  install -Dm644 dist/icon.png "$pkgdir"/usr/share/pixmaps/voicevox.png
  install -Dm644 "$srcdir"/voicevox.desktop -t "$pkgdir"/usr/share/applications
  # Use system Electron
  echo -e "#!/bin/bash\n/usr/bin/${_electron} /usr/lib/VOICEVOX/resources/app.asar \"\$@\"" | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/voicevox
}
