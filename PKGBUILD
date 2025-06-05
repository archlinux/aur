# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=justdd-bin
_realname=justdd
pkgver=0.1.3
pkgrel=1
pkgdesc="JustDD - Simple graphical USB image writer for Linux and Windows ISOs (pre-built binary)"
arch=('any')
url="https://github.com/xxanqw/justdd"
license=('GPL3')
depends=('ntfs-3g' 'dosfstools' 'rsync' 'polkit')
makedepends=('jq')
provides=("${_realname}")
conflicts=("${_realname}")
options=('!strip')

source=("$_realname-$pkgver-$pkgrel-$arch.pkg.tar.zst::$url/releases/download/v$pkgver-$pkgrel/$_realname-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('SKIP')

pkgver() {
  curl -s "https://api.github.com/repos/xxanqw/justdd/releases/latest" | \
    jq -r '.tag_name' | sed 's/^v//'
}

build() {
    cd "$srcdir"
    echo "Using pre-built binary, skipping build."
}

package() {
    tar -xvf "$srcdir/$_realname-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir/"
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
