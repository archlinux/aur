# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Dennis Stengele <dennis@schuppentier.org>
# Contributor: rob2uk <rob22uk at gmail dot com>
# Contributor: Vlad <vlad@archlinux.net>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=atlassian-jira-lts
pkgver=8.5.7
pkgrel=1
epoch=1
pkgdesc="Bug tracking, issue tracking and project management software (Enterprise Release)"
url="https://www.atlassian.com/software/jira"
license=('custom')
arch=('any')
conflicts=('atlassian-jira')
depends=('java-environment=8')
optdepends=('mysql-connector-java: connect to MySQL')
backup=('etc/conf.d/jira'
        'etc/webapps/atlassian-jira/server.xml')
install='jira.install'
source=("https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-core-${pkgver}.tar.gz"
        'jira.conf.d'
        'jira.service')
sha256sums=('969158d953f08c6a74f37bfe8422bf1e1e036321ceebb9c7b78b87a984cd06d5'
            '457fd1c5bcedc81e64f71cb890b600944a5be7980716b7f49f9a8c810565dbfb'
            'd61181154183301a551b1ae85a7d42c7d60ae2c36e545d2ab8ef5cc969def717')

package() {
    mkdir -p "$pkgdir/opt/atlassian-jira/"
    cp -r "$srcdir/atlassian-jira-core-$pkgver-standalone/"* "$pkgdir/opt/atlassian-jira/"

    # Copy License
    mkdir -p "${pkgdir}/usr/share/licenses/atlassian-jira"
    cp "${pkgdir}/opt/atlassian-jira/licenses/com.atlassian.ip--atlassian-ip--3.0.txt" "${pkgdir}/usr/share/licenses/atlassian-jira/LICENSE"

    # remove unneeded files
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.bat' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.exe' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.dll' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.x64' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.sh' -type f -exec rm "{}" \;
    find "$pkgdir/opt/atlassian-jira/bin" -name '*.command' -type f -exec rm "{}" \;

    # Set home dir
    echo "jira.home=/var/opt/atlassian-jira" > "$pkgdir/opt/atlassian-jira/atlassian-jira/WEB-INF/classes/jira-application.properties"

    # Move server.xml to /etc and create symlink
    mkdir -p "${pkgdir}/etc/webapps/atlassian-jira"
    mv "${pkgdir}/opt/atlassian-jira/conf/server.xml" "${pkgdir}/etc/webapps/atlassian-jira/server.xml"
    ln -s "/etc/webapps/atlassian-jira/server.xml" "${pkgdir}/opt/atlassian-jira/conf/server.xml"

    # Create home directory
    install -dm755 "$pkgdir/var/opt/atlassian-jira"

    # Install systemd unit
    install -Dm644 "$srcdir/jira.service" "$pkgdir/usr/lib/systemd/system/jira.service"
    install -Dm644 "$srcdir/jira.conf.d" "$pkgdir/etc/conf.d/jira"
}
