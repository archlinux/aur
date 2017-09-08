# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
pkgname=deepgit-preview
pkgver=3.preview.3
pkgrel=1
pkgdesc="A tool to investigate the history of source code. This is preview software intended to provide you with an opportunity to test-drive new builds of the next DeepGit release."
arch=('any')
url="http://www.syntevo.com/deepgit/preview"
license=('custom')
depends=(
    'java-environment>=8'
    'hicolor-icon-theme'
    'bash'
)
conflicts=('deepgit')

source=(
    "http://www.syntevo.com/static/smart/download/deepgit/deepgit-linux-${pkgver//./-}.tar.gz"
    "deepgit.desktop"
    "deepgit.sh.patch"
)
sha1sums=('f2f25c4d9ad8bb1e3acc4de1cbb9291ba68f32d6'
          '8ab2e36b3cb2e6f7b5af70a4ddbe2e9d307d3988'
          '01b2845c29b507d011ac251625a746b7bd03b11f')

prepare() {
    patch -uN "$srcdir/deepgit/bin/deepgit.sh" "$srcdir/deepgit.sh.patch"
}

package() {
    cd $srcdir/deepgit

    # Executable
    install -T -Dm 755 bin/deepgit.sh "$pkgdir/usr/bin/deepgit"
    
    # Runtime
    install -m 644 -Dt "$pkgdir/usr/share/java/$pkgname/lib/" lib/*

    # Settings
    install -Dt "$pkgdir/etc/$pkgname/" bin/deepgit.vmoptions 

    # Copy license
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" license.html
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" licenses/*

    # Desktop file
    install -Dm 644 -t "$pkgdir/usr/share/applications/" "$srcdir/deepgit.desktop"

    # Copy other stuff to /usr/share/$pkgname/
    install -m 644 -Dt "$pkgdir/usr/share/$pkgname" changelog.txt known-issues.txt readme-linux.txt

    # Install some icons
    cd "$srcdir/deepgit/bin"
    for size in 32 48 64 128 256
    do
        install -Dm 644 -T deepgit-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deepgit.png"
    done
}
