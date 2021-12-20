# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=valinor
pkgver=1.1.4
pkgrel=2
pkgdesc="Generate Project Files to Debug ELF files"
url="https://github.com/ARMmbed/valinor"
depends=('python'
         'python-pip'
         'python-colorama'
         'pyocd'
         'project-generator'
         'python-pyelftools'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/ARMmbed/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/ARMmbed/valinor/commit/3c5f25f3bb6b05c35895a7a17f37d466011001b9.patch"
        )
sha512sums=('8adc22d5b1ab4d3260cd4838781a43e30b3ee8a9694c529790246b6f4c56ff70e3b233250616bbcb6177a8415905690b76146015f85eee0f72cf09b3cd641fda'
            '050d4026e30862505feae036246ecbacc1c120551bef81ce463d14576e9a9693f129d94de126e4b393e79b13fb8665c9bf2ec5fc3c8aeb30366d22e017145817')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Arch extra currently ships 0.27-1
    sed -i -e 's:pyelftools==0.23:pyelftools>=0.23:' setup.py

    # Arch AUR currently ships 0.11.1-1
    sed -i -e 's:project_generator>=0.8.0,<0.9.0:project_generator>=0.8,<1.0:' setup.py

    # Arch community currently ships 0.4.4-6
    sed -i -e 's:colorama>=0.3,<0.4:colorama>=0.3,<0.5:' setup.py

    patch --forward --strip=1 --input="${srcdir}/3c5f25f3bb6b05c35895a7a17f37d466011001b9.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
