# Maintainer: w0rty <mawo97 at gmail.com>

_gitname=VmChamp
pkgname=vmchamp-git
pkgver=v0.0.2.r8.g1e2da17
pkgrel=1
pkgdesc="Simple and fast creation of throwaway VMs on your local machine."
arch=('x86_64')
license=('GPL3')
conflicts=('vmchamp-bin')
url='https://github.com/wubbl0rz/VmChamp'
depends=('zlib' 'libvirt')
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
    cd "${_gitname}"
    output="./output/bin/Release/linux-x64"
    version=$(git describe)

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
    cd "$srcdir/${_gitname}/output/bin/Release/linux-x64"

    # Copy Linux binary
    install -dm 0755 "${pkgdir}"/usr/bin
    install -m 0755 ${_gitname} "${pkgdir}"/usr/bin/
    ln -s VmChamp "${pkgdir}"/usr/bin/vmchamp
}
