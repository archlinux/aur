# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Dennis S. <dennis@stengele.me>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=atlassian-confluence
pkgver=7.7.3
pkgrel=1
pkgdesc="Enterprise wiki"
url="https://www.atlassian.com/software/confluence"
license=('custom')
arch=('any')
conflicts=('atlassian-confluence-lts')
depends=('java-environment=8')
optdepends=('mysql-connector-java: connect to MySQL')
backup=('etc/conf.d/confluence'
        'etc/webapps/atlassian-confluence/server.xml')
install='confluence.install'
source=("http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-$pkgver.tar.gz"
        'confluence.conf.d'
        'confluence.service')
sha256sums=('8700940f48afc52b62f3bedda93236811d0d14f5a7b67b1913743f9df754be09'
            'a6304ba13a8ab1e27761bd3be71d05d2c2e3d61ea308316f4a04723ea4b30fc1'
            'd51ad7cb3eb8a4d5553a26fd5567867345bb4ae9a10876fc2bee7b6ab8800824')

package() {
    mkdir -p "$pkgdir/opt/atlassian-confluence/"
    cp -r "$srcdir/atlassian-confluence-$pkgver/"* "$pkgdir/opt/atlassian-confluence/"

    # Copy License
    mkdir -p "${pkgdir}/usr/share/licenses/atlassian-confluence"
    cp "${pkgdir}/opt/atlassian-confluence/LICENSE" "${pkgdir}/usr/share/licenses/atlassian-confluence/LICENSE"

    # remove unneeded files
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.bat' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.exe' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.dll' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.x64' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.sh' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-confluence/bin" -name '*.command' -type f -exec rm "{}" \;

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
