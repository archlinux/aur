# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgname=smartdns-webui-git
pkgver=1.0.0.r3.g1c06fee
pkgrel=1
pkgdesc="Dashboard UI plugin assets for smartdns"
arch=('any')
license=('MIT')
url="https://github.com/pymumu/smartdns-webui"
makedepends=('git' 'npm')
source=("git+https://github.com/pymumu/smartdns-webui.git")
sha512sums=('SKIP')
provides=('smartdns-webui')
conflicts=('smartdns-webui')

pkgver()
{
    cd "$srcdir/${pkgname%*-git}"
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd smartdns-webui
  npm ci --allow-remote all --ignore-scripts
}

build() {
  cd smartdns-webui
  npm run build
}

package() {
	cd smartdns-webui
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/smartdns-webui-git/LICENSE"

	cd out
	find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/smartdns/wwwroot/{}" \;
}
