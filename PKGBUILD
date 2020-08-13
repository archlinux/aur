# Maintainer: Arley Henostroza <arllk10[at]gmail[dot]com>

pkgname=genie-systemd-git
_pkgname=genie
pkgver=1.27.r5.gfd49285
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL (development version)"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime>=3.1' 'dotnet-host>=3.1' 'inetutils')
makedepends=('dotnet-sdk>=3.1')
conflicts=('genie-systemd')
provides=('genie-systemd')
source=('git+https://github.com/arkane-systems/genie.git'
        'LICENSE')
sha256sums=('SKIP'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/$_pkgname"
}

build() {
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  cd "$srcdir/$_pkgname/$_pkgname"
  export DESTDIR=$pkgdir
  ls -alh
  make build
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname"
  make install
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p ${pkgdir}/usr/bin
  chmod +x ${pkgdir}/usr/libexec/genie
  ln -s /usr/libexec/genie/main/genie ${pkgdir}/usr/bin/genie
}
