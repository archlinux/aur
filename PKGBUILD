# Contributor: howeyc <chris@howey.me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>

pkgname='ivy-calc-git'
_basename="${pkgname%-git}"     # name of the non-VCS package
_reponame='ivy'                 # name of the project's VCS repository
_binname='ivyc'                 # name of the executable; default is 'ivy' but that conflicts with ivy from Apache
pkgver=0.2.8.r1.gd463f69
pkgrel=1
pkgdesc='An APL-like calculator.'
arch=('i686' 'x86_64')
url="https://github.com/robpike/${_reponame}"
license=('BSD')
depends=('glibc')
makedepends=(
    'git'
    'go>=1.5'
)
provides=(
    "${_basename}=${pkgver%.r*}"
    "${_binname}=${pkgver%.r*}"
)
conflicts=(
    "${_basename}"
    "${_binname}"
    'ivy-git<1'                 # former AUR package (did not have git tag based version, only r{REVISION}.g{COMMITHASH})
)
replaces=('ivy-git<1')          # former AUR package (did not have git tag based version, only r{REVISION}.g{COMMITHASH})
source=("${_basename}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_basename}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 0.2.8.r1.gd463f69
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build() {
    cd "${_basename}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
        -o "${_binname}" \
        -trimpath \
        -buildmode='pie' \
        -mod='readonly' \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${_basename}"
    install -Dm 755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed '11,375!d' 'doc.go' > 'README'
    install -Dm 644 'README' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
