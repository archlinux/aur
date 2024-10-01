# Maintainer: Bigshans <wo199710@hotmail.com>
_pkgname=debugtron
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
provides=("debugtron")
conflicts=("debugtron")
pkgdesc="Debug in-production Electron based app"
arch=("x86_64")
url="https://github.com/bytedance/debugtron"
license=('MIT')
makedepends=(
  "yarn"
  "python-distutils-extra"
  "node-gyp"
  "zip"
)
source=("${_pkgname}.zip::https://codeload.github.com/pd4d10/debugtron/zip/refs/tags/v${pkgver}-alpha.0"
        "${_pkgname}.desktop"
        "0001-fix-fix-some-bugs-for-linux.patch"
        "pack.patch")
sha256sums=('a4697a1871bf336ad67e1ce13a075240e7a4aad1e78fc4e287a657b0fed1a051'
            'b3370dc82b46ceb874c6dccf643c4ea8c0581b10ba4a13dfb96e1a03b0c2d569'
            '01fa73f055c086987d7a05561fa4a2e3b5e092b008f74920600cf3bc9f92529f'
            'a7084fd55e2e9216fab43c6086fb49412e68f2ee098c8118eb0cf5865dfd083d')

prepare() {
    cd ./${pkgname}-${pkgver}-alpha.0
    patch -Np1 -i ../0001-fix-fix-some-bugs-for-linux.patch
    patch -Np1 -i ../pack.patch

}

build() {
    cd ./${pkgname}-${pkgver}-alpha.0
    yarn install
    yarn make
}

package() {
    install -d "$pkgdir"/usr/lib/$_pkgname
    install -d "$pkgdir"/usr/share/applications
    install -d "$pkgdir"/usr/bin
    cat >> "$pkgdir"/usr/bin/${_pkgname} << EOD
#!/bin/sh
/usr/lib/debugtron/debugtron "\$@"
EOD
    chmod +x "$pkgdir"/usr/bin/${_pkgname}
    install -Dm644 $srcdir/$_pkgname.desktop "$pkgdir"/usr/share/applications/${_pkgname}.desktop
    cp -R --no-preserve=ownership --preserve=mode "$srcdir"/${pkgname}-${pkgver}-alpha.0/out/Debugtron-linux-x64/* "$pkgdir"/usr/lib/${_pkgname}
}
