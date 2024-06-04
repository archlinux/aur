# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Ashley Hauck <khyperia@live.com>

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=roslyn-git
_pkgname=roslyn
pkgver=VSCode.CSharp.2.26.13.r2.g859d33a
pkgrel=1
pkgdesc="Microsoft's C# compiler and compiler libraries (Git version)"
arch=(x86_64)
license=(MIT)
url="https://github.com/dotnet/roslyn"
depends=('dotnet-sdk-preview-bin' 'zlib')
install="roslyn.install"
makedepends=('git')
provides=('roslyn')
conflicts=('roslyn')
options=(staticlibs)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"/${_pkgname}

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    echo "Building csc"
    dotnet publish src/Compilers/CSharp/csc/AnyCpu -o $PWD/Binaries/csc -p:SelfContained=true -p:UseAppHost=true -r linux-x64 -c Release /v:m
}

package() {
    cd "${srcdir}"/${_pkgname}

    mkdir -p "${pkgdir}/usr/lib/roslyn"
    cp -ar Binaries/csc/* "${pkgdir}/usr/lib/roslyn"
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/lib/roslyn/csc" "${pkgdir}/usr/bin/csc"
}
