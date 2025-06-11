# Contributor: Daniele Basso <d dot bass05 at proton dot me>

pkgname=code-electron-latest
pkgdesc='VSCode on latest stable electron'
pkgver=1.100.3
pkgrel=1
arch=('x86_64')
_vscode_arch=x64 # https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/PKGBUILD
_electron_arch=x64
url=https://github.com/microsoft/vscode
license=('MIT')
depends=( ripgrep xdg-utils # electron* is added at build process
libsecret libxkbfile )
optdepends=('x11-ssh-askpass: SSH authentication')
makedepends=( nodejs-lts-iron # -git .nvmrc wants -jod. But build fails
git npm pnpm python desktop-file-utils 
patch libarchive ) # base base-devel
conflicts=(code vscode)
provides=(code vscode)
options=(!strip) # sign of ext
# Do not sync $pkgrel
source=(vscode::"git+${url}.git#tag=${pkgver}"
"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/${pkgver}-1/"{code.sh,code.mjs,clipath.patch,product_json.diff})
sha512sums=('dd9c523f5c9af0608af563661fe20c71b1f91bbb3502f85c0c97a46287640d7a87e029f06c63b5394a45301c94db5f0583dba0d7f8658d57c1d78390d16d8181'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37'
            '793f9ff6306e3992ac89802d98110cba288ea1181a901467333293b7d76182ef9792c2a39ff49d9347a18a174b1f42bc58862091dff583f4146c2704eea28033'
            'e570b30cd470190aa56596913478d5fb8ba265a0f8c9d1408ea2118612cc69a360cc55e4523c3dc9c65f73e3dea53fc6620c97f6592fb9f86c3aca51ad3d9744'
            'b1aa0d7c5b3e3e8ba1172822d75ea38e90efc431b270e0b4ca9e45bf9c0be0f60922c8618969ef071b5b6dbd9ac9f030294f1bf49bcc28c187b46d113dca63a7')

prepare() {
  cd vscode

  # vsce-sign for extensions
  pnpm add @vscode/vsce-sign @vscode/vsce-sign-linux-$_vscode_arch

  # electron version
  _electronver=$(cat /usr/lib/electron/version)
  npm pkg set devDependencies.electron=${_electronver} # needed?
  sed -i "s/^target=.*/target=\"${_electronver/}\"/" .npmrc # native modules
  echo Replaced version of electron with $(rg -N 'target' .npmrc)

  # -git does not need this. app.dock is only for macOS
  sed -i '/app\.dock\.setMenu/i\// @ts-ignore' src/vs/platform/menubar/electron-main/menubar.ts

  # Launcher
  _electron=electron${_electronver%%.*}
  sed -e "s|name=electron|name=$_electron |" -e '/PKGBUILD/d' -i ../code.sh
  sed "1s|.*|#!/usr/lib/$_electron/electron|" -i ../code.mjs

  patch -p0 -i ../product_json.diff # https://github.com/Microsoft/vscode/issues/31168 for details.

  # Set the commit and build date
  sed -e "s/@COMMIT@/$(git rev-parse HEAD)/" -e "s/@DATE@/$(date -u -Is | sed 's/\+00:00/Z/')/" -i product.json

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
  # Stop DL electron
  export XDG_CACHE_HOME="$srcdir" HOME="$srcdir"/home ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  _cache_dir="$XDG_CACHE_HOME/electron/$(echo -n "https://github.com/electron/electron/releases/download/v${_electronver}" | sha256sum | cut -d ' ' -f 1)"
  mkdir -p "$_cache_dir"
  _zip="electron-v${_electronver}-linux-${_electron_arch}.zip"
  bsdtar --format zip -cf "${_cache_dir}/${_zip}" /dev/null 2> /dev/null
  echo "$(sha256sum "$_cache_dir/$_zip" | cut -d " " -f 1) *$_zip" > build/checksums/electron.txt

  npm install
  # Remove -min if minify cause OOM
  npm run gulp vscode-linux-${_vscode_arch} #-min
}

package() {
  _elnum=$(cut -d. -f1 /usr/lib/electron/version) # hide ver from --printsrcinfo
  depends+=(electron${_elnum})
  # Launcher
  install -Dm755 code.sh "$pkgdir"/usr/bin/code
  install -Dm755 code.mjs "$pkgdir"/usr/lib/code/code.mjs
  ln -sf /usr/bin/code "$pkgdir"/usr/bin/code-oss
  # Resource files
  cp -r --reflink=auto --no-preserve=ownership --preserve=mode VSCode-linux-${_vscode_arch}/resources/app/* "$pkgdir"/usr/lib/code/
  chmod -R u=rwX,go=rX "$pkgdir" # todo: cleanup
  # system-wide tools
  ln -svf /usr/bin/rg "$pkgdir"/usr/lib/code/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open "$pkgdir"/usr/lib/code/node_modules/open/xdg-open
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
  # License, use $pkgname for namcap
  install -d "$pkgdir"/usr/share/licenses/${pkgname}
  mv -v "$pkgdir"/usr/lib/code/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  mv -v "$pkgdir"/usr/lib/code/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/${pkgname}/
}
