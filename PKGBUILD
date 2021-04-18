# Maintainer: Yifan Xu <jamesxu182@gamil.com>

pkgname=visual-studio-code-wayland
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor with electron 12 (wayland native support)'
# Important: Remember to check https://github.com/microsoft/vscode/wiki/How-to-Contribute#prerequisites for target node version
# NodeJS versioning cheatsheet:
#   - carbon: 8
#   - dubnium: 10
#   - ?: 11 (not in repos)
#   - erbium: 12
# Important: Remember to check https://github.com/microsoft/vscode/blob/master/.yarnrc (choose correct tag) for target electron version
_electron=electron12
_pkgname=vscode
pkgver=1.55.2
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/vscode'
license=('MIT')
depends=('electron12-bin' 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('bash-completion: Bash completions'
            'zsh-completions: ZSH completitons'
            'x11-ssh-askpass: SSH authentication')
makedepends=('git' 'gulp' 'npm' 'python2' 'yarn' 'nodejs-lts-dubnium')
provides=('code')
conflicts=('code')
source=("https://codeload.github.com/microsoft/${_pkgname}/tar.gz/$pkgver"
        'code.js'
        'code.sh'
        'product_json.diff')
sha512sums=('90ce4f57a511ca79b7b28bbe5167187e0263170c545face79a5fd2d34fe5523b0c3d63bc74195eef73f8cf27704dfa0a2f257900a7796f08527a23790350f702'
            '814c9554427183cd893a33cd2cbe91f6e0ea71921ef0717c86217b1d3058d265f9ff7a9ace3e7b76f122e60b7686475cf4d999e581a1845face3033afb9f745f'
            '2e8b787480fef7d9363bc0f385cd68f448d51e2f3d9e6c6f273454e085911f613608a13227bb005983adaf13881da99bc1700af887bdb6d52fa4e419584f14a0'
            'b1aa0d7c5b3e3e8ba1172822d75ea38e90efc431b270e0b4ca9e45bf9c0be0f60922c8618969ef071b5b6dbd9ac9f030294f1bf49bcc28c187b46d113dca63a7')

# Even though we don't officially support other archs, let's
# allow the user to use this PKGBUILD to compile the package
# for his architecture

case "$CARCH" in
  i686)
    _vscode_arch=ia32
    ;;
  x86_64)
    _vscode_arch=x64
    ;;
  armv7h)
    _vscode_arch=arm
    ;;
  *)
    # Needed for mksrcinfo
    _vscode_arch=DUMMY
    ;;
esac

prepare() {
  cd $_pkgname-$pkgver

  # Change electron binary name to the target electron
  sed -i "s|exec electron |exec $_electron |" ../code.sh

  # This patch no longer contains proprietary modifications.
  # See https://github.com/Microsoft/vscode/issues/31168 for details.
  patch -p0 < ../product_json.diff

  # Set the commit and build date
  local _commit=$(git rev-parse HEAD)
  local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
  sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" -i product.json

  # Build native modules for system electron
  local _target=$(</usr/lib/$_electron/version)
  local _origin=$(grep -Po "\"electron\": \"\K[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,3}(?=\")" package.json)
  sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc
  sed -i "s/\"version\": \"${_origin}\"/\"version\": \"${_target}\"/" cgmanifest.json
  sed -i "s/\"electron\": \"${_origin}\"/\"electron\": \"${_origin}\"/" package.json
  sed -i "s/\"--version\": \"${_origin}\"/\"--version\": \"${_origin}\"/" package.json
  # sed -i "/medialCapitalAsWordStart: options.medialCapitalAsWordStart/d" src/vs/workbench/contrib/webview/electron-browser/webviewElement.ts
  # sed -i "s/matchCase: options.matchCase,/matchCase: options.matchCase/" src/vs/workbench/contrib/webview/electron-browser/webviewElement.ts

  # Patch appdata and desktop file
  sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
          s|@@NAME_SHORT@@|Code|g
          s|@@NAME_LONG@@|Code - OSS|g
          s|@@NAME@@|code-oss|g
          s|@@ICON@@|com.visualstudio.code.oss|g
          s|@@EXEC@@|/usr/bin/code-oss|g
          s|@@LICENSE@@|MIT|g
          s|@@URLPROTOCOL@@|vscode|g
          s|inode/directory;||' resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

 sed -i 's|MimeType=.*|MimeType=x-scheme-handler/code-oss;|' resources/linux/code-url-handler.desktop

  # Add completitions for code-oss
  cp resources/completions/bash/code resources/completions/bash/code-oss
  cp resources/completions/zsh/_code resources/completions/zsh/_code-oss

  # Patch completitions with correct names
  sed -i 's|@@APPNAME@@|code|g' resources/completions/{bash/code,zsh/_code}
  sed -i 's|@@APPNAME@@|code-oss|g' resources/completions/{bash/code-oss,zsh/_code-oss}

  # Fix bin path
  sed -i "s|return path.join(path.dirname(execPath), 'bin', \`\${product.applicationName}\`);|return '/usr/bin/code';|g
          s|return path.join(appRoot, 'scripts', 'code-cli.sh');|return '/usr/bin/code';|g" \
          src/vs/platform/environment/node/environmentService.ts
}

