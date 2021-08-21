# Stoica Tedy <stoicatedy@gmail.com>
_pkgname=tpm-fido
pkgname=$_pkgname-git

pkgver=r19.80e50c7
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1
pkgdesc="A WebAuthn/U2F token protected by a TPM (Go/Linux)"
url="https://github.com/psanford/tpm-fido"
arch=('any')
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('tpm-fido')
provides=('tpm-fido')
md5sums=('SKIP' '3a45c015af2f681c2d5820f034826ec9' '12769495a5f3bcb251f85f5d2d8aafe8' 'bb2e749c3da23a02ed3e63d65f09b309')

source=('git+https://github.com/psanford/tpm-fido.git' '99-tpm-fido.rules' 'tpm-fido.service' 'tpm-fido.sysusers')

build() {
    cd $srcdir/$_pkgname
    go build
}

package() {
    install -Dm644 "99-tpm-fido.rules" "$pkgdir/etc/udev/rules.d/99-tpm-fido.rules"
    install -Dm644 "tpm-fido.service" "$pkgdir/usr/lib/systemd/user/tpm-fido.service"
    install -Dm755 "$srcdir/$_pkgname/tpm-fido" "$pkgdir/usr/bin/tpm-fido"
    install -Dm644 "tpm-fido.sysusers" "$pkgdir/usr/lib/sysusers.d/tpm-fido.conf"
}

post_install() {
    udevadm control --reload-rules
    udevadm trigger
}
