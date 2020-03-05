# Maintainer: Yamada Hayao <shun819.mail@gmail.com>
pkgname=eg-installer
pkgver=1.10
pkgrel=1
pkgdesc="zenityとbashで書かれた項目の追加が簡単なパッケージインストーラー"
arch=('any')
url=https://github.com/Hayao0819/EG-Installer
license=('MIT')
depends=('zenity' 'bash' 'pacman')
optdepends=()
source=("https://github.com/Hayao0819/EG-Installer/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')
conflicts=('eg-installer-git')

build () {
cd "EG-Installer-$pkgver"
mv * ..
cd ..
rm -rf EG-Installer-$pkgver/
rm -f README.md
rm -f .gitignore
rm -f LICENSE
rm -f config

sed -i -e s/'$(cd $(dirname $0) && pwd)\/config'/'\/etc\/eg-installer\/config'/ eg-installer

cat >> config << 'EOF'
#!/usr/bin/env bash

window_text="EG-Installer v.${version}"
window_icon="/usr/share/pixmaps/archlinux.png"
pacman="/etc/eg-installer/pacapt"
script_dir="/etc/eg-installer/softwares"
installed_list () { pacman -Q | awk '{print $1}'; }
EOF

mkdir -p ./usr/bin/
mv eg-installer ./usr/bin/

mkdir -p ./etc/eg-installer/
mv config ./etc/eg-installer/
mv pacapt ./etc/eg-installer/
mv softwares ./etc/eg-installer/


}
package() {
    mkdir -p "$pkgdir"
    rm *.tar.gz
    cp -r * "$pkgdir"
}

