# Maintainer: Daniel Playfair Cal <daniel.playfair.cal gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

pkgname=code-wayland
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor, with ozone enabled for wayland support'
# Important: Remember to check https://github.com/microsoft/vscode/wiki/How-to-Contribute#prerequisites for target node version
# NodeJS versioning cheatsheet:
#   - dubnium: 10
#   - erbium: 12
#   - fermium: 14
# Important: Remember to check https://github.com/microsoft/vscode/blob/master/.yarnrc (choose correct tag) for target electron version
_electron=electron # 12
pkgver=1.55.2
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/vscode'
license=('MIT')
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('bash-completion: Bash completions'
            'zsh-completions: ZSH completitons'
            'x11-ssh-askpass: SSH authentication')
makedepends=('git' 'gulp' 'npm' 'python2' 'yarn' 'nodejs-lts-fermium')
provides=('vscode')
conflicts=('code')
source=("$pkgname::git+$url.git#tag=$pkgver"
        'code.js'
        'code.sh'
        '0001-patch-product.json-to-enable-all-extensions.patch'
	'0001-chore-bump-electron-12.0.2.patch'
	'0002-chore-bump-electron-12.0.3.patch'
	'0003-chore-bump-electron-12.0.4.patch')
sha512sums=('SKIP'
            '814c9554427183cd893a33cd2cbe91f6e0ea71921ef0717c86217b1d3058d265f9ff7a9ace3e7b76f122e60b7686475cf4d999e581a1845face3033afb9f745f'
            'aec825628bf1911731fbe79cf8cc4c1b61cbb956567e1d6616ff187668ad986324551d29a7ff7462b9d5a1f91d236dd0fea2c39ca36aeae88917c07303aaf2d2'
            'e97fb3793db67ee82d497a09b78d77107b5035676559973927c6011bd8fdf5c59557f69b32d621b1a8bd2887ca03b635fe82e6ec37e8d687c2802621aed8fc1e'
            '94f983b065339544a8ea7c07da29923b3d060f57a0bc8b14116c914060fc7722b9fdbe80e063e92261442cff44e37523908087d9f02abfca00da4b61b6952844'
            '8fff0a9488aae5962e035846e40d407bbddfbfed52008f8ac06327a01ddf34dd6c8539ceabf9d1843d6bc30f90e39be19105e5de763e12876956cd977deee00d'
            '99757b81ac590397904d45c7fb5de605c2101e6e4d8a42e6d5fcc974917c50bd9e3d26f6241b65d032e08ff840a7ec3b61fb505ac71d6d9a1d8eb738864c6917')

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
  cd $pkgname

  # Change electron binary name to the target electron
  sed -i "s|exec electron |exec $_electron |" ../code.sh

  # Make extensions and live share work
  patch -Np1 -i ../0001-patch-product.json-to-enable-all-extensions.patch

  patch -Np1 -i ../0001-chore-bump-electron-12.0.2.patch
  patch -Np1 -i ../0002-chore-bump-electron-12.0.3.patch
  patch -Np1 -i ../0003-chore-bump-electron-12.0.4.patch

  # Set the commit and build date
  local _commit=$(git rev-parse HEAD)
  local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
  sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" -i product.json

  # Build native modules for system electron
  local _target=$(</usr/lib/$_electron/version)
  sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc

  # Patch appdata and desktop file
  sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
          s|@@NAME_SHORT@@|Code|g
          s|@@NAME_LONG@@|Code - wayland|g
          s|@@NAME@@|code-wayland|g
          s|@@ICON@@|com.visualstudio.code.wayland|g
          s|@@EXEC@@|/usr/bin/code-wayland|g
          s|@@LICENSE@@|MIT|g
          s|@@URLPROTOCOL@@|vscode|g
          s|inode/directory;||' resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

  sed -i 's|MimeType=.*|MimeType=x-scheme-handler/code-wayland;|' resources/linux/code-url-handler.desktop

  # Add completitions for code-wayland
  cp resources/completions/bash/code resources/completions/bash/code-wayland
  cp resources/completions/zsh/_code resources/completions/zsh/_code-wayland

  # Patch completitions with correct names
  sed -i 's|@@APPNAME@@|code|g' resources/completions/{bash/code,zsh/_code}
  sed -i 's|@@APPNAME@@|code-wayland|g' resources/completions/{bash/code-wayland,zsh/_code-wayland}

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

  cd $pkgname

  yarn install --arch=$_vscode_arch

  # The default memory limit may be too low for current versions of node
  # to successfully build vscode. Change it if this number still doesn't
  # work for your system.
  mem_limit="--max_old_space_size=6144"

  if ! /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-$_vscode_arch-min
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
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode VSCode-linux-$_vscode_arch/resources/app/* "$pkgdir"/usr/lib/$pkgname/

  # Replace statically included binary with system copy
  ln -sf /usr/bin/rg "$pkgdir"/usr/lib/$pkgname/node_modules.asar.unpacked/vscode-ripgrep/bin/rg

  # Install binary
  install -Dm 755 code.sh "$pkgdir"/usr/bin/code-wayland
  install -Dm 755 code.js "$pkgdir"/usr/lib/$pkgname/code.js
  ln -sf /usr/bin/code-wayland "$pkgdir"/usr/bin/code

  # Install appdata and desktop file
  install -Dm 644 $pkgname/resources/linux/code.appdata.xml "$pkgdir"/usr/share/metainfo/code-wayland.appdata.xml
  install -Dm 644 $pkgname/resources/linux/code.desktop "$pkgdir"/usr/share/applications/code-wayland.desktop
  install -Dm 644 $pkgname/resources/linux/code-url-handler.desktop "$pkgdir"/usr/share/applications/code-wayland-url-handler.desktop
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/resources/linux/code.png "$pkgdir"/usr/share/pixmaps/com.visualstudio.code.wayland.png

  # Install bash and zsh completions
  install -Dm 644 $pkgname/resources/completions/bash/code "$pkgdir"/usr/share/bash-completion/completions/code
  install -Dm 644 $pkgname/resources/completions/bash/code-wayland "$pkgdir"/usr/share/bash-completion/completions/code-wayland
  install -Dm 644 $pkgname/resources/completions/zsh/_code "$pkgdir"/usr/share/zsh/site-functions/_code
  install -Dm 644 $pkgname/resources/completions/zsh/_code-wayland "$pkgdir"/usr/share/zsh/site-functions/_code-wayland

  # Install license files
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/ThirdPartyNotices.txt
}

