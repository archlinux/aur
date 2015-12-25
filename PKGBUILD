# Maintainer: Sam Whited <sam@samwhited.com>
# Note that this package is in no way officially supported by Atlassian.

pkgname=atlassian-stash
pkgver=4.2.0
pkgrel=1
pkgdesc="Bitbucket Server (Stash)"
url="https://www.atlassian.com/software/bitbucket/server"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-runtime=8'
         'git>=1.8.0'
         'perl>=5.8.8')
backup=('etc/systemd/system/stash.service.d/local.conf'
        'etc/stash/server.xml')
install='atlassian-stash.install'
source=("https://downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-$pkgver.tar.gz"
        'stash.service'
        'stash.tmpfiles'
        'stash.sysusers'
        'local.conf')
sha256sums=('0632382b092105bbc99e580ef1a92e076eed94ac277ad4804e474bf70fa6722c'
            '6c937a9fdb747e04585405244b24fdd49a4e087a76a1b1792107f20c28fa3950'
            'f314c949fd86741ae830d8e97243874a9bf70622ad7c33af2369cc5eb4c17bd9'
            'b8b44f798e8611bfc0e05c07e117c3a4b43cc09a4d53cd401c35d766e2e3f283'
            '6f780ea42987c196e95c5c2f7a0b022b292f16b77f7d7ee10846e8c4bc6da2fa')

package() {
  install -dm750 "$pkgdir/var/lib/stash"
  install -dm755 "$pkgdir/opt/atlassian-stash"
  cp -r "$srcdir/atlassian-bitbucket-$pkgver/"* "$pkgdir/opt/atlassian-stash"
  install -Dm755 "$pkgdir/opt/atlassian-stash/conf/server.xml" "$pkgdir/etc/stash/server.xml"
  rm "$pkgdir/opt/atlassian-stash/conf/server.xml"
  ln -s "/etc/stash/server.xml" "$pkgdir/var/lib/stash/server.xml"
  # remove unneeded Windows files
  find "$pkgdir/opt/atlassian-stash/bin" -name '*.bat' -type f -exec rm "{}" \;
  find "$pkgdir/opt/atlassian-stash/bin" -name '*.exe' -type f -exec rm "{}" \;


  # setup systemd service
  install -Dm644 "$srcdir/stash.service" "$pkgdir/usr/lib/systemd/system/stash.service"
  install -Dm644 "$srcdir/local.conf" "$pkgdir/etc/systemd/system/stash.service.d/local.conf"
  install -Dm644 "$srcdir/stash.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/stash.conf"
  install -Dm644 "$srcdir/stash.sysusers" "$pkgdir/usr/lib/sysusers.d/stash.conf"
}

