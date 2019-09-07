# Maintainer: Arley Henostroza <arllk[at]gmail[dot]com>

pkgname=genie-systemd-git
_pkgname=genie
pkgver=1.10.r0.g4dbb9f4
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL (development version)"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime' 'dotnet-host' 'hostess')
makedepends=('dotnet-sdk')
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
  #Remove Debian package build
  #patch -Np1 -i "${srcdir}/build_for_arch.patch"
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  dotnet publish -r linux-x64 --self-contained false
  #TODO: test./build
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname"
  install -Dm 4755 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/genie" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/genie.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/System.CommandLine.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/Tmds.LibC.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname/bin/Debug/netcoreapp2.2/linux-x64/publish/genie.runtimeconfig.json" -t "$pkgdir/usr/bin"
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
