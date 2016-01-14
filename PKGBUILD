# Maintainer: Austin Adams <aur@austinjadams.com>
_pkgname=vlmcsd
pkgname=$_pkgname-git
pkgver=r3.0c0b23a
pkgrel=1
pkgdesc="KMS Emulator in C (for activating Microsoft products)"
arch=('i686' 'x86_64')
url="https://github.com/vancepym/vlmcsd"
license=('unknown')
provides=('vlmcsd')
conflicts=('vlmcsd-svn')
source=("$_pkgname::git+$url.git"
        'vlmcsd.service'
        'vlmcsd@.service'
        'vlmcsd.socket')
sha256sums=('SKIP'
    '83e7e75f5874c17bfa40f08eea134ba636d7ac9864eea2c4ad1ae8159ec9af74'
    '5e1f1c556f16e61fcdaa197f9ada9d3d2a8d91d4b14b36e85181b323b3475623'
    'e791484ed6d747f4e17f004894350ef610215c94fe444bfa623755ce17a29e6b')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
    gzip -fk *.[0-9]
}

package() {
    cd "$_pkgname"

    for bin in vlmcs{d,}; do
        install -Dm755 $bin "$pkgdir"/usr/bin/$bin
    done

    for unit in vlmcsd.service vlmcsd@.service vlmcsd.socket; do
        install -Dm644 "$srcdir"/$unit "$pkgdir"/usr/lib/systemd/system/$unit
    done

    for manpage in *.[0-9]; do
        section=${manpage##*.}
        install -Dm644 $manpage.gz "$pkgdir"/usr/share/man/man$section/$manpage.gz
    done
}

# vim: set ts=4 sw=4 et :
