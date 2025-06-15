# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=justdd
pkgver=0.1.4
pkgrel=1
pkgdesc="JustDD - Simple graphical USB image writer for Linux and Windows ISOs"
arch=('any')
url="https://github.com/xxanqw/justdd"
license=('GPL3')
depends=('ntfs-3g' 'dosfstools' 'rsync' 'polkit' 'libcdio' 'ms-sys')
makedepends=('git' 'python' 'python-uv')
source=("$pkgname::git+$url.git")
conflicts=("$pkgname-bin")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "$srcdir/$pkgname"
    uv venv
    source ./.venv/bin/activate
    uv sync --all-extras
    uv run pyinstaller --onefile --add-data "images/icon.png:images" --name justdd app.py && mv dist/justdd ./
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 justdd "$pkgdir/usr/bin/justdd"
    install -Dm644 "images/icon.png" "$pkgdir/usr/share/pixmaps/justdd.png"
    
    # Create and install a desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/justdd.desktop" << EOF
[Desktop Entry]
Name=JustDD
Comment=USB Image Writer for Linux and Windows ISOs
Exec=justdd
Icon=justdd
Terminal=false
Type=Application
Categories=Utility;System;
EOF
}

post_install() {
    echo -e "\e[31m----------------------------------------------------------------------\e[0m"
    echo -e "\e[31mNOTE: JustDD uses polkit for privilege escalation.\e[0m"
    echo -e "\e[31mIf polkit is not enabled by default in your distribution, you may\e[0m"
    echo -e "\e[31mneed to start and enable the polkit service (polkit.service).\e[0m"
    echo -e "\e[31mFor example, with systemd, you can do this by running:\e[0m"
    echo -e "\e[31m  sudo systemctl enable --now polkit.service\e[0m"
    echo -e "\e[31m----------------------------------------------------------------------\e[0m"
}

post_upgrade() {
    post_install
}
