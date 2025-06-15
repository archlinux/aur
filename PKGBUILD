# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=justdd-bin
_realname=justdd
pkgver=0.1.4
pkgrel=1
pkgdesc="JustDD - Simple graphical USB image writer for Linux and Windows ISOs (pre-built binary)"
arch=('any')
url="https://github.com/xxanqw/justdd"
license=('GPL3')
depends=('ntfs-3g' 'dosfstools' 'rsync' 'polkit' 'libcdio' 'ms-sys')
makedepends=('jq') # jq is needed to parse the GitHub API response
provides=("${_realname}")
conflicts=("${_realname}")
options=('!strip')

source=("$_realname-$pkgver-$pkgrel-$arch.pkg.tar.zst::$url/releases/download/v$pkgver-$pkgrel/$_realname-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('d2aa0cb81a230ee5a33a40641496e7e55644ac8e82e9c7a6b17315bb0e416f0d')

pkgver() {
  curl -s "https://api.github.com/repos/xxanqw/justdd/releases/latest" | \
    jq -r '.tag_name' | sed -e 's/^v//' -e 's/-.*//'
}

build() {
    cd "$srcdir"
    echo "Using pre-built binary, skipping build."
}

package() {
    tar -xvf "$srcdir/$_realname-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir/" usr
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
