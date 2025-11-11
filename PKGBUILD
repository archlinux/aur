
pkgbase=voicevox-bin
pkgname=($pkgbase ${pkgbase/bin/appimage})
pkgver=0.25.0
pkgrel=1
pkgdesc='A text-to-speech software'
arch=('x86_64')
license=('LGPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
makedepends=(7zip)
provides=(voicevox)
conflicts=(voicevox)
options=(!strip !debug)
source=(${url}/releases/download/${pkgver}/VOICEVOX-CPU-X64.AppImage.7z.00{1,2})
sha256sums=('00394ed1925b17912cbeb5967b97c258b42235ff4c0ba8a17bbadabe5821807f'
            '0794b55b7df93c898e9942420ee2c69f6e756c7ffc926b6074ac2eca56061918')
if [ -c /dev/nvidia0 ]; then
source=(${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.00{1..3}) # makepkg does not extract separated 7z by bsdtar
sha256sums=('SKIP' 'SKIP' 'SKIP') #todo: support updpkgsums?
fi
prepare(){
  7z -y x VOICEVOX*.AppImage.7z.001
  # Do not --appimage-extract since we have 7z
  7z x -y VOICEVOX*.AppImage voicevox.desktop usr/share/icons/hicolor/256x256/apps/voicevox.png resources/app.asar
  sed -i.bak "s/^Exec=.*/Exec=voicevox/" voicevox.desktop
}

package_voicevox-appimage(){
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/256x256/apps/voicevox.png -t "$pkgdir"/usr/share/pixmaps
  # Do not copy a large file
  chmod 755 VOICEVOX*.AppImage
  install -d "$pkgdir"/usr/bin && mv VOICEVOX*.AppImage "$pkgdir"/usr/bin/voicevox
}

package_voicevox-bin(){
  # https://raw.githubusercontent.com/VOICEVOX/voicevox/refs/tags/${pkgver}/package.json
  _electron=electron37
  depends=(7zip bash $_electron)
  optdepends=(voicevox-engine)
  install -Dm644 resources/app.asar "$pkgdir"/usr/lib/VOICEVOX/resources/app.asar
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/256x256/apps/voicevox.png -t "$pkgdir"/usr/share/pixmaps
  # Use system binaries
  arch=('any') # no native modules
  ln -sf /usr/lib/7zip/7z "$pkgdir"/usr/lib/VOICEVOX/7zzs
  echo -e "#!/bin/bash\n/usr/bin/${_electron} /usr/lib/VOICEVOX/resources/app.asar \"\$@\"" > run.sh
  install -Dm755 run.sh "$pkgdir"/usr/bin/voicevox
  install -d "$pkgdir"/usr/lib/$_electron
  ln -sf /usr/lib/VOICEVOX/vv-engine -t "$pkgdir"/usr/lib/$_electron
}


