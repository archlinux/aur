
pkgbase=voicevox-bin
pkgname=($pkgbase ${pkgbase/bin/appimage})
pkgver=0.24.2
pkgrel=2
pkgdesc='A text-to-speech software'
arch=('any')
license=('LGPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
makedepends=(7zip)
provides=(voicevox)
conflicts=(voicevox)
options=(!strip !debug)
source=(${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.00{1..3}) # makepkg does not extract separated 7z by bsdtar
sha256sums=('7adc38a57f664535ed181d2cb556e23f8d8ec7d1cc57dface8f0f55c3c0d7229'
            '679598de80e820e94946e3b1820bb04c063179f27042f9175ef38ad854983254'
            'edcd881679feb54bdf048895c0288992e45da272a9792d3cdfb359f8635576f0')
# save size
if ! [ -c /dev/nvidia0 ];then
  source=(${url}/releases/download/${pkgver}/VOICEVOX-CPU-X64.AppImage.7z.00{1,2})
  sha256sums=('e7c2bcfde1f1ce58a78a2f19da486eea5646e3a244254f77de4aaeec52771926'
              'c67beada2d0790b9aaf77fec538e21790b9a07ebf9bc00bd51b52fbb6cdbe2bb')
fi
prepare(){
  7z -y x VOICEVOX*.AppImage.7z.001
  # Unneeded to execute since we have 7z
  7z x -y VOICEVOX*.AppImage voicevox.desktop usr/share/icons/hicolor/256x256/apps/voicevox.png resources/app.asar
  sed -i.bak "s/^Exec=.*/Exec=voicevox/" voicevox.desktop
}

package_voicevox-appimage(){
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/256x256/apps/voicevox.png -t "$pkgdir"/usr/share/pixmaps
  # Do not copy large file
  install -d "$pkgdir"/usr/bin && mv VOICEVOX*.AppImage "$pkgdir"/usr/bin/voicevox && chmod 755 "$pkgdir"/usr/bin/voicevox
}

package_voicevox-bin(){
  # https://raw.githubusercontent.com/VOICEVOX/voicevox/refs/tags/${pkgver}/package.json
  _electron=electron36
  depends=(7zip bash $_electron)
  optdepends=(voicevox-engine)
  install -Dm644 resources/app.asar "$pkgdir"/usr/lib/VOICEVOX/resources/app.asar
  install -Dm644 voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/256x256/apps/voicevox.png -t "$pkgdir"/usr/share/pixmaps
  # Use system binaries
  ln -sf /usr/lib/7zip/7z "$pkgdir"/usr/lib/VOICEVOX/7zzs
  echo -e "#!/bin/bash\n/usr/bin/${_electron} /usr/lib/VOICEVOX/resources/app.asar \"\$@\"" > run.sh
  install -Dm755 run.sh "$pkgdir"/usr/bin/voicevox
  install -d "$pkgdir"/usr/lib/$_electron
  ln -sf /usr/lib/VOICEVOX/vv-engine -t "$pkgdir"/usr/lib/$_electron
}


