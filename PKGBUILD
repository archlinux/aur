# Stoica Tedy <stoicatedy@gmail.com>
_pkgname=tpm-fido
pkgname=$_pkgname-git

pkgver=r20.2ac4b1d
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
md5sums=('SKIP' '3a45c015af2f681c2d5820f034826ec9' 'b1771a999727fe7c29395f406fe7a7e3' 'bb2e749c3da23a02ed3e63d65f09b309' 'c3df90046656d8f1eea5d6eeee430054')

source=('git+https://github.com/psanford/tpm-fido.git' '99-tpm-fido.rules' 'tpm-fido.service' 'tpm-fido.sysusers' 'uhid.conf')

build() {
    cd $srcdir/$_pkgname
    go build
}

package() {
    install -Dm644 "99-tpm-fido.rules" "$pkgdir/etc/udev/rules.d/99-tpm-fido.rules"
    install -Dm644 "tpm-fido.service" "$pkgdir/usr/lib/systemd/user/tpm-fido.service"
    install -Dm755 "$srcdir/$_pkgname/tpm-fido" "$pkgdir/usr/bin/tpm-fido"
    install -Dm644 "tpm-fido.sysusers" "$pkgdir/usr/lib/sysusers.d/tpm-fido.conf"
    install -Dm644 "uhid.conf" "$pkgdir/etc/modules-load.d/uhid.conf"
}

post_install() {
    udevadm control --reload-rules
    udevadm trigger
}
