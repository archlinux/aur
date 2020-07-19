# Maintainer: Arley Henostroza <arllk10[at]gmail[dot]com>

pkgname=genie-systemd-git
_pkgname=genie
pkgver=1.24.r3.g02a262a
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
  dotnet publish -c Release -r linux-x64 --self-contained false
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname"
  install -Dm 4755 -o root "bin/Release/netcoreapp3.1/linux-x64/publish/genie" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Release/netcoreapp3.1/linux-x64/publish/genie.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Release/netcoreapp3.1/linux-x64/publish/Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Release/netcoreapp3.1/linux-x64/publish/System.CommandLine.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Release/netcoreapp3.1/linux-x64/publish/Tmds.LibC.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Release/netcoreapp3.1/linux-x64/publish/genie.runtimeconfig.json" -t "$pkgdir/usr/bin"
  install -Dm 755 -o root "$srcdir/$_pkgname/systemd-genie/usr/lib/genie/dumpwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "$srcdir/$_pkgname/systemd-genie/usr/lib/genie/readwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "$srcdir/$_pkgname/systemd-genie/usr/lib/genie/runinwsl.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "$srcdir/$_pkgname/systemd-genie/usr/lib/systemd/system-environment-generators/10-genie-envar.sh" -t "$pkgdir/usr/lib/systemd/system-environment-generators"
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
