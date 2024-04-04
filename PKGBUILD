# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=mail4one
pkgver=1.1
pkgrel=2
pkgdesc="Personal Mail Server"
arch=('any')
url='https://github.com/mail4one/mail4one'
depends=('python')
makedepends=('git' 'python-pip')
license=('GPL3')
source=("git+https://gitea.balki.me/balki/mail4one.git#tag=v$pkgver")
sha256sums=('51bf373725f16a79b08efa190711b57d0c74c4bf2eeb725b780484fca006d851')
install="$pkgname.install"

build() {
		cd "$pkgname"
		make build
}

check() {
		cd "$pkgname"
		PYTHONPATH=mail4one.pyz python3 -m unittest discover
}

package() {
		cd "$pkgname"
		install -Dm755 mail4one.pyz "$pkgdir/usr/bin/mail4one"
		sed '/ExecStart/s/local.bin/bin/' deploy_configs/mail4one.service | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/mail4one.service"
		install -Dm644 deploy_configs/mail4one.conf -t "$pkgdir/usr/lib/sysusers.d"
		install -Dm644 README.md deploy_configs/mail4one_cert_copy.sh deploy_configs/config.sample -t "$pkgdir/usr/share/doc/$pkgname"
		install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
