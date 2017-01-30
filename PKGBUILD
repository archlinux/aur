# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=lima
pkgver=1.2beta
pkgrel=1
pkgdesc="Personal Cloud software"
depends=(python2 fuse libyaml ffmpeg libjpeg-turbo)
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
    "ae49613d766dd1526cb09260db5d496b82d792ac83c12430a8e3bef7556aa914"
    "68662c1437f88403f38b0e80da3b2b546512fe524b791cba27791cd2d5033e7c"
)

package() {
    cd "$pkgname-$pkgver"

    # Copy lib directory.
    mkdir -p "$pkgdir/usr"
    cp -r lib "$pkgdir/usr"

    # Use python2 instead of python to make Namcap happy.
    sed -i -e "s|#!/usr/bin/env python\r\?$|#!/usr/bin/env python2|g" \
        $(find "$pkgdir" -name "*.py")
    sed -i -e "s|#!/usr/local/bin/python\r\?$|#!/usr/bin/env python2|g" \
        $(find "$pkgdir" -name "*.py")

    # All .pyc files are OK.
    find "$pkgdir" -name "*.pyc" -exec touch {} \;

    # Mark stack of libraries as non-executable.
    execstack -c "$pkgdir/usr/lib/lima/pylima.so"
    for i in "$pkgdir/usr/lib/lima/deps/gnsdk/lib/linux_x86-64/"*".so"*; do
        execstack -c "$i"
    done

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
