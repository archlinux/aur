# Maintainer: Ainola <ainola@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-wl-clipboard
pkgver=1.7.3
pkgrel=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (wl-clipboard support)'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'tree' 'wl-clipboard')
checkdepends=('git')
optdepends=('git: for Git support'
            'dmenu: for passmenu'
            'qrencode: for QR code support')
replaces=('passmenu')
provides=('passmenu' 'pass')
conflicts=('passmenu' 'pass')
source=(
    "https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz"
    "clip-Add-support-for-wl-clipboard.patch"
)
sha256sums=('2b6c65846ebace9a15a118503dcd31b6440949a30d3b5291dfb5b1615b99a3f4'
            '620ea56e441f7ba424e9eddb4bbbe67b120b7e0cffd42006fff2d28279169311')

prepare() {
    cd "password-store-$pkgver"
    # Until upstream accepts something like this
    patch -p1 < ../clip-Add-support-for-wl-clipboard.patch
}

check() {
    cd "${srcdir}/password-store-$pkgver/"
    make test
}

package() {
    cd "${srcdir}/password-store-$pkgver/"
    make DESTDIR="${pkgdir}" WITH_ALLCOMP=yes install

    cd contrib/dmenu
    install -Dm0755 passmenu "${pkgdir}/usr/bin/passmenu"
}
