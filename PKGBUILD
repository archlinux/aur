# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>

pkgname=lip-git
_pkgname=lip
pkgver=0.31.0
pkgrel=3
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=(lip-bin)
options=(!strip)
makedepends=(
    dotnet-sdk
    dotnet-runtime
    dotnet-host
    git
)

source=(
    "git+${url}.git"
    "lip.1"
)
md5sums=(
    'SKIP'
    '16ded768675b51f0e49d76ac17c9fae5'
)

prepare() {
    cd lip
    if [[ -z "$(git config --get user.name)" ]]; then
        git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
    git checkout "v${pkgver}"
}

build() {
    cd lip
    case "${CARCH}" in
        x86_64)
            _runtime="linux-x64"
            ;;
        aarch64)
            _runtime="linux-arm64"
            ;;
    esac
    
    dotnet publish Lip.CLI \
        --configuration Release \
        --output bin \
        --runtime ${_runtime} \
        --self-contained true \
        -p:PublishSingleFile=true \
        -p:Version=${pkgver}
}

package() {
    install -Dm 644 ${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
    cd lip
    install -Dm 755 bin/lip ${pkgdir}/usr/bin/lip
    install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/lip/LICENSE
}
