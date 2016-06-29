# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=lima
pkgver=1.1.1beta
pkgrel=1
pkgdesc="Personal Cloud software"
depends=(python2 fuse)
optdepends=(
    "python2-gnomekeyring: Gnome Keyring support"
    "kdebindings-python2: KWallet support"
)
makedepends=(prelink)
arch=("x86_64")
url="https://meetlima.com"
license=(custom)
install="lima.install"
source=(
    "https://static.meetlima.com/linux-client/$pkgname-$pkgver-amd64.tgz"
    "lima.service"
)
sha256sums=(
    "02be5205081b22ca09fc9a7d1e0546e0f952ee15640aa6c6b0f2f40fe1871e61"
    "68662c1437f88403f38b0e80da3b2b546512fe524b791cba27791cd2d5033e7c"
)

package() {
    cd "$pkgname-$pkgver"

    # Copy lib directory.
    mkdir -p "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"

    # Use python2 instead of python to make Namcap happy.
    sed -i -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|g" \
        $(find "$pkgdir" -name "*.py")

    # All .pyc files are OK.
    find "$pkgdir" -name "*.pyc" -exec touch {} \;

    # Mark stack of library as non-executable.
    execstack -c "$pkgdir/usr/lib/lima/pylima.so"

    # Systemd unit file
    install -Dm0644 "$srcdir/lima.service" \
        "$pkgdir/usr/lib/systemd/user/lima.service"

    # Executable and license file
    install -Dm0755 lima "$pkgdir/usr/bin/lima"
    install -Dm0644 "lib/lima/TAC.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/TAC.txt"

    # Man page
    install -Dm0644 "lib/lima/lima.1.gz" \
        "$pkgdir/usr/share/man/man1/lima.1.gz"
}
