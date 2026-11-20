# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=setdown
pkgver=1.0.0
pkgrel=2
pkgdesc='Convert Markdown to typographically high-quality PDFs with an embedded Typst'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/setdown'
# setdown's own license, then those of what the binary embeds: Typst, the fonts and cmarker, and Go and its modules
license=('MIT' 'Apache-2.0' 'OFL-1.1' 'BSD-3-Clause')
makedepends=('go')
# What tools/versions.json pins for the binary to embed: the fonts with their licenses and cmarker, then each architecture's
# Typst. tools/fetch unpacks the archives itself.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/adobe-fonts/source-serif/releases/download/4.005R/source-serif-4.005_Desktop.zip'
        'source-serif-4.005R-LICENSE.md::https://raw.githubusercontent.com/adobe-fonts/source-serif/4.005R/LICENSE.md'
        'https://github.com/adobe-fonts/source-sans/releases/download/3.052R/OTF-source-sans-3.052R.zip'
        'source-sans-3.052R-LICENSE.md::https://raw.githubusercontent.com/adobe-fonts/source-sans/3.052R/LICENSE.md'
        'https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip'
        'jetbrains-mono-v2.304-OFL.txt::https://raw.githubusercontent.com/JetBrains/JetBrainsMono/v2.304/OFL.txt'
        'https://raw.githubusercontent.com/google/fonts/b979dba422e445492b0eb9951ac52ee0b4d648c3/ofl/notoemoji/NotoEmoji%5Bwght%5D.ttf'
        'noto-emoji-b979dba422e445492b0eb9951ac52ee0b4d648c3-OFL.txt::https://raw.githubusercontent.com/google/fonts/b979dba422e445492b0eb9951ac52ee0b4d648c3/ofl/notoemoji/OFL.txt'
        'https://packages.typst.org/preview/cmarker-0.1.10.tar.gz')
source_x86_64=('https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-unknown-linux-musl.tar.xz')
source_aarch64=('https://github.com/typst/typst/releases/download/v0.15.1/typst-aarch64-unknown-linux-musl.tar.xz')
noextract=('typst-x86_64-unknown-linux-musl.tar.xz'
          'typst-aarch64-unknown-linux-musl.tar.xz'
          'source-serif-4.005_Desktop.zip'
          'OTF-source-sans-3.052R.zip'
          'JetBrainsMono-2.304.zip'
          'NotoEmoji%5Bwght%5D.ttf'
          'cmarker-0.1.10.tar.gz')
sha256sums=('83146dcdb4a9788274e0608cfb4f33a04c461fdf990aadf659cad6ad69b47052'
            '549fdb8f9a682bd06944298621404969f6de77c2e422ff3b8244a1dcd6a0c425'
            '75784a295293a8992f5a8d99210566e0064a012e6dab6731305e3787f15896c7'
            'a4ebbdea20b08ccbd7bf3665a9462454eefdd01d9a6307129d3b3d4672981074'
            '89ad2c4f66dd29127527493e729c31e731f111cf10faf5774c3db9275ed0c22c'
            '6f6376c6ed2960ea8a963cd7387ec9d76e3f629125bc33d1fdcd7eb7012f7bbf'
            '30f0c136e3c88e422d0791acd97238870f9054a9729bc34cf2ff0d4ed8cac4ad'
            'de6c18832938afc99caf132b39d6a30a19bac7f2e812e28db2535b4608d27551'
            '500bb1ccf43df7bbb522112f9133a52b16e1c35e809632f5d8609b179152de5b'
            '7e5d7a0365aa1d32273bddb4511c62e47ab9d63093c905184ba04ca62064aafc')
sha256sums_x86_64=('a6d077d0a95eed5a2eba715b2dae06be954f624ccbf85758a03f389ded33118c')
sha256sums_aarch64=('5aa8d74a3d906e60ea12a66ac2f37f8eef1b14cbad7182a745e393a10c23dcee')

# The font licenses as <file in $srcdir>:<name in tools/fetch's download cache>; the first carries the font's tag
_licenses=('source-serif-4.005R-LICENSE.md:source-serif-LICENSE.md'
           'source-sans-3.052R-LICENSE.md:source-sans-LICENSE.md'
           'jetbrains-mono-v2.304-OFL.txt:jetbrains-mono-OFL.txt'
           'noto-emoji-b979dba422e445492b0eb9951ac52ee0b4d648c3-OFL.txt:noto-emoji-OFL.txt')

# The module cache stays inside $srcdir, so the build leaves nothing in ~/go
_goenv() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS='-mod=readonly -modcacherw'
}

# The Go architecture this package builds for
_goarch() {
    case "$CARCH" in
        x86_64) echo amd64 ;;
        aarch64) echo arm64 ;;
    esac
}

prepare() {
    cd "$pkgname-$pkgver"
    _goenv
    # Also for tools/fetch, which copies the license texts of Go and the modules from the module cache
    go mod download
    # tools/fetch takes a download from its cache when the hash matches tools/versions.json, so with makepkg's checked
    # copies there it unpacks this architecture's Typst, the fonts and cmarker without going online
    local cache=tools/download-cache file pair
    mkdir -p "$cache"
    for file in "${noextract[@]}"; do
        if [ -e "$srcdir/$file" ]; then
            cp "$srcdir/$file" "$cache/"
        fi
    done
    for pair in "${_licenses[@]}"; do
        cp "$srcdir/${pair%%:*}" "$cache/${pair#*:}"
    done
    # This version's tools/fetch takes Go's license only from $GOROOT/LICENSE, which Arch's go does not install
    sed -i 's|"go-LICENSE", filepath.Join(goroot, "LICENSE")}}|"go-LICENSE", "/usr/share/licenses/go/LICENSE"}}; _ = goroot|' tools/fetch/main.go
    grep -qF '"/usr/share/licenses/go/LICENSE"' tools/fetch/main.go
    go run ./tools/fetch -target "linux/$(_goarch)"
}

build() {
    cd "$pkgname-$pkgver"
    _goenv
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="$GOFLAGS -buildmode=pie -trimpath"
    # -ldflags given here replaces any in GOFLAGS, so -linkmode=external has to be repeated
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o setdown ./cmd/setdown
}

check() {
    cd "$pkgname-$pkgver"
    _goenv
    go test ./...
    # Runs the embedded Typst from the binary that gets installed, not from a test binary
    printf '# setdown %s\n\nA check of the *package*.\n' "$pkgver" >"$srcdir/check.md"
    ./setdown "$srcdir/check.md"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 setdown -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    # The license texts of what the binary embeds, as tools/fetch collected them (setdown-LICENSE is LICENSE again)
    local file
    for file in internal/payload/assets/licenses/*; do
        if [ "${file##*/}" != setdown-LICENSE ]; then
            install -Dm644 "$file" -t "$pkgdir/usr/share/licenses/$pkgname/bundled"
        fi
    done
}
