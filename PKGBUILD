# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=code
pkgname=code-git
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor - git latest'
# Important: Remember to check https://github.com/microsoft/vscode/wiki/How-to-Contribute#prerequisites for target node version
_electron=electron29
pkgver=1.91.0.r122257.gd2d053d84e2
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/microsoft/vscode'
license=('MIT')
depends=($_electron 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('bash-completion: Bash completions'
            'zsh-completions: ZSH completitons'
            'x11-ssh-askpass: SSH authentication')
makedepends=('gulp' 'git' 'npm' 'python' 'yarn' 'nodejs-lts-iron' 'desktop-file-utils' 'zip')
conflicts=('visual-studio-code-git')
provides=('visual-studio-code-git')
source=(vscode::"git+https://github.com/microsoft/vscode.git"
        ${pkgname}.js
        ${pkgname}.sh
        'product_json.diff'
        'clipath.patch')
sha512sums=('SKIP'
            '300efb54f372131f7fd3d9dba2abe9e3b1185afe598b659fa5a370850b68e5d2bca514405555f0d04935feef5070a6e20b00536874e209169fbb9a059bb3697d'
            'cdbf1c3ed96c608ccb2cb349f8f550fc5937ea88e725ad6712f9a13292c9a3335e43f81d235753ae054fcdc4e52bf0bfef28b7a3afdab1a3fc97481339587c3c'
            'b1aa0d7c5b3e3e8ba1172822d75ea38e90efc431b270e0b4ca9e45bf9c0be0f60922c8618969ef071b5b6dbd9ac9f030294f1bf49bcc28c187b46d113dca63a7'
            '9809c9719b04c00d46477e2786a64ec40867096d287d68c97b31a881545e734d4f97d73c7c75e8fc0727f288ef696d169bbaf989a0cb9f8d5c8e2f045b89c60f')

case "$CARCH" in
  i686)
    _vscode_arch=ia32
    _electron_arch=ia32
    ;;
  x86_64)
    _vscode_arch=x64
    _electron_arch=x64
    ;;
  armv7h)
    _vscode_arch=arm
    _electron_arch=armv7l
    ;;
  riscv64)
    _vscode_arch=riscv64
    _electron_arch=riscv64
    ;;
  *)
    # Needed for mksrcinfo
    _vscode_arch=DUMMY
    _electron_arch=DUMMY
    ;;
esac

# The default memory limit may be too low for current versions of node
# to successfully build vscode.  Set mem_limit=<value> on the makepkg
# command line if the default still doesn't work for your system.
if [ -z "$mem_limit" ]; then
    mem_limit=6144
fi

