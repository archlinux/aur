# Maintainer: he3als <me at he3als dot xyz>

pkgname=soulver-cpp-git
pkgver=r12.de956c0
pkgrel=1
pkgdesc="Simple C++ bindings for the SoulverCore Swift library"
arch=('x86_64')
url="https://github.com/vicinaehq/soulver-cpp"
license=('unknown')
depends=(
    'nlohmann-json'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
)
optdepends=(
    'swift-bin-6.1: Swift 6.1 toolchain (required for building)'
)
provides=('soulver-cpp')
conflicts=('soulver-cpp')
source=("${pkgname}::git+https://github.com/vicinaehq/soulver-cpp.git")
sha256sums=('SKIP')

_swift_version="6.1"
_swift_binary="swift"
_swift_search_prefixes=(
    "/usr/lib/swift-${_swift_version}"
    "/opt/swift-${_swift_version}"
    "/usr/local/swift-${_swift_version}"
    "/usr/lib/swift"
    "/opt/swift"
    "/usr/local/swift"
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_find_swift() {
    local bin_path

    # check configured search paths
    for prefix in "${_swift_search_prefixes[@]}"; do
        bin_path="${prefix}/bin/${_swift_binary}"
        if [[ -x "$bin_path" ]]; then
            local ver
            ver=$("$bin_path" --version 2>&1 | grep -oP 'Swift version \K[0-9]+\.[0-9]+')
            if [[ "$ver" == "$_swift_version" ]]; then
                echo "$bin_path"
                return 0
            fi
        fi
    done

    # check if swift in PATH is the required version
    if command -v "$_swift_binary" &>/dev/null; then
        local ver
        ver=$("$_swift_binary" --version 2>&1 | grep -oP 'Swift version \K[0-9]+\.[0-9]+')
        if [[ "$ver" == "$_swift_version" ]]; then
            command -v "$_swift_binary"
            return 0
        fi
    fi

    return 1
}

prepare() {
    local swift_path
    swift_path=$(_find_swift)

    if [[ -z "$swift_path" ]]; then
        error "Swift ${_swift_version}.x not found. Please install swift-bin-${_swift_version} or another Swift ${_swift_version} toolchain."
        return 1
    fi

    # verify Swift version
    local swift_version
    swift_version=$("$swift_path" --version 2>&1 | grep -oP 'Swift version \K[0-9]+\.[0-9]+')
    if [[ "$swift_version" != "$_swift_version" ]]; then
        error "Swift ${_swift_version} required, found version $swift_version"
        return 1
    fi

    msg2 "Using Swift $swift_version at $swift_path"

    # export for build()
    echo "$swift_path" > "$srcdir/.swift_path"
}

build() {
    cd "$pkgname"

    local swift_bin
    swift_bin=$(cat "$srcdir/.swift_path")
    local swift_dir
    swift_dir=$(dirname "$swift_bin")

    # add Swift to PATH
    export PATH="$swift_dir:$PATH"

    cmake -GNinja -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # install license (if it exists in the future)
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
