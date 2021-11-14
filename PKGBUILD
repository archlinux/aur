# Maintainer: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch-ui
pkgname=cwtch
pkgver=1.4.2
pkgrel=1
pkgdesc="UI for Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications"
arch=('x86_64')
url="https://cwtch.im/"
license=('MIT')
conflicts=('cwtch-bin' 'cwtch-git')
depends=('libcwtch-go')
makedepends=('flutter-dev' 'ninja')
source=("${_pkgname}-v${pkgver}.tar.gz::https://git.openprivacy.ca/cwtch.im/cwtch-ui/archive/v${pkgver}.tar.gz")
sha512sums=('4db62a4f6dc5fe066148c269b18ec0708c841583f891de6e234d5ba321e90699606984cad7cd3bb4365c6b76fa16ab9e399ec71f912d922ced8aeaa75ac1664c')

build() {
    cd "$srcdir/$_pkgname"

    # If using the AUR 'flutter'/'flutter-beta' packages, we need a group.
    if ! id -nG | grep -qw flutterusers ; then
        if [ "`which flutter`" == "/usr/bin/flutter" ] ; then
            warning "You are not in the 'flutterusers' group. The build will probably fail."
            warning "Run 'sudo usermod -a -G flutterusers $USER' and reboot to fix."
        fi
    fi

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

    # See cwtch-git PKGBUILD and linux/ package-release.sh and install-sys.sh
    install -Dm0755 "linux/cwtch.sys.sh" "$pkgdir/usr/bin/cwtch"
    install -Dm0644 "linux/cwtch.png" -t "$pkgdir/usr/share/icons/"
    install -dm0755 "$pkgdir/usr/share/cwtch/"
    cp -r "$builddir/data" "$pkgdir/usr/share/cwtch/"
    install -dm0755 "$pkgdir/usr/lib/cwtch/"
    install -Dm0755 "$builddir/cwtch" -t "$pkgdir/usr/lib/cwtch/"
    cp -r "$builddir/lib/"* "$pkgdir/usr/lib/cwtch/"
    install -Dm0644 "linux/cwtch.sys.desktop" "$pkgdir/usr/share/applications/cwtch.desktop"
}
