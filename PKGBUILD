# Maintainer: Greg Brown <greg.brown.00 at outlook dot com>
pkgname=dracut-sshd-git
pkgver=r61.69830bd
pkgrel=1
pkgdesc="Provide SSH access to initramfs."
arch=(any)
url="https://github.com/gsauthof/dracut-sshd"
license=(GPL3)
groups=()
depends=(dracut openssh)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/gsauthof/dracut-sshd.git'
        'module-setup.sh.patch')
noextract=()
md5sums=('SKIP'
         '5f0ee3c69032b6ba1024a0ffebf0a2b6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Arch's openssh package does not have support for Type=Notify
  sed -e 's/^Type=notify/Type=simple/' \
      -e 's@^\(ExecStart=/usr/sbin/sshd\) -D@\1 -e -D@' \
      -i \
      "./46sshd/sshd.service"

  patch --forward --strip=1 --input="$srcdir/module-setup.sh.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  target="$pkgdir/usr/lib/dracut/modules.d/46sshd"
  install -Dt "$target" -m 0755 46sshd/module-setup.sh
  install -Dt "$target" -m 0644 46sshd/sshd.service
  install -Dt "$target" -m 0644 46sshd/sshd_config
}
