# Maintainer: Ashley Hauck <khyperia@live.com>

pkgname=roslyn-git
_pkgname=roslyn
pkgver=0.0.0.ab843e50ad
pkgrel=1
pkgdesc="Microsoft's C# compiler and compiler libraries"
arch=(x86_64)
license=(Apache)
url="https://github.com/dotnet/roslyn"
depends=('dotnet-sdk-2.0')
install="roslyn.install"
makedepends=('git')
provides=('roslyn')
conflicts=('roslyn')
options=(staticlibs)
source=(git://github.com/dotnet/roslyn)
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo -n "0.0.0."
    git show HEAD --format=%h
}

build() {
    cd "${srcdir}"/${_pkgname}

    echo "Restoring BaseToolset.csproj"
    dotnet restore build/ToolsetPackages/BaseToolset.csproj
    echo "Building csc"
    dotnet publish src/Compilers/CSharp/csc -o $PWD/Binaries/csc -p:SelfContained=true -f netcoreapp2.0 -r linux-x64 -c Release /v:m
}

package() {
    cd "${srcdir}"/${_pkgname}

    install -Dt "${pkgdir}/usr/share/roslyn" Binaries/csc/*
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/roslyn/License.txt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/usr/share/roslyn/csc" "${pkgdir}/usr/bin/csc"
}
