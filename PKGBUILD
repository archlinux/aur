# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=commonist
pkgver=1.10.0
pkgrel=1
pkgdesc='A file upload tool for mediawiki using its api.php interface'
url="https://commons.wikimedia.org/wiki/Commons:Commonist"
arch=('any')
license=('GPL3')
depends=('java-environment' 'bash')
makedepends=('sbt')
source=("https://github.com/ritschwumm/$pkgname/archive/v-$pkgver.tar.gz")
sha256sums=('208fd0133b1ade9db245133ec7438c107d98094f168e88d289ac2093af5c7a0b')

prepare()
{
    deps=(
        'https://github.com/ritschwumm/xsbt-util'
        'https://github.com/ritschwumm/xsbt-classpath'
        'https://github.com/ritschwumm/xsbt-webstart'
        'https://github.com/ritschwumm/xsbt-scriptstart'
        'https://github.com/ritschwumm/xsbt-osxapp'
        'https://github.com/ritschwumm/xsbt-capsule'
        'https://github.com/ritschwumm/scutil'
        'https://github.com/ritschwumm/scjson'
    )

    for dep in ${deps[*]}
    do
        if [ ! -e $(basename $dep) ]
        then
            git clone $dep
        fi

        cd $(basename $dep)
        sbt publishLocal
        cd -
    done
}

build()
{
    cd "$pkgname-v-$pkgver"

    sbt bundle
}

package()
{
    cd "$pkgname-v-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/lib/commonist"
    install --mode 644 target/scala-2.12/scriptstart/commonist-$pkgver/lib/*.jar "$pkgdir/usr/lib/commonist"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 target/scala-2.12/scriptstart/commonist-$pkgver/commonist "$pkgdir/usr/bin"

    cd "$pkgdir"
    patch -Np1 -i "${srcdir}/../commonist.patch"
}
