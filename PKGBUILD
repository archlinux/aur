# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor:

pkgname=mimipenguin-git
pkgver=r102.d69cc00
pkgrel=1
pkgdesc="A tool to dump the login password from the current linux user"
arch=('any')

url="https://github.com/huntergregal/mimipenguin"
license=('CCPL:by')

makedepends=(
  'git'
)
depends=(
    'python'
)
provides=('mimipenguin')
conflicts=('mimipenguin')

source=('git+https://github.com/huntergregal/mimipenguin')
sha512sums=('SKIP')

# Get the number of revisions since beginning of the history
# src.: https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

    cd "${pkgname%-git}"

    # Force use of python3.
    sed -i 's/python2 -c "import crypt; print crypt.crypt($CRYPT)"/python -c "import crypt; print(crypt.crypt($CRYPT))"/g' mimipenguin.sh
}

package() {
    # When entering here, we are in the src directory, go in the cloned
    # mimipenguin directory.
    cd "${pkgname%-git}"

    install -Dm644 LICENSE "$pkgdir/usr/share/license/mimipenguin/LICENSE"
    install -Dm755 mimipenguin.py "$pkgdir/usr/bin/mimipenguin.py"
    install -Dm755 mimipenguin.sh "$pkgdir/usr/bin/mimipenguin.sh"
}
