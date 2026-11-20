# Maintainer: kStor2poche <kStor2poche [at] orange [dot] fr>

pkgname=syscall-git
pkgver=r7.c8e64f0
pkgrel=1
pkgdesc='Look up Linux syscalls from your terminal'
arch=('any')
url='https://syscall.sh/cli/'
license=('MIT')
depends=(
    'python'
)
makedepends=(
    'git'
    'go>=1.27'
)
source=(
    "git+https://github.com/guitmz/syscall"
)
sha512sums=(
    'SKIP'
)
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>$_stop "



pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    echo -e "${_prefix}Setting up the build dependencies"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "$_pkgname"
    echo -e "${_prefix}Building syscall"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o syscall .
}

check() {
    cd "$_pkgname"
    echo -e "${_prefix}Running tests"
    go test ./...
}

package() {
    cd "$_pkgname"

    echo -e "${_prefix}Creating the package base"
    install -d "$pkgdir"/usr/bin

    echo -e "${_prefix}Setting up the license"
    install -Dm 755 LICENSE -t "${pkgdir}"/usr/share/licenses/"${_pkgname}"/

    echo -e "${_prefix}Setting up the binary"
    install -Dm 755 syscall -t "${pkgdir}"/usr/bin
}
