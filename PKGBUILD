# Maintainer: w0rty <mawo97 at gmail.com>

_gitname=VmChamp
pkgname=vmchamp-git
pkgver=v0.0.1.r4.ge37e9ef
pkgrel=1
pkgdesc="Simple and fast creation of throwaway VMs on your local machine."
arch=('x86_64')
license=('custom')
url='https://github.com/wubbl0rz/VmChamp'

#depends=()
makedepends=("git" "dotnet-sdk-preview-bin")

source=(
    "git+${url}"
)

sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    output="./${_gitname}/bin/Release/linux-x64"
    cd "${_gitname}"
    version=$(git describe --abbrev=0 --tags)

    dotnet publish          .                           \
        --configuration     Release                     \
        --runtime           linux-x64                   \
        --output            $output                     \
        --self-contained=true                           \
        /p:PublishAot=true                              \
        /p:StripSymbols=true                            \
        /property:Version=${version:1}
}

package()
{
    mkdir -p "$pkgdir/opt/${_gitname}"
    cd "$srcdir/${_gitname}/${_gitname}/bin/Release/linux-x64"

    # Copy Linux binary
    install -d -m0755 -g 0 "${pkgdir}"/usr/bin
    install -m0755 -g 0 -t "${pkgdir}"/usr/bin/ ${_gitname}

    # Copy Linux dependencies
    #install -m0755 -g 0 -t "${pkgdir}"/usr/lib *.so
}
