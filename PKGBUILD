# Maintainer: Sam Whited <swhited@atlassian.com>
# Note that this package is in no way officially supported by Atlassian.
# TODO: Put the config elsewhere (/etc/crucible maybe?)

pkgname=atlassian-crucible
pkgver=3.10.2
pkgrel=1
pkgdesc="Enterprise code review"
url="https://www.atlassian.com/software/crucible"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-runtime=8')
backup=('etc/conf.d/crucible'
        'opt/atlassian-crucible/config.xml')
install='atlassian-crucible.install'
source=("https://www.atlassian.com/software/crucible/downloads/binary/crucible-$pkgver.zip"
        'crucible.service'
				'crucible.tmpfiles'
				'crucible.sysusers'
				'crucible.conf.d'
)
sha256sums=('2470c3eb70080f660a9346dfb12f86ebd1f0bb1ff1a5ead319564a679d00d879'
            '0c1960f323a9e65a96bbcfbcd48e7ca7705aba521fe40b584245fa22f9acca99'
            '9a8d5dd8e9e9f2a5c335baf1b9757702b03bb90e5011729d09c6bf64401bbd95'
            'f0b37aacb84738e901a29bf0582ae1cd8ac352a80ffc348f8319909a7326f337'
            'b7e4d9da50776322381bbf31b03b4e05075a5983b383d07f8bcc470503198a4d')

package() {
  mkdir -p "$pkgdir/opt/atlassian-crucible/"
  cp -r "$srcdir/fecru-$pkgver/"* "$pkgdir/opt/atlassian-crucible/"
  # remove unneeded Windows files
  find "$pkgdir/opt/atlassian-crucible/bin" -name '*.bat' -type f -exec rm "{}" \;
  find "$pkgdir/opt/atlassian-crucible/bin" -name '*.exe' -type f -exec rm "{}" \;

  # setup systemd service
  install -dm755 "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/crucible.service" "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/crucible.conf.d" "$pkgdir/etc/conf.d/crucible"
}

