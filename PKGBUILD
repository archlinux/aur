# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=commonist
pkgver=1.9.0
pkgrel=1
pkgdesc='A file upload tool for mediawiki using its api.php interface'
url="https://commons.wikimedia.org/wiki/Commons:Commonist"
arch=('any')
license=('GPL3')
depends=('java-environment' 'bash')
makedepends=('sbt')
source=("https://github.com/ritschwumm/$pkgname/archive/v-$pkgver.tar.gz")
sha256sums=('dda17d59f8824fd01c49d8516969e592a7425e64ec459a88d606e345f3f054e6')

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
    install --mode 644 target/scala-2.12/scriptstart/commonist-1.9.0/lib/*.jar "$pkgdir/usr/lib/commonist"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 target/scala-2.12/scriptstart/commonist-1.9.0/commonist "$pkgdir/usr/bin"

    cd "$pkgdir"
    patch -Np1 -i "${srcdir}/../commonist.patch"
}
