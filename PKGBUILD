# Me is just a random anon from the internet. I'm not related to prism in any way
# Contact about package issues tho. <bjoel2@i2pmail.org>

pkgname="prismlauncher-themes-git"
pkgver=2024.01.17_1705493046.r0.g5ee0921
pkgrel=1
pkgdesc="PrismLauncher themes from their official github"
arch=('any')
url="https://github.com/PrismLauncher/Themes"
license=('custom')
makedepends=('git')
optdepends=('prismlauncher')
source=("${pkgname}::git+https://github.com/PrismLauncher/Themes.git")
sha256sums=('SKIP')
install='themes.install'

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  rm -f _prism-theme-installer
  _genInstallScript
  cd "${pkgname}/themes"
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
for themeDir in *
do
  cp -rf "$themeDir" "${installPath}/"
done
echo done
EOF
}

package() {
  install --mode=755 -D "_prism-theme-installer" "${pkgdir}/usr/bin/_prism-theme-installer"
  cd "${pkgname}"
  install --mode=644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*
  mkdir "${pkgdir}/usr/share/prismlauncher-themes"
  cd themes
  for themeDir in *
  do
    cp -r "$themeDir" "${pkgdir}/usr/share/prismlauncher-themes/${themeDir}"
  done
}