build() {
  # https://github.com/mapbox/node-sqlite3/issues/1044
  mkdir -p path
  ln -sf /usr/bin/python2 path/python
  export PATH="$PWD/path:$PATH"

  cd $_pkgname-$pkgver

  yarn install --arch=x64

  # The default memory limit may be too low for current versions of node
  # to successfully build vscode. Change it if this number still doesn't
  # work for your system.
  mem_limit="--max_old_space_size=6144"

  if ! /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-x64-min
  then
      echo
      echo "*** NOTE: If the build failed due to running out of file handles (EMFILE),"
      echo "*** you will need to raise your max open file limit."
      echo "*** You can check this for more information on how to increase this limit:"
      echo "***    https://ro-che.info/articles/2017-03-26-increase-open-files-limit"
      exit 1
  fi
}

package() {
  # Install resource files
  install -dm 755 "$pkgdir"/usr/lib/$_pkgname
  cp -r --no-preserve=ownership --preserve=mode VSCode-linux-$_vscode_arch/resources/app/* "$pkgdir"/usr/lib/$_pkgname/

  # Replace statically included binary with system copy
  mkdir -p "$pkgdir"/usr/lib/code/node_modules.asar.unpacked/vscode-ripgrep/bin/
  ln -sf /usr/bin/rg "$pkgdir"/usr/lib/code/node_modules.asar.unpacked/vscode-ripgrep/bin/rg

  # Install binary
  install -Dm 755 code.sh "$pkgdir"/usr/bin/code-oss
  install -Dm 755 code.js "$pkgdir"/usr/lib/$_pkgname/code.js
  ln -sf /usr/bin/code-oss "$pkgdir"/usr/bin/code

  # Install appdata and desktop file
  install -Dm 644 $_pkgname-$pkgver/resources/linux/code.appdata.xml "$pkgdir"/usr/share/metainfo/code-oss.appdata.xml
  install -Dm 644 $_pkgname-$pkgver/resources/linux/code.desktop "$pkgdir"/usr/share/applications/code-oss.desktop
  install -Dm 644 $_pkgname-$pkgver/resources/linux/code-url-handler.desktop "$pkgdir"/usr/share/applications/code-oss-url-handler.desktop
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/resources/linux/code.png "$pkgdir"/usr/share/pixmaps/com.visualstudio.code.oss.png

  # Install bash and zsh completions
  install -Dm 644 $_pkgname-$pkgver/resources/completions/bash/code "$pkgdir"/usr/share/bash-completion/completions/code
  install -Dm 644 $_pkgname-$pkgver/resources/completions/bash/code-oss "$pkgdir"/usr/share/bash-completion/completions/code-oss
  install -Dm 644 $_pkgname-$pkgver/resources/completions/zsh/_code "$pkgdir"/usr/share/zsh/site-functions/_code
  install -Dm 644 $_pkgname-$pkgver/resources/completions/zsh/_code-oss "$pkgdir"/usr/share/zsh/site-functions/_code-oss

  # Install license files
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/$_pkgname/ThirdPartyNotices.txt
}

