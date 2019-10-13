# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-lang-bin
pkgver=3.0
pkgrel=4
pkgdesc="Provides the general purpose, pure and lazy functional programming language Clean."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('glibc')
conflicts=('clean-lang')
provides=('clean-lang')
replaces=('clean-lang')
source=("https://ftp.cs.ru.nl/Clean/Clean30/linux/clean${pkgver}_64.tar.gz"
        'clean-lang.sh')
sha256sums=('c71024cc6d27df357fed771a75f5d43e584369c3ee963bfd6d5cffe9af731ca8'
            '872a1bbe40b2b846e7aef38cee182df731bd2fca60bfb639d44fbb8ed21649d3')

package() {
	cd "${pkgname/-lang-bin/}"

    # install the main files (does a bit of compiling as well...)
	make INSTALL_DIR="$pkgdir/usr" INSTALL_MAN_DIR="$pkgdir/usr/share/man" install

    # resolve permissions on binaries
    chmod go+r "$pkgdir/usr/bin/BatchBuild" "$pkgdir/usr/bin/clm" \
        "$pkgdir/usr/bin/htoclean" "$pkgdir/usr/lib/exe/cg" \
        "$pkgdir/usr/lib/exe/cocl" "$pkgdir/usr/lib/exe/linker"

    # remove empty dir
    rmdir "$pkgdir/usr/Temp"
    rmdir "$pkgdir/usr/lib/Generics/Clean System Files"
    rmdir "$pkgdir/usr/lib/MersenneTwister/Clean System Files"
    rmdir "$pkgdir/usr/lib/Dynamics/Clean System Files"
    rmdir "$pkgdir/usr/lib/StdLib/Clean System Files"

    # add missing binaries
    install -Dm755 "bin/cpm" "$pkgdir/usr/bin/cpm"
    install -Dm755 "bin/patch_bin" "$pkgdir/usr/bin/patch_bin"
    install -Dm755 "bin/BatchBuild" "$pkgdir/usr/bin/BatchBuild"

    # add profile
    install -Dm755 "$srcdir/clean-lang.sh" "$pkgdir/etc/profile.d/clean-lang.sh"

    # install license
    install -Dm644 CleanLicenseConditions.txt "$pkgdir/usr/share/licenses/${pkgname}/CleanLicenseConditions.txt"
}
