# Maintainer: phariseo <phariseo@hush.com>
_pkgname=vlmcsd
pkgname=$_pkgname-git
pkgver=r29.65228e5
pkgrel=2
pkgdesc="KMS Emulator in C (for activating Microsoft products)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Wind4/vlmcsd"
license=('unknown')
provides=('vlmcsd')
conflicts=('vlmcsd')
makedepends=('git')
source=("git+$url.git"
        'vlmcsd.service'
        'vlmcsd@.service'
        'vlmcsd.socket')
sha256sums=('SKIP'
            '6fe8070a5d2d28f8a8179c9d02d5a905725e2e978af7e340a47024fa77809d02'
            '7ff86964df9796d30fe22c96b5ba843ef9f170d7a23c6e17565e312db59f20d7'
            'e791484ed6d747f4e17f004894350ef610215c94fe444bfa623755ce17a29e6b')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make STRIP=0
    cd man
    gzip -fk *.[0-9]
}

package() {
    for unit in vlmcsd.service vlmcsd@.service vlmcsd.socket; do
        install -Dm644 "$srcdir/$unit" "$pkgdir/usr/lib/systemd/system/$unit"
    done

    cd "$_pkgname"

    for bin in vlmcs{d,}; do
        install -Dm755 "bin/$bin" "$pkgdir/usr/bin/$bin"
    done

    cd man

    for manpage in *.[0-9]; do
        section=${manpage##*.}
        install -Dm644 "$manpage.gz" "$pkgdir/usr/share/man/man$section/$manpage.gz"
    done
}

# vim: set ts=4 sw=4 et :
