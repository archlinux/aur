# Maintainer: nicholasmn <aur@mini.anonaddy.com>

pkgname=opennoodl
pkgver=1.1.0
pkgrel=1
pkgdesc="Low-code for when experience matters"
arch=('x86_64')
url="https://learn-noodl.com"
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'npm' 'jq' 'libxcrypt-compat')
source=("https://github.com/The-Low-Code-Foundation/OpenNoodl/archive/refs/tags/release.tar.gz")
sha256sums=('fba7b649275389ca5e04fe1f8d3454d6f0376bdfdabea90794ace60317edf0ef')

build() {
    cd "$srcdir/OpenNoodl-release"

    # Determine the NVM installation directory
    nvm_default_install_dir() {
        [ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm"
    }

    nvm_install_dir() {
        if [ -n "$NVM_DIR" ]; then
            printf %s "${NVM_DIR}"
        else
            nvm_default_install_dir
        fi
    }

    # Check if nvm is installed
    NVM_DIR=$(nvm_install_dir)
    if [ ! -s "$NVM_DIR/nvm.sh" ]; then
        echo "Error: nvm is not installed in the expected location: $NVM_DIR"
        echo "Please install nvm before proceeding. Use the following command:"
        echo "    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/refs/heads/master/install.sh | bash"
        exit 1
    fi

    # Source nvm
    export NVM_DIR
    [ -s "$NVM_DIR/nvm.sh" ] && \source "$NVM_DIR/nvm.sh"

    # Use Node.js 16
    nvm install 16
    nvm use 16

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
