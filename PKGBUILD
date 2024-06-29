# Maintainer in the AUR: Stoica Tedy <stoicatedy@gmail.com>

_pkgname=tpm-fido
pkgname=$_pkgname-git

pkgver=r24.5f8828b
pkgrel=2
pkgdesc='A WebAuthn/U2F token protected by a TPM'
url=https://github.com/psanford/tpm-fido
arch=(x86_64)
license=(MIT)
depends=(pinentry)
makedepends=(git go)
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('SKIP'
            'aa1eddbcafa0194f7cab99476fb469b86bdfe857f412321c1252d35cb3dc230e'
            '61e6f255db3d77274e6140ca21f2094e676f56b9f26b3a834bc8077ed0f95046'
            '0d86f64d63d23a1e54ce044eca582014b105639201199b9728a95b179f727eff'
            'aac63f22d92cbb3fd61ea1c654713c4bf255d32ec43ff7ccd04411c812b36f62')

source=('git+https://github.com/psanford/tpm-fido.git'
        '99-tpm-fido.rules'
        'tpm-fido.service'
        'tpm-fido.sysusers'
        'uhid.conf')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  go build
}

package() {
  install -Dm644 "99-$_pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/99-$_pkgname.rules"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "uhid.conf" "$pkgdir/usr/lib/modules-load.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  udevadm control --reload-rules
  udevadm trigger
}
