# Maintainer: Johannes Frohnmeyer <johannes at frohnmeyer-wds dot de>

_name=inceptum
pkgname=$_name-git
pkgver=0.3.1.r96.g4aa1f24
pkgrel=1
pkgdesc="An advanced minecraft launcher written in java"
arch=("x86_64")
url="https://git.frohnmeyer-wds.de/JfMods/Inceptum"
license=("GPL3")
depends=("java-runtime>=21" 'bash')
makedepends=('git' 'java-environment>=21' 'gradle')
source=(git+"${url}".git
        "$_name.desktop"
        "$_name.sh"
        "$_name.service"
        "$_name.conf")
backup=(etc/conf.d/$_name)
sha256sums=('SKIP'
            '70a6ac8d2cb1c29699aa740b49fac05b2efca85f8de3c8f0b290ee5e077ec726'
            '6867e8476c9eb04cb303f40a4949db227c0c92e94b864d667a2d5a1f1c3d77da'
            '034407520261b79175f0011a5cf1523ef077dad55341c39753501ae4730cb870'
            '41ae84877dd3ce346a7d97fc7f493c8e9dcacfa67ce6974ace56baecee9a8411')

pkgver() {
    git -C Inceptum describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^[vba]//'
}

build() {
    cd Inceptum
    gradle :launcher-dist:build -Prelease --no-daemon
    mv "launcher-dist/build/libs/Inceptum-$(git describe --tags --abbrev=0 | sed 's/^[vba]//')-custom.jar" "../$_name.jar"
}

package() {
    install -Dm644 "$srcdir/$_name.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm755 "$_name.jar" -t "$pkgdir/usr/share/java/$_name"
    install -Dm755 "$_name.sh" "$pkgdir/usr/bin/$_name"

    install -Dm644 "$_name.conf" "$pkgdir/etc/conf.d/$_name"
    echo "u $_name - \"Inceptum\"" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    echo "Z /srv/$_name 2750 $_name $_name" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 "$srcdir/$_name.service" "$pkgdir/usr/lib/systemd/system/$_name.service"
}
