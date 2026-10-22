# Maintainer: Jonathan Gabor <jgabor@users.noreply.github.com>
# makepkg reads metadata and supplies srcdir/pkgdir.
# shellcheck disable=SC2034,SC2154
pkgname=satmod
pkgver=1.0.1
pkgrel=1
pkgdesc='MSVC under Wine, Starter Project setup, and mod builds for Satisfactory modding'
arch=('x86_64')
url='https://github.com/jgabor/satmod'
license=('ISC')
depends=('unreal-engine-css-bin' 'python' 'msitools' 'wine' 'git' 'perl' 'bash'
         'ca-certificates' 'coreutils' 'findutils' 'gawk' 'grep' 'sed' 'patch'
         'tar' 'zstd' 'dos2unix')
options=('!strip' '!debug')
install=satmod.install
_commit=61b7cbc8cb9413fec8f0016ef433a90e06c37f54
source=("msvc-wine-${_commit}.tar.gz::https://codeload.github.com/mircearoata/msvc-wine/tar.gz/${_commit}"
        'satmod' 'LICENSE')
sha256sums=('0747197e8ff04749137978c02bada973c4bad2c6844c48909ae4217086fc7867'
            '80e80b79ec3ed514a7c4fc0e374c01edbfa1961cd477857bd7948efb471e3637'
            '2c50315092a261a88be9569e534c24b56b08606dde657263e8728f711263e58e')

package() {
    local dest="$pkgdir/usr/share/$pkgname"
    install -d "$dest" "$pkgdir/usr/bin"
    cp -a "$srcdir/msvc-wine-$_commit" "$dest/msvc-wine"
    # Setup never runs msvc-wine's own tests or container builds.
    rm -r "$dest/msvc-wine/test" "$dest/msvc-wine"/Dockerfile*
    # Keep executable scripts and relative aliases; remove write access for others.
    find "$dest/msvc-wine" -type d -exec chmod 755 {} +
    find "$dest/msvc-wine" -type f -exec chmod go-w {} +
    install -m755 "$srcdir/satmod" "$dest/"
    ln -s ../share/$pkgname/satmod "$pkgdir/usr/bin/satmod"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$dest/msvc-wine/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/msvc-wine-LICENSE.txt"
}
