

pkgname=voicevox-git
pkgver=0.25.0.preview.0.r32.g95c7212
pkgver(){
  cd voicevox
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='A text-to-speech software'
arch=(any) # no native modules
license=('LGPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
depends=(7zip bash)
optdepends=(voicevox-engine)
makedepends=(npm pnpm nodejs-lts-jod git)
source=( "git+${url}.git" voicevox.desktop)
sha256sums=('SKIP'
            '90694d6010e4ab7ea7813958653b511801242ccd1248da10bc6f277266cc58c8')

export HOME=/tmp/pnpmhome
export PLAYWRIGHT_BROWSERS_PATH=0 # DL Chromiums to void 

prepare(){
  cd voicevox
  sed -i "s|vv-engine/run.exe|/usr/lib/VOICEVOX/vv-engine/run|" .env.production # for system Electron
  pnpm install
  # Block 2nd Electron cache
  ln -sf ${XDG_CACHE_HOME}/electron/*/electron*.zip -t ${XDG_CACHE_HOME}/electron
}

build(){
  cd voicevox
  pnpm run electron:build --linux --dir #-c.electronVersion=$(cat /usr/lib/${_electron}/version)
  ln -sf /usr/lib/7zip/7z dist_electron/linux-unpacked/7zzs
}

package() {
  cd voicevox
  _electron=electron$(npm pkg get devDependencies.electron | grep -oE '[0-9][0-9]') # for --repackage
  depends+=($_electron)
  install -d "$pkgdir"/usr/lib/VOICEVOX #sync install path with -bin
  cp -r --reflink=auto dist_electron/linux-unpacked/{7zzs,README.txt,resources} -t "$pkgdir"/usr/lib/VOICEVOX
  install -Dm644 dist/icon.png "$pkgdir"/usr/share/pixmaps/voicevox.png
  install -Dm644 "$srcdir"/voicevox.desktop -t "$pkgdir"/usr/share/applications
  # Use system Electron
  echo -e "#!/bin/bash\n/usr/bin/${_electron} /usr/lib/VOICEVOX/resources/app.asar \"\$@\"" | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/voicevox
}
