# Maintainer: Laszlo Malina <laszlo.malina at domaintank dot hu>
# Contributor: silvermonk <frank AT apsu DOT be>

pkgname=geoipupdate
pkgver=4.2.2
pkgrel=1
pkgdesc="The GeoIP Update program performs automatic updates of GeoIP2 and GeoIP Legacy binary databases."
license=('Apache')
arch=('x86_64')
url="http://dev.maxmind.com/geoip/geoipupdate"
changelog=$pkgname.changelog
provides=(geoipupdate)
install=geoipupdate.install

source=(
    "https://github.com/maxmind/geoipupdate/releases/download/v${pkgver}/geoipupdate_${pkgver}_linux_amd64.tar.gz"
    "geoipupdate.install"
    "geoipupdate.service"
    "geoipupdate.timer"
)

sha512sums=(
    'cd946f05ace71ddfc368db00dd4d3ae378f6ac311cf7d7af7afb6fa6420ba50d2a0e1bdce42ad53e2ae8ef1e1644c47ba405859e31f335e0265ff3babbc6a5ab'
    '9283bffa892889a406c5c80d8d08a127de0d65015352d71bc6444f3c83724b2baf9e7ae77690b1fd0070c8fb9ff921b235d17ebaa832e26b79237b314d5a527b'
    '8eac86cdaac1796548b1cad24a6dcfbf8dd7a410eefd9dec74fc9775248f1a6fe68be0fd2b8ffcc6b5ab74380d988a7407b3cf889aee32d43ca79ad3a3686aab'
    '1d865e31eccd7597093df83da05f3866a361e9f68bcc1f1fa10d72cc2fae8a789d9c2cee445cf81f2384a3415ebd12d2c485d6dfe8401ea005f7c111a6331dd2'
)


build() {
  softdir="$srcdir/geoipupdate_${pkgver}_linux_amd64"
  sed -i 's/# DatabaseDirectory \/usr\/local\/share\/GeoIP/DatabaseDirectory \/usr\/share\/GeoIP/g' "$softdir/GeoIP.conf"
  sed -i 's/# LockFile \/usr\/local\/share\/GeoIP\/\.geoipupdate\.lock/LockFile \/usr\/share\/GeoIP\/\.geoipupdate\.lock/g' "$softdir/GeoIP.conf"
}

package() {
    softdir="$srcdir/geoipupdate_${pkgver}_linux_amd64"
    cd $softdir

    mkdir -p "$pkgdir/etc"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/GeoIP"
    mkdir -p "$pkgdir/usr/share/doc/geoipupdate"

    cp "$softdir/geoipupdate" "$pkgdir/usr/bin/"
    cp "$softdir/GeoIP.conf" "$pkgdir/etc/"
    cp "$srcdir/geoipupdate.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$srcdir/geoipupdate.timer"   "$pkgdir/usr/lib/systemd/system/"

    cp "$softdir/CHANGELOG.md"   "$pkgdir/usr/share/doc/geoipupdate/"
    cp "$softdir/GeoIP.conf"   "$pkgdir/usr/share/doc/geoipupdate/"
    cp "$softdir/GeoIP.conf.md"   "$pkgdir/usr/share/doc/geoipupdate/"
    cp "$softdir/LICENSE-APACHE"   "$pkgdir/usr/share/doc/geoipupdate/"
    cp "$softdir/LICENSE-MIT"   "$pkgdir/usr/share/doc/geoipupdate/"
    cp "$softdir/geoipupdate.md"   "$pkgdir/usr/share/doc/geoipupdate/"
}
