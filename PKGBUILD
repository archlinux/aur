# Maintainer: Jeremy Kescher <jeremy@kescher.at>
pkgname=hellpot-git
_srcname=HellPot
_targetname=hellpot
pkgver=0.1.r5.g97fe39b
pkgrel=1
pkgdesc="An endless honeypot that sends bots to hell."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yunginnanet/HellPot"
license=('MIT')
makedepends=(
  'go'
  'git'
)
provides=('hellpot')
conflicts=('hellpot')
source=(
    "$_srcname::git+https://github.com/yunginnanet/HellPot.git"
    "service"
    "tmpfiles"
    "sysusers"
    "config.patch"
)
backup=('etc/hellpot/config.toml')
sha256sums=('SKIP'
            '0136fd65b73e678d12ddff09cd5f71bfea360787cf7955770fe95b64dabe8274'
            'faa5d114cd5457075bc6e0a329425814617f4d832d557e19de13a06d3252ca09'
            'd462d4a84021cb2ce0052ba6c46ad0ea6e7aab7a9459d048de892d8503a99aee'
            'b76d5c946ade6b4de649580f26a0ee885284b44bf555bf6bfa386fef957e8934')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -i config.patch $_srcname/config.toml	
}

build() {
  cd "$srcdir/$_srcname"
  go build -gcflags "all=-trimpath=$PWD" -ldflags="-s -w" -o $_targetname
}

package() {
  cd "$srcdir"
  install -Dm755 $_srcname/$_targetname "${pkgdir}"/usr/bin/$_targetname
  install -Dm644 $_srcname/config.toml "${pkgdir}"/etc/$_targetname/config.toml
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/$_targetname.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_targetname.conf
  install -Dm644 sysusers "${pkgdir}"/usr/lib/sysusers.d/$_targetname.conf
}
