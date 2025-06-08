# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=justdd-bin
_realname=justdd
pkgver=0.1.3
pkgrel=2
pkgdesc="JustDD - Simple graphical USB image writer for Linux and Windows ISOs (pre-built binary)"
arch=('any')
url="https://github.com/xxanqw/justdd"
license=('GPL3')
depends=('ntfs-3g' 'dosfstools' 'rsync' 'polkit')
makedepends=('jq') # jq is needed to parse the GitHub API response
provides=("${_realname}")
conflicts=("${_realname}")
options=('!strip')

source=("$_realname-$pkgver-$pkgrel-$arch.pkg.tar.zst::$url/releases/download/v$pkgver-$pkgrel/$_realname-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('8a961a2ec21af2f5b8091e86c5e4ef53a0a1baf08f3cc31a34adc50603c728d0')

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
