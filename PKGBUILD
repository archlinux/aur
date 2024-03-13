# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-git
pkgver=1.14.7.r0.g69b7ddb2
pkgrel=1
pkgdesc="UI for Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications (git)"
arch=('x86_64')
url="https://cwtch.im/"
license=('MIT')
depends=('cwtch-autobindings')
makedepends=('flutter' 'ninja' 'git')
provides=("$_pkgname")
conflicts=('cwtch' 'cwtch-bin')
source=("$_pkgname::git+https://git.openprivacy.ca/cwtch.im/cwtch-ui")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v\.\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$_pkgname"
    # Remove deprecated isAlwaysShown for compat with newer dart SDKs
    sed -re 's/(scrollbarTheme: .*)isAlwaysShown: false(, )?/\1/' -i lib/themes/opaque.dart
    # Remove Tor binary and libCwtch.so from package script, since we don't vendor them
    sed -re 's/^cp( -r)? linux\/(libCwtch\.so|Tor) /#\0/' -i linux/package-release.sh
}

build() {
    cd "$srcdir/$_pkgname"

    flutter="flutter --suppress-analytics"
    # no way to local-enable this... let's try to clean up after ourselves
    $flutter config | grep -qE '^\s*enable-linux-desktop: true\b' || flutter_set_linux=y
    flutter_set_linux="$?"
    [ "$flutter_set_linux" == "y" ] || $flutter config --enable-linux-desktop

    warning "If the build step fails with a message about the SDK version, upgrade flutter or run \`flutter upgrade --force\`"
    # See https://git.openprivacy.ca/cwtch.im/cwtch-ui/src/branch/trunk/.drone.yml
    $flutter pub get
    $flutter build linux \
        --dart-define BUILD_VER="${pkgver}-${pkgrel}-ARCH" \
        --dart-define BUILD_DATE="`date +%G-%m-%d-%H-%M`"

    [ "$flutter_set_linux" == "y" ] || $flutter config --no-enable-linux-desktop
}

package() {
    cd "$srcdir/$_pkgname"
    linux/package-release.sh
    cd build/linux/x64/release/bundle
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./install.sh
}
