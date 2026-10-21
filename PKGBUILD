# Maintainer: HelloSWX <i at helloswx dot top>

pkgname=hmcl-region-patch-auto
pkgver=1.0.1
pkgrel=1
pkgdesc="Alpm hook that patches the HMCL installed by the AUR, so that it no longer treats the machine as mainland China"
arch=('any')
url="https://github.com/xuanxuan1231/hmcl-region-patch"
license=('GPL-3.0-or-later')
install="$pkgname.install"

# The patcher itself is not shipped here, it comes from hmcl-region-patch: this package only
# contains the hook that runs it and the script that the hook calls.
depends=('hmcl-region-patch')

# The hook patches the archive of whichever of these packages is installed. They are listed here
# so that it is clear which ones are supported. None of them is required: the hook simply does
# nothing when no HMCL is installed at all. They cannot be put into depends, because pacman
# would install all of them, and "hmcl-dev-bin" does not even provide "hmcl".
optdepends=('hmcl: patch the HMCL of the package "hmcl"'
            'hmcl-bin: patch the HMCL of the package "hmcl-bin"'
            'hmcl-dev: patch the HMCL of the package "hmcl-dev"'
            'hmcl-dev-bin: patch the HMCL of the package "hmcl-dev-bin"')

source=("hmcl-region-patch.hook"
        "hmcl-region-patch-auto-hook")
sha256sums=('ba0b1d4573bebf847821359b7572d74a09d312f38fa51b1abb4c684cdf4156d0'
            '4d62ab96bcda8a101240ae7f4a024fe9e52bad6ebdf5c887d102d9d023caa2f1')

package() {
    # The hook that patches HMCL whenever it is installed or updated, and whenever the package
    # of the patcher itself is installed or updated.
    install -Dm644 "$srcdir/hmcl-region-patch.hook" \
        "$pkgdir/usr/share/libalpm/hooks/hmcl-region-patch.hook"

    # The script that the hook runs: it patches HMCL and then prints the hint. The hint itself
    # is written in that script.
    install -Dm755 "$srcdir/hmcl-region-patch-auto-hook" \
        "$pkgdir/usr/bin/hmcl-region-patch-auto-hook"

    # The directory that holds the backups and the state of the patched archives.
    install -dm755 "$pkgdir/var/lib/hmcl-region-patch"
}
