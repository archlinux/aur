# Maintainer: w568w <w568w at outlook dot com>
pkgname=sciter-js-sdk-bin
pkgver=5.0.2.17
pkgrel=1
pkgdesc="The SDK of an embeddable HTML/CSS/JavaScript engine for modern UI development (Prebuilt binaries and libraries)"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://sciter.com/"
license=('BSD')
depends=(
    'gtk3'
)
source=("sdk-src-${pkgver}::https://gitlab.com/sciter-engine/sciter-js-sdk/-/archive/main/sciter-js-sdk-main.zip")
install="${pkgname}.install"
# Since the upstream does not provide a reliable way to check the integrity of the source code,
# we skip the checksum verification.
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/sciter-js-sdk-main"

    # Extract the version from the first level 2 heading in CHANGELOG.md
    _version=$(awk '/^## / {if (!found) {print substr($0, 4); found=1}}' CHANGELOG.md)
  
    # Remove leading and trailing whitespace
    _version=$(echo "$_version" | awk '{$1=$1};1')

    echo "$_version"
}

package() {
    cd "$srcdir/sciter-js-sdk-main"

    if [[ $CARCH == "armv7l" ]]; then
        _arch="arm32"
    elif [[ $CARCH == "aarch64" ]]; then
        _arch="arm64"
    elif [[ $CARCH == "i686" ]]; then
        _arch="x32"
    elif [[ $CARCH == "x86_64" ]]; then
        _arch="x64"
    else
        echo "Unsupported architecture: $CARCH"
        exit 1
    fi

    # Install executable files
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    cp -ra "$srcdir/sciter-js-sdk-main"/* "$pkgdir/opt/$pkgname"

    echo "Checking for executable files in $pkgdir/opt/$pkgname/bin/linux/$_arch"
    for f in "$pkgdir/opt/$pkgname/bin/linux/$_arch"/*; do
        if [[ -x "$f" ]]; then
            echo "Linking $f"
            # Extract the filename without the path
            filename=$(basename "$f")
            # Create a symbolic link in /usr/bin
            ln -s "/opt/$pkgname/bin/linux/$_arch/$filename" "$pkgdir/usr/bin/$filename"
        fi
    done

    # Install include directory
    install -dm644 "$pkgdir/usr/include/$pkgname"
    cp -ra include/* "$pkgdir/usr/include/$pkgname"

    # Install LICENSE file
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install docs
    install -dm644 "$pkgdir/usr/share/doc/$pkgname"
    cp -ra docs/* "$pkgdir/usr/share/doc/$pkgname"

    # Set SCITERSDK environment variable
    install -dm755 "$pkgdir/etc/profile.d/"
    echo "export SCITERSDK=/opt/$pkgname" >> "$pkgdir/etc/profile.d/scitersdk.sh"
}