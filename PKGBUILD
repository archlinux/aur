# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=code
pkgname=code-git
pkgdesc='OSS version of Visual Studio Code editor'
pkgver=1.102.0.r1.gc6e8ac1
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/vscode'
license=('MIT')
_electron=electron
depends=( $_electron ripgrep xdg-utils
libsecret libxkbfile )
optdepends=('x11-ssh-askpass: SSH authentication')
makedepends=( nodejs-lts-jod # see .nvmrc
git npm python desktop-file-utils libarchive curl)
conflicts=(code vscode)
provides=(code vscode)
options=(!strip) # for sign of ext
# use depth=1
source=('https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/'{code.sh,code.mjs,clipath.patch,product_json.diff})
sha256sums=('SKIP'{,,,}) # should we have cksums ?

pkgver() {
  cd vscode
  printf "%s.r%s.g%s" \
    $(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json) \
    $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  rm -rf vscode
  git clone --depth=1 ${url}.git vscode
  cd vscode
  
  # electron version
  _electronver=$(npm pkg get devDependencies.electron)
  echo Replacing $_electronver
  _electronver=$(cat /usr/lib/${_electron}/version)
  npm pkg set devDependencies.electron=${_electronver} # unneeded ?
  sed -i "s/^target=.*/target=\"${_electronver/}\"/" .npmrc # native modules
  echo with $(rg -N 'target' .npmrc)

  # Launcher
  sed -e "s|name=electron|name=$_electron |" -e '/PKGBUILD/d' -i ../code.sh
  sed "1s|.*|#!/usr/lib/$_electron/electron|" -i ../code.mjs

  patch -p0 -i ../product_json.diff # https://github.com/Microsoft/vscode/issues/31168 for details.

  # Set the commit and build date
  sed -e "s/@COMMIT@/$(git rev-parse HEAD)/" -i product.json

  # Appdata and desktop file
  sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
          s|@@NAME_SHORT@@|Code|g
          s|@@NAME_LONG@@|Code - OSS|g
          s|@@NAME@@|code-oss|g
          s|@@ICON@@|com.visualstudio.code.oss|g
          s|@@EXEC@@|code-oss|g
          s|@@LICENSE@@|MIT|g
          s|@@URLPROTOCOL@@|vscode|g' \
          resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

  desktop-file-edit --set-key StartupWMClass --set-value code-oss resources/linux/code.desktop

  cp resources/linux/{code,code-oss}-url-handler.desktop
  desktop-file-edit --set-key MimeType --set-value x-scheme-handler/code-oss resources/linux/code-oss-url-handler.desktop

  # shell completions
  cp resources/completions/bash/code resources/completions/bash/code-oss
  cp resources/completions/zsh/_code resources/completions/zsh/_code-oss
  # Patch completions with correct names
  sed -i 's|@@APPNAME@@|code|g' resources/completions/{bash/code,zsh/_code}
  sed -i 's|@@APPNAME@@|code-oss|g' resources/completions/{bash/code-oss,zsh/_code-oss}

  patch -p1 -i "$srcdir/clipath.patch"
}

build() {
  cd vscode
  # Don't DL ripgrep
  export TMPDIR="$srcdir"/tmp
  _vsrgver=$(npm pkg get dependencies.@vscode/ripgrep | sed 's/[\"^]//g')
  _rgver=13.0.0-13
  mkdir -p "$TMPDIR"/vscode-ripgrep-cache-$_vsrgver
  touch rg # Archived symlink is replaced
  bsdtar -czf "$TMPDIR"/vscode-ripgrep-cache-${_vsrgver}/ripgrep-v${_rgver}-x86_64-unknown-linux-musl.tar.gz rg
  # Don't DL Electron
  export XDG_CACHE_HOME="$srcdir" HOME="$srcdir"/home # Don't taint user dir
  _cache_dir="$XDG_CACHE_HOME"/electron/$(echo -n "https://github.com/electron/electron/releases/download/v${_electronver}" | sha256sum | cut -d ' ' -f 1)
  mkdir -p "$_cache_dir"
  _zip="electron-v${_electronver}-linux-x64.zip"
  # cd "/usr/lib/$_electron" && zip -r "$_cache_dir/$_zip" . && cd - # broken
  # bsdtar --format zip -cf "${_cache_dir}/${_zip}" /dev/null 2> /dev/null # broken
  # echo "$(sha256sum "$_cache_dir/$_zip" | cut -d " " -f 1) *$_zip" > build/checksums/electron.txt # broken
  curl -L https://github.com/electron/electron/releases/download/v${_electronver}/SHASUMS256.txt -o build/checksums/electron.txt
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

  npm install
  npm run gulp vscode-linux-x64 #-min minify cause OOM
}

package() {
  # Resource files
  install -dm755 "$pkgdir"/usr/lib/code
  cp -r --reflink=auto --no-preserve=ownership VSCode-linux-x64/resources/app/* "$pkgdir"/usr/lib/code/
  # system tools
  ln -svf /usr/bin/rg "$pkgdir"/usr/lib/code/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open "$pkgdir"/usr/lib/code/node_modules/open/xdg-open
  # Launcher
  install -Dm755 code.sh "$pkgdir"/usr/bin/code
  install -Dm755 code.mjs "$pkgdir"/usr/lib/code/code.mjs
  ln -sf /usr/bin/code "$pkgdir"/usr/bin/code-oss
  # Appdata and desktop file
  install -Dm644 vscode/resources/linux/code.appdata.xml "$pkgdir"/usr/share/metainfo/code-oss.appdata.xml
  install -Dm644 vscode/resources/linux/code.desktop "$pkgdir"/usr/share/applications/code-oss.desktop
  install -Dm644 vscode/resources/linux/code-url-handler.desktop "$pkgdir"/usr/share/applications/code-url-handler.desktop
  install -Dm644 vscode/resources/linux/code-oss-url-handler.desktop "$pkgdir"/usr/share/applications/code-oss-url-handler.desktop
  # SVG icon
  install -d "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  ln -sf /usr/lib/code/out/media/code-icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.visualstudio.code.oss.svg
  # Shell completions
  install -Dm644 vscode/resources/completions/bash/code "$pkgdir"/usr/share/bash-completion/completions/code
  install -Dm644 vscode/resources/completions/bash/code-oss "$pkgdir"/usr/share/bash-completion/completions/code-oss
  install -Dm644 vscode/resources/completions/zsh/_code "$pkgdir"/usr/share/zsh/site-functions/_code
  install -Dm644 vscode/resources/completions/zsh/_code-oss "$pkgdir"/usr/share/zsh/site-functions/_code-oss
  # License
  install -Dm644 VSCode-linux-x64/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 VSCode-linux-x64/resources/app/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt
}
