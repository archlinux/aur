# Me is just a random anon from the internet. I'm not related to prism in any way
# Contact about package issues tho. <bjoel2@i2pmail.org>

pkgname="prismlauncher-themes-git"
pkgver="2023.06.30_1688154246.r2.ge5851ce"
pkgrel=1
pkgdesc="PrismLauncher themes from their official github"
arch=('any')
url="https://github.com/PrismLauncher/Themes"
license=('custom')
makedepends=('zip' 'git')
optdepends=('prismlauncher')
source=("${pkgname}::git+https://github.com/PrismLauncher/Themes.git")
sha256sums=('SKIP')
install='themes.install'

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${pkgname}/themes"
  rm -f *.zip
  rm -f _prism-theme-installer
  for themeDir in *
  do
    zip -r "${themeDir}.zip" "$themeDir"
  done
  _genInstallScript
}

# dirty hack creating install script
_genInstallScript()
{
cat << 'EOF' >> _prism-theme-installer
#!/bin/bash
defaultPath="${HOME}/.local/share/PrismLauncher/themes"
read -p "Specify the directory where you want to install themes (default: ${defaultPath})"$'\n> ' installPath
installPath=${installPath:-$defaultPath}
cd /usr/share/prismlauncher-themes
for themeFile in *
do
  cp "$themeFile" "${installPath}/"
done
echo done
EOF
}

package() {
  cd "${pkgname}"
  install --mode=644 -vDt "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*
  cd themes
  for themeFile in *.zip
  do
    install --mode=644 -D "$themeFile" "${pkgdir}/usr/share/prismlauncher-themes/${themeFile}"
  done
  install --mode=755 -D "_prism-theme-installer" "${pkgdir}/usr/bin/_prism-theme-installer"
}
