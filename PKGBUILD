# Maintainer: Dennis S. <dennis@stengele.me>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=atlassian-confluence
pkgver=5.10.4
pkgrel=1
pkgdesc="Enterprise wiki"
url="https://www.atlassian.com/software/confluence"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-runtime=8')
optdepends=('mysql-connector-java: connect to MySQL'
            'libcups: used by bin/config.sh'
            'fontconfig: used by bin/config.sh')
backup=('etc/conf.d/confluence'
        'opt/atlassian-confluence/conf/server.xml'
        'opt/atlassian-confluence/confluence/WEB-INF/classes/confluence-init.properties')
install='confluence.install'
source=("http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-$pkgver.tar.gz"
        'confluence.conf.d'
        'confluence.service')
sha256sums=('4a080e3c9940240154f6a35a013a353e4f8ea00cc6992dad07097a29320d631f'
            'a6304ba13a8ab1e27761bd3be71d05d2c2e3d61ea308316f4a04723ea4b30fc1'
            '7097bd9dbd42f74c601182ff60e523b4bde76528a32f09ec16e72cafa577994a')

package() {
    mkdir -p "$pkgdir/opt/atlassian-confluence/"
    cp -r "$srcdir/atlassian-confluence-$pkgver/"* "$pkgdir/opt/atlassian-confluence/"

    # Cleanup
    # remove unneeded *.bat files
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.bat' -type f -exec rm "{}" \;

    # Set Home dir
    echo "confluence.home=/var/opt/atlassian-confluence" > "$pkgdir/opt/atlassian-confluence/confluence/WEB-INF/classes/confluence-init.properties"

    # Create home directory
    install -dm644 "$pkgdir/var/opt/atlassian-confluence"
    # Install systemd unit
    install -Dm644 "$srcdir/confluence.service" "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$srcdir/confluence.conf.d" "$pkgdir/etc/conf.d/confluence"
}
