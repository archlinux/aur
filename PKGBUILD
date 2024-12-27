# Maintainer: nicholasmn <aur@mini.anonaddy.com>

pkgname=opennoodl
pkgver=1.1.0
pkgrel=2
pkgdesc="Low-code for when experience matters"
arch=('x86_64')
url="https://learn-noodl.com"
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'npm' 'jq' 'libxcrypt-compat')
source=("https://github.com/The-Low-Code-Foundation/OpenNoodl/archive/refs/tags/release.tar.gz"
        "https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.xz")
sha256sums=('fba7b649275389ca5e04fe1f8d3454d6f0376bdfdabea90794ace60317edf0ef'
            '874463523f26ed528634580247f403d200ba17a31adf2de98a7b124c6eb33d87')

build() {
    cd "$srcdir/OpenNoodl-release"

    # Extract the Node.js tarball
    tar -xvf "$srcdir/node-v16.20.2-linux-x64.tar.xz" -C "$srcdir"
    export PATH="$srcdir/node-v16.20.2-linux-x64/bin:$PATH"  # Add Node.js 16 to the PATH

    # Initialize a fake git repository if needed
    if [ ! -d .git ]; then
        git init
        git config user.name "FakeUser"
        git config user.email "fakeuser@example.com"
    fi

    # Add or update the 'author' field in the noodl-editor package.json
    jq '.author = "The Low Code Foundation <contact@thelowcodefoundation.com>"' packages/noodl-editor/package.json > packages/noodl-editor/package.temp.json && mv packages/noodl-editor/package.temp.json packages/noodl-editor/package.json

    # Install dependencies and build the application
    npm install
    npm run build:editor
}

package() {
    cd "$srcdir/OpenNoodl-release"

    # Install the .deb package
    ar x packages/noodl-editor/dist/noodl-editor_1.1.0_amd64.deb

    # Extract the data.tar.xz or data.tar.gz (depending on the compression format) to the package directory
    tar -xvf data.tar.* -C "$pkgdir"

    # Include license and documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
