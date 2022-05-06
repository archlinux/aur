# Maintainer: Valters Tomsons <valters.tomsons at protonmail dot com>

pkgname="dsbattery"
pkgver=1.3.1
pkgrel=2
pkgdesc="DualShock 4 controller utility for status bars"
arch=('x86_64' 'aarch64')
url='https://github.com/valters-tomsons/dsbattery'
license=('MIT')

makedepends=('dotnet-sdk>=6.0.0')
optdepends=('bluez-tools: disconnect support')

options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/valters-tomsons/dsbattery/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('61a28fb1aea059fe99a3228b9511aec08599cdac991c10cec352c1930e5e2cea')

_outputdir="Release"

build() {
    cd "$pkgname-$pkgver"

    # Determine RID for build
    case $CARCH in "aarch64") RID=arm64 ;;
    "x86_64") RID=x64 ;;
    esac

    dotnet publish -c Release --self-contained -r linux-"${RID}" -o="${_outputdir}"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/${_outputdir}/$pkgname" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
