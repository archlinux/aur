# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Leonidas <marek@xivilization.net>
pkgname=factor
pkgver=0.102
pkgrel=1
pkgdesc="A general purpose, dynamically typed, stack-based programming language."
arch=(i686 x86_64)
url="https://factorcode.org"
license=(BSD)
provides=(factor)
conflicts=(factor-git)

depends_i686=('gtk3' 'openssl')
makedepends_i686=('gtk3')

depends=('gtk4' 'openssl')
makedepends=('gtk4')
optdepends=('udis86: enables "disassemble" (tools.disassembler)'
            'rlwrap: readline editing in the terminal listener (as recommended by build.sh deps-pacman)')
options=(!strip)
source=(http://downloads.factorcode.org/releases/$pkgver/$pkgname-src-$pkgver.zip
        factor-app-id.patch)
sha512sums=('413d355b481982bc5adad0ff1eaad5314ba0e4953599b481e7ccd4baf9a842c896a41e1fd085f19d25f0bc77e8be4cae3c789de9be16603d6fe70338c1e86cb0'
            '01685c39a623ad812f370c122be85d99c38ce7bd1eac9b51708e1cc7b4c62439b69d49d29b25cae6b341c6a0676dba53bf909bb290cb2740089f454efe0d0942')

prepare() {
    cd $pkgname
    patch -Np1 -i "$srcdir/factor-app-id.patch"
}

build() {
    cd $pkgname

    # build the VM
    make

    # thanks to qx from #concatenative for the proper SSE settings:
    # i686: no SSE, x87 floating point => -sse-version=0
    # x86_64: SSE2 => (autodetect) -sse-version=20
    if [ $CARCH = x86_64 ]; then
        ./factor -i="boot.unix-x86.64.image"
    else
        # bootstrap factor with the minimum supported SSE
        ./factor -i="boot.unix-x86.32.image" -sse-version=0
    fi
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/factor
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/

    # copy over the stdlib
    cd $srcdir/$pkgname
    cp -a misc extra core basis factor.image $pkgdir/usr/lib/factor/
    # make folders r+x and files r
    chmod -R 0755 $pkgdir/usr/lib/factor
    find $pkgdir/usr/lib/factor -type f -exec chmod -x {} \;

    # copy over the actual binary and create a symlink called factor-vm
    # (otherwise it conflicts with factor from the GNU coreutils)
    cp -a factor $pkgdir/usr/lib/factor/factor
    ln -s ../lib/factor/factor $pkgdir/usr/bin/factor-vm

    # copy over the license (as defined in Arch Packaging Standards)
    chmod -x LICENSE.txt
    cp LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING

    # add the desktop entry from the distribution, adjusted to use factor-vm
    # (the upstream Exec=factor would conflict with GNU coreutils).
    # StartupWMClass only matters for X11/XWayland sessions and has to match
    # the WM_CLASS the backend advertises: the GTK4 backend derives both
    # components from the program name, while the GTK3 backend sets the class
    # to "Factor" explicitly.
    if [ "$CARCH" = x86_64 ]; then
        wmclass=factor
    else
        wmclass=Factor
    fi
    sed -e 's|^Exec=factor$|Exec=factor-vm|' \
        -e "s|^StartupWMClass=.*|StartupWMClass=$wmclass|" \
        "$srcdir/$pkgname/misc/factor.desktop" |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/factor.desktop"
    install -Dm644 "$srcdir/$pkgname/misc/icons/icon.svg" \
        "$pkgdir/usr/share/pixmaps/factor.svg"
}

