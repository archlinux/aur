# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=ego
pkgver=1.1.0
pkgrel=2
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/intgr/$pkgname/archive/$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download"
        "ego.sysusers"
        "ego.sudoers"
        "ego.rules")
sha512sums=('19fcec3766382a62b35d07590da513955dbbb85678b56d85e932addd47f9ae433054bd61f77f594cfbcf5d541b51c50e6becdda6088f5ecd6c68d6fe9d8eac28'
            '070f1e202f8ec3d46bb248855485a918fe7fd3671033a89628fad3d788dcd656f453373942a9e5adc2856484fe776434d0a333ee534b65399ee1225aae610ee6'
            'e89f7f63c680be625fa8b138de3bd9307536173e9690c00c086a1e3cc2948764137c2ea22e29b37d33ae13bcdf4e67190462a5942d913521652ff3b33a9f49c3'
            'ed8df913a45f0e5029fdd9370fc6124eb5b7a617ef62fb616b9f13aecb47a54f92751de6ccac03034afbdd1e3f33ad11847a34e1f78b9481b8225f881ad5d69b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --root "$pkgdir/usr/" --path .
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"

  install -Dm644 "$srcdir/ego.sysusers" "$pkgdir/usr/lib/sysusers.d/ego.conf"
  install -dm750 "$pkgdir/etc/sudoers.d"
  install -Dm644 "$srcdir/ego.sudoers" "$pkgdir/etc/sudoers.d/50-ego.conf"
  install -dm750 "$pkgdir/etc/polkit-1/rules.d"
  install -Dm644 "$srcdir/ego.rules" "$pkgdir/etc/polkit-1/rules.d/50-ego.rules"

  install -Dm644 "varia/ego-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ego"
  install -Dm644 "varia/ego-completion.bash"  "$pkgdir/usr/share/bash-completion/completions/ego"
  install -Dm644 "varia/ego-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ego.fish"
}
