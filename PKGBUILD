# Maintainer: Jeremy Kescher <jeremy@kescher.at>
pkgname=hellpot
_targetname=hellpot
pkgver=0.4.1
pkgrel=1
_srcname=HellPot-$pkgver
pkgdesc="An endless honeypot that sends bots to hell."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yunginnanet/HellPot"
license=('MIT')
makedepends=('go')
provides=('hellpot')
conflicts=('hellpot')
source=(
    "$_srcname.tar.gz::https://codeload.github.com/yunginnanet/HellPot/tar.gz/refs/tags/v$pkgver"
    "service"
    "tmpfiles"
    "sysusers"
    "config.toml"
)
backup=('etc/hellpot/config.toml')
sha256sums=('614b92c7a55b06083287adb752b0e5dfd93361a0c9e2927a6c2de67e917cfac8'
            '0136fd65b73e678d12ddff09cd5f71bfea360787cf7955770fe95b64dabe8274'
            'a370bd1f4f1caa1aa4777e3a6cb6c752f711721c9913e09c78a11d304bc53b37'
            'd462d4a84021cb2ce0052ba6c46ad0ea6e7aab7a9459d048de892d8503a99aee'
            '5663856679a38a69572683f9720c4a20aeaf3eb6a26f5ca067e23d4fcc2b28ac')

build() {
  cd "$srcdir/$_srcname"
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" -o $_targetname ./cmd/HellPot
}

package() {
  cd "$srcdir"
  install -Dm755 $_srcname/$_targetname "${pkgdir}"/usr/bin/$_targetname
  install -Dm644 config.toml "${pkgdir}"/etc/$_targetname/config.toml
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/$_targetname.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_targetname.conf
  install -Dm644 sysusers "${pkgdir}"/usr/lib/sysusers.d/$_targetname.conf
}
