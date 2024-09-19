# Maintainer: Cole Leavitt <coleleavitt@protonmail.com>

pkgname=sf-cli-git
pkgver=2.58.7.ed27925
pkgrel=1
pkgdesc="A tool for creating and managing Salesforce DX projects from the command line (git version)"
arch=('x86_64')
url="https://developer.salesforce.com/tools/salesforcecli"
license=('BSD')
depends=('nodejs')
optdepends=('gnome-keyring: for saving default credentials')
provides=('sf-cli')
conflicts=('sf-cli')
source=("sf-cli::git+https://github.com/salesforcecli/cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/sf-cli"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/sf-cli"
    install_dir="/opt/${pkgname}"

    # Create the installation directory
    install -dm755 "${pkgdir}${install_dir}"

    # Copy all files from the git repository to the installation directory
    cp -a ./* "${pkgdir}${install_dir}"

    # Set executable permissions for the sf binary
    chmod +x "${pkgdir}${install_dir}/bin/sf"

    # Create a symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${install_dir}/bin/sf" "${pkgdir}/usr/bin/sf"

    # Install license file
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo "To check for Salesforce CLI updates, run:"
    echo "    sf update"
}

