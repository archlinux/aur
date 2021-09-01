# Maintainer: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-git
pkgver=r481.ca507f7
pkgrel=1
pkgdesc="Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications"
# Probably works on others - Please let me know!
arch=('x86_64' 'i686')
url="https://cwtch.im/"
license=('MIT')
depends=('libcwtch-go')
# flutter-beta until 2.5
makedepends=('flutter-beta' 'go' 'git')
provides=("$_pkgname")
source=("$_pkgname::git+https://git.openprivacy.ca/cwtch.im/cwtch-ui")

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"

    # If using the AUR 'flutter'/'flutter-beta' packages, we need a group.
    if ! id -nG | grep -qw flutterusers ; then
        if [ "`which flutter`" == "/usr/bin/flutter" ] ; then
            warning "You are not in the 'flutterusers' group. The build will probably fail."
            warning "Run 'sudo usermod -a -G flutterusers $USER' and reboot to fix."
        fi
    fi

    set -eux

    flutter="flutter --suppress-analytics"
    # no way to local-enable this... let's try to clean up after ourselves
    $flutter config | grep -qE '^\s*enable-linux-desktop: true\b' || flutter_set_linux=y
    flutter_set_linux="$?"
    [ "$flutter_set_linux" == "y" ] || $flutter config --enable-linux-desktop


    # See https://git.openprivacy.ca/cwtch.im/cwtch-ui/src/branch/trunk/.drone.yml
    $flutter pub get
    $flutter build linux \
        --dart-define BUILD_VER="${pkgver}-${pkgrel}-ARCH" \
        --dart-define BUILD_DATE="`date +%G-%m-%d-%H-%M`"

    [ "$flutter_set_linux" == "y" ] || $flutter config --no-enable-linux-desktop
}

package() {
    cd "$srcdir/$_pkgname"
    builddir="$srcdir/$_pkgname/build/linux/x64/release/bundle"

    # See linux/ package-release.sh and install-sys.sh
    install -Dm0755 "linux/cwtch.sys.sh" "$pkgdir/usr/bin/cwtch"
    install -Dm0644 "linux/cwtch.png" -t "$pkgdir/usr/share/icons/"
    install -dm0755 "$pkgdir/usr/share/cwtch/"
    cp -r "$builddir/data" "$pkgdir/usr/share/cwtch/"
    install -dm0755 "$pkgdir/usr/lib/cwtch/"
    install -Dm0755 "$builddir/cwtch" -t "$pkgdir/usr/lib/cwtch/"
    cp -r "$builddir/lib/"* "$pkgdir/usr/lib/cwtch/"
    install -Dm0644 "linux/cwtch.sys.desktop" "$pkgdir/usr/share/applications/cwtch.desktop"
}
sha256sums=('SKIP')
