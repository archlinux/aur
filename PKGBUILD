pkgname=mdev-gpu-cli
pkgver=0.1.0.0
pkgrel=2
epoch=0
pkgdesc='A user-configurable utility for GPU vendor drivers enabling the registration of arbitrary mdev types with the VFIO-Mediated Device framework.'
arch=('x86_64')
url='https://github.com/Arc-Compute/Mdev-GPU'
license=('GPL')
depends=('ghc-libs' 'haskell-path' 'haskell-optparse-applicative' 'haskell-bimap' 'haskell-fixed-vector' 'haskell-yamlparse-applicative' 'haskell-ioctl')
makedepends=('ghc')
conflicts=('mdev-cli')
replaces=('mdev-cli')
source=("git+https://github.com/Arc-Compute/Mdev-GPU.git#commit=48649a0ed9f2285c883c98610309bd677e8690ae")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Mdev-GPU"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
      --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=haskell-mdev-gpu --enable-tests \
      --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
      --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
      --ghc-option='-pie'

    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "$srcdir/Mdev-GPU"

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE

    cp -R "$srcdir/Mdev-GPU/etc" "$pkgdir/"
    mv "$pkgdir/etc/systemd" "$pkgdir/usr/lib/"
    sed -i 's/\/usr\/bin\/sudo //' "$pkgdir/usr/lib/systemd/system/mdev-post.service"
    mv "$pkgdir/usr/bin/mdev-cli" "$pkgdir/usr/bin/mdev-gpu-cli"
}

