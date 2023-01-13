# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=redhat-fonts
pkgver=4.0.3
pkgrel=1
pkgdesc="Red Hat fonts"
arch=('any')
url="https://github.com/RedHatOfficial/RedHatFont"
# Only the metainfo files are CC-BY-SA
license=('OFL' 'CC-BY-SA')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '64-redhat-display-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/rawhide/f/64-redhat-display-fontconfig.conf'
        '64-redhat-mono-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/rawhide/f/64-redhat-mono-fontconfig.conf'
        '64-redhat-text-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/rawhide/f/64-redhat-text-fontconfig.conf')
sha256sums=('95e9eaa3bbbb343d0d4bc519d18a216651c73b0ab191ab5532a3cb370120b2b2'
            '451c0fd89bf923862060d6a666d12d03be5eb6f119e35b2ddcdd9e83f33a83bf'
            'd9a078708993bed0b6511fcbba8ef07b12e50bb0cf76c86b77f032e50f9b5129'
            '194ae2c929734b7fe001b89e8c88684e8331a05b9df8c27a58ce2504307b53b7')

package() {
  cd RedHatFont-$pkgver

  # Install fonts
  install -m 0755 -d "$pkgdir/usr/share/fonts/redhat"
  install -m 0644 -p fonts/*/static/otf/*.otf "$pkgdir/usr/share/fonts/redhat"
  install -m 0644 -p fonts/*/static/ttf/*.ttf "$pkgdir/usr/share/fonts/redhat"
  install -m 0644 -p fonts/*/*.ttf "$pkgdir/usr/share/fonts/redhat"

  # Install fontconfig data
  install -m 0755 -d "$pkgdir/etc/fonts/conf.d" "$pkgdir/usr/share/fontconfig/conf.avail"
  install -m 0644 -p ../64-redhat-display-fontconfig.conf "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-display.conf"
  install -m 0644 -p ../64-redhat-mono-fontconfig.conf "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-mono.conf"
  install -m 0644 -p ../64-redhat-text-fontconfig.conf "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-text.conf"

  for fconf in 64-redhat-display.conf 64-redhat-mono.conf 64-redhat-text.conf; do
    ln -s /usr/share/fontconfig/conf.avail/$fconf $pkgdir/etc/fonts/conf.d/$fconf
  done

  # Install AppStream metadata
  install -m 0755 -d "$pkgdir/usr/share/metainfo"
  install -m 0644 -p metainfo/*.metainfo.xml "$pkgdir/usr/share/metainfo"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 metainfo/LICENSE-METAINFO "$pkgdir/usr/share/licenses/$pkgname/LICENSE-METAINFO"
}
