# Maintainer: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch-ui
pkgname=cwtch
pkgver=1.6.2
pkgrel=1
pkgdesc="UI for Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications"
arch=('x86_64')
url="https://cwtch.im/"
license=('MIT')
conflicts=('cwtch-bin' 'cwtch-git')
depends=('libcwtch-go')
makedepends=('flutter' 'ninja')
source=("${_pkgname}-v${pkgver}.tar.gz::https://git.openprivacy.ca/cwtch.im/cwtch-ui/archive/v${pkgver}.tar.gz")
sha512sums=('7ed2440d1dcaf1954e8e3b6dfb4f95758d303521de408a47fde741756420b95741ec056549a24dba0152611f20af95a267d7f392d1b7ded852813fe6571f7917')

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
