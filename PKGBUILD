# Maintainer: xhyinne <xhyi AT gmx DOT us>

pkgname=niacop-git
pkgver=0.5.10.r3.gf6d44c7
pkgrel=3
pkgdesc="Cross platform self-tracker tool"
arch=('x86_64')
url="https://github.com/xdrie/niacop"
license=('GPL3')
depends=('xprintidle' 'xorg-xprop' 'xdotool' 'xorg-xinput' 'xorg-xmodmap')
makedepends=('git' 'dotnet-sdk>=5.0.1.sdk101')
optdepends=()
source=("$pkgname::git+https://github.com/xdrie/niacop.git")
sha256sums=('SKIP')

_basename=${pkgname%-git}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    rm -rf compiled
    env DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish src/niacop/Nia/Nia.csproj \
      --configuration Release \
      --runtime $(dotnet --info | grep 'RID' | cut -d ':' -f 2 | tr -d '[:space:]') \
      /p:UseCoreRT=1 \
      --output compiled
}

package() {
    # copy built stuff
    cd "$srcdir/$pkgname/compiled"
    find . -type f -exec \
      install -Dm755 "{}" "$pkgdir/opt/${_basename}/{}" \;

    # link main binary
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${_basename}/niacop" "$pkgdir/usr/bin/${_basename}"
}
