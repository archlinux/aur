# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>
pkgname=lip-git
_pkgname=lip
pkgver=0.32.0.r390.gfc7972e
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=('lip-bin')
options=(!strip)
makedepends=('dotnet-sdk' 'dotnet-runtime' 'dotnet-host' 'git')
source=("$pkgname::git+${url}.git#tag=v0.32.0"
        "lip.1")
sha256sums=('2331a28b1dddaffce8676d81895be7e57c08b8c44e3d42fed1980452d7040dce'
            '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    cd "$pkgname"
    if [[ -z "$(git config --get user.name)" ]]; then
        git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}
build() {
    cd "$pkgname"
    if [ "$arch" == x86_64 ]; then
        _runtime="linux-x64"
    else
        _runtime="linux-arm64"
    fi
    dotnet publish Lip.CLI \
        --configuration Release \
        --output bin \
        --runtime "$_runtime" \
        --self-contained true \
        -p:PublishSingleFile=true \
        -p:Version="${pkgver%.r*}"
}
package() {
    install -Dm 644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm 755 "$pkgname/bin/lip" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