pkgver() {
    cd "${srcdir}/vscode"
    # People love to complain, so here's a complex version that still
    # increases monotonically by commit but also has the package.json
    # version instead of the most recent tag...
    printf "%s.r%s.g%s" \
        "$(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
  cd vscode

  _electronver=$(awk '{if ($1 == "target") {gsub(/"|\..*"/, "", $2); print $2}}' .yarnrc)
  if [[ "electron$_electronver" != "$_electron" ]]; then
    echo "Wrong electron dependency. Change _electron to $_electronver"
    exit 1
  fi

  # Change electron binary name to the target electron
  sed -e "s|name=electron|name=$_electron |" \
      -e '/PKGBUILD/d' \
      -i ../code-git.sh
  sed "1s|.*|#!/usr/lib/$_electron/electron|" -i ../code-git.js

  # This patch no longer contains proprietary modifications.
  # See https://github.com/Microsoft/vscode/issues/31168 for details.
  patch -p0 -i ../product_json.diff

  # Set the commit and build date
  sed -e "s/@COMMIT@/$(git rev-parse HEAD)/" -e "s/@DATE@/$(date -u -Is | sed 's/\+00:00/Z/')/" -i product.json

  # Build native modules for system electron
  local _target=$(</usr/lib/$_electron/version)
  sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc

  # Patch appdata and desktop file
  sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
          s|@@NAME_SHORT@@|Code - Git|g
          s|@@NAME_LONG@@|Code - Git|g
          s|@@NAME@@|code-git|g
          s|@@ICON@@|code-git|g
          s|@@EXEC@@|/usr/bin/code-git|g
          s|@@LICENSE@@|MIT|g
          s|@@URLPROTOCOL@@|vscode|g
          s|inode/directory;||' resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

  desktop-file-edit --set-key StartupWMClass --set-value code-git resources/linux/code.desktop

  cp resources/linux/{code,code-oss}-url-handler.desktop
  desktop-file-edit --set-key MimeType --set-value x-scheme-handler/code-git resources/linux/code-oss-url-handler.desktop

  # Add completions for code-git
  cp resources/completions/bash/code resources/completions/bash/code-oss
  cp resources/completions/zsh/_code resources/completions/zsh/_code-oss

  # Patch completions with correct names
  sed -i 's|@@APPNAME@@|code-git|g' resources/completions/{bash/code,zsh/_code}
  sed -i 's|@@APPNAME@@|code-oss|g' resources/completions/{bash/code-oss,zsh/_code-oss}

  patch -p1 -i "$srcdir/clipath.patch"

  # The build process wants a zipped electron, let's construct one from system electron and put it in cache.
  local _electron_ver=$(</usr/lib/$_electron/version)
  local _hash=$(echo -n "https://github.com/electron/electron/releases/download/v$_electron_ver" | sha256sum | cut -d ' ' -f 1)
  export XDG_CACHE_HOME="$srcdir" # Don't let our manually created electron zip appear in users' cache dir
  local _cache_dir="$XDG_CACHE_HOME/electron/$_hash"
  mkdir -p "$_cache_dir"
  local _electron_zip="electron-v$_electron_ver-linux-$_electron_arch.zip"
  cd "/usr/lib/$_electron" && zip -r "$_cache_dir/$_electron_zip" . && cd -
  echo "$(sha256sum "$_cache_dir/$_electron_zip" | cut -d " " -f 1) *$_electron_zip" > build/checksums/electron.txt

  # Fix bin path
  sed -i "s|return path.join(path.dirname(execPath), 'bin', \`\${product.applicationName}\`);|return '/usr/bin/code-git';|g
          s|return path.join(appRoot, 'scripts', 'code-cli.sh');|return '/usr/bin/code-git';|g" \
      src/vs/platform/environment/node/environmentService.ts
}

build() {
  cd vscode
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export XDG_CACHE_HOME="$srcdir"
  yarn install --arch=$_vscode_arch
  gulp --max_old_space_size=$mem_limit \
       --openssl-legacy-provider \
       vscode-linux-$_vscode_arch-min
}

package() {
  # Install resource files
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode VSCode-linux-$_vscode_arch/resources/app/* "$pkgdir"/usr/lib/$pkgname/
  chmod -R u=rwX,go=rX "$pkgdir"
  # Replace statically included binary with system copy
  ln -sf /usr/bin/rg "$pkgdir"/usr/lib/${pkgname}/node_modules.asar.unpacked/@vscode/ripgrep/bin/rg

  # Install binary
  install -Dm 755 ${pkgname}.sh "$pkgdir"/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.js "$pkgdir"/usr/lib/$pkgname/${pkgname}.js
  ln -sf code-oss "$pkgdir"/usr/bin/${pkgname}

  # Install appdata and desktop file
  install -Dm 644 vscode/resources/linux/code.appdata.xml "$pkgdir"/usr/share/metainfo/${pkgname}.appdata.xml
  install -Dm 644 vscode/resources/linux/code.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -Dm 644 vscode/resources/linux/code-url-handler.desktop "$pkgdir"/usr/share/applications/${pkgname}-url-handler.desktop
  install -Dm 644 vscode/resources/linux/code-oss-url-handler.desktop "$pkgdir"/usr/share/applications/code-oss-url-handler.desktop
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/resources/linux/code.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

  # Install bash and zsh completions
  install -Dm 644 vscode/resources/completions/bash/code "$pkgdir"/usr/share/bash-completion/completions/${pkgname}
  install -Dm 644 vscode/resources/completions/bash/code-oss "$pkgdir"/usr/share/bash-completion/completions/code-oss
  install -Dm 644 vscode/resources/completions/zsh/_code "$pkgdir"/usr/share/zsh/site-functions/_${pkgname}
  install -Dm 644 vscode/resources/completions/zsh/_code-oss "$pkgdir"/usr/share/zsh/site-functions/_code-oss

  # Install license files
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/ThirdPartyNotices.txt
}
