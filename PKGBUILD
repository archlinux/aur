# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=redhat-fonts
pkgver=2.3.0
pkgrel=1
pkgdesc="Red Hat fonts"
arch=('any')
url="https://github.com/RedHatOfficial/RedHatFont"
# Only the metainfo files are CC-BY-SA
license=('OFL' 'CC-BY-SA')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '0001-Add-basic-AppStream-metainfo-data.patch::https://src.fedoraproject.org/rpms/redhat-fonts/raw/master/f/0001-Add-basic-AppStream-metainfo-data.patch'
        '64-redhat-display-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/master/f/64-redhat-display-fontconfig.conf'
        '64-redhat-text-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/master/f/64-redhat-text-fontconfig.conf')
sha256sums=('0501b57edb28b7355b6ae8fa79f5cb10821e5a8da3417af1e325b9d576f011cc'
            '67a145933bb59045bcb3fb2f587587f01efecbac985438768957253e6b7f8707'
            '451c0fd89bf923862060d6a666d12d03be5eb6f119e35b2ddcdd9e83f33a83bf'
            '194ae2c929734b7fe001b89e8c88684e8331a05b9df8c27a58ce2504307b53b7')

prepare() {
  cd RedHatFont-$pkgver
  # Patches proposed upstream
  # From: https://github.com/RedHatOfficial/RedHatFont/pull/16
  patch -Np1 -i ../0001-Add-basic-AppStream-metainfo-data.patch
}

package() {
  cd RedHatFont-$pkgver

  # Install fonts
  install -m 0755 -d "$pkgdir/usr/share/fonts/redhat"
  install -m 0644 -p OTF/*.otf "$pkgdir/usr/share/fonts/redhat"
  install -m 0644 -p TTF/*.ttf "$pkgdir/usr/share/fonts/redhat"

  # Install fontconfig data
  install -m 0755 -d "$pkgdir/etc/fonts/conf.d" "$pkgdir/usr/share/fontconfig/conf.avail"
  install -m 0644 -p ../64-redhat-display-fontconfig.conf "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-display.conf"
  install -m 0644 -p ../64-redhat-text-fontconfig.conf "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-text.conf"

  for fconf in 64-redhat-display.conf 64-redhat-text.conf; do
    ln -s /usr/share/fontconfig/conf.avail/$fconf $pkgdir/etc/fonts/conf.d/$fconf
  done

  # Install AppStream metadata
  install -m 0755 -d "$pkgdir/usr/share/metainfo"
  install -m 0644 -p metainfo/*.metainfo.xml "$pkgdir/usr/share/metainfo"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 metainfo/LICENSE-METAINFO "$pkgdir/usr/share/licenses/$pkgname/LICENSE-METAINFO"
}
