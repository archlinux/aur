# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: KillYourTV <killyourtv@i2pmail.org>

########[ OPTIONS ]########################################
# Build syndie with i2p.jar from kytv's debian mirror.
# Useful if you dont want to build i2p just to install syndie.
_external_i2p=1
_i2p_ver=0.9.27-1-1ubuntu1
###########################################################

pkgname=syndie
pkgver=1.107b
pkgrel=1
pkgdesc="Java based open source system for operating secure distributed forums"
license=('Public Domain')
url="http://syndie.i2p2.de"
arch=('any')
depends=('java-runtime' 'swt')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('words: for spelling correction support')
source=("${url}/files/${pkgname}-${pkgver}.src.tar.bz2"{,.sig}
        'syndie.desktop' 'syndie.xpm' 'syndie.sh')

sha256sums=('441cdd79ab8ad5cae73fceb8c548441493a210ada1550a00923d6c9dd539a214'
            'SKIP'
            'a4711e9876f8e185a5de84976f2b5a72a8890329c86688ffa583ae8741ecc6cc'
            '552d02ae3724d969e668996b67d0d7b1d70f39bf03ad43287073511696c995f7'
            'a3e9d28f4e2da66cf91b4f1e57bf902dcd091ac1b97dadd9ec819f383cd83df8')

validpgpkeys=('97C6EEFB60D38EA4C1BE33FFABE0C319DF0A0A1A'
              '2D3D2D03910C6504C1210C65EE60C0C8EE7256A8')

if [[ "$_external_i2p" = 1 ]]; then
    source+=("https://launchpad.net/~i2p-maintainers/+archive/ubuntu/i2p/+files/i2p-router_${_i2p_ver}_all.deb")
    sha256sums+=('2ddded8d99d7fbb8cbbbac87a347f451e93f6f12a9ab9b763c1f53e60ef8c70b')
    _i2p_path="../usr/share/i2p/lib/i2p.jar"
else
    makedepends+=('i2p')
fi

prepare() {
    cd "$pkgname-$pkgver"
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh
    export LG2=en

    [[ "$_external_i2p" = 1 ]] &&
        ( cd .. ; bsdtar -xf "${srcdir}/data.tar.xz" )

    sed -i build.properties \
        -e "s|#lib.dir=|lib.dir=/usr/share/java|" \
        -e "s|#hsqldb.jar=|hsqldb.jar=lib/hsqldb.jar|" \
        -e "s|#i2p.jar=|i2p.jar=${_i2p_path:-/opt/i2p/lib/i2p.jar}|"
    sed -i build.xml \
        -e 's|target="1.5"|target="1.7"|' \
        -e 's|(mtn rev |(|' \
        -e 's|workspace.version" value="unknown"|workspace.version" value="ArchLinux AUR"|'
}

build() {
    cd "$pkgname-$pkgver"
    ant singlejar
}

package(){
    cd "$pkgname-$pkgver"
    install -Dm644 "LICENSE"                "$pkgdir/usr/share/licenses/syndie/LICENSE"
    install -Dm644 "syndie.jar"             "$pkgdir/usr/share/syndie/syndie.jar"
    install -Dm644 "doc/syndie.1"           "$pkgdir/usr/share/man/man1/syndie.1"
    install -Dm644 "$srcdir/syndie.xpm"     "$pkgdir/usr/share/pixmaps/syndie.xpm"
    install -Dm644 "$srcdir/syndie.desktop" "$pkgdir/usr/share/applications/syndie.desktop"
    install -Dm755 "$srcdir/syndie.sh"      "$pkgdir/usr/bin/syndie"
}
