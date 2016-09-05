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
        'etc/webapps/atlassian-confluence/server.xml')
install='confluence.install'
source=("http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-$pkgver.tar.gz"
        'confluence.conf.d'
        'confluence.service')
sha256sums=('4a080e3c9940240154f6a35a013a353e4f8ea00cc6992dad07097a29320d631f'
            'a6304ba13a8ab1e27761bd3be71d05d2c2e3d61ea308316f4a04723ea4b30fc1'
            'd51ad7cb3eb8a4d5553a26fd5567867345bb4ae9a10876fc2bee7b6ab8800824')

package() {
    mkdir -p "$pkgdir/opt/atlassian-confluence/"
    cp -r "$srcdir/atlassian-confluence-$pkgver/"* "$pkgdir/opt/atlassian-confluence/"

    # remove unneeded *.bat files
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.bat' -type f -exec rm "{}" \;

    # Set home dir
    echo "confluence.home=/var/opt/atlassian-confluence" > "$pkgdir/opt/atlassian-confluence/confluence/WEB-INF/classes/confluence-init.properties"

    # Move server.xml to /etc and create symlink
    mkdir -p "${pkgdir}/etc/webapps/atlassian-confluence"
    mv "${pkgdir}/opt/atlassian-confluence/conf/server.xml" "${pkgdir}/etc/webapps/atlassian-confluence/server.xml"
    ln -s "/etc/webapps/atlassian-confluence/server.xml" "${pkgdir}/opt/atlassian-confluence/conf/server.xml"

    # Create home directory
    install -dm755 "$pkgdir/var/opt/atlassian-confluence"

    # Install systemd unit
    install -Dm644 "$srcdir/confluence.service" "$pkgdir/usr/lib/systemd/system/confluence.service"
    install -Dm644 "$srcdir/confluence.conf.d" "$pkgdir/etc/conf.d/confluence"
}
