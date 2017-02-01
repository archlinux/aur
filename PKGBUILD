# Maintainer: archlinux.info:tdy

pkgname=circos
pkgver=0.69_4
pkgrel=1
pkgdesc="A software package for visualizing data in a circular layout"
arch=(any)
url=http://circos.ca
license=(GPL)
depends=(
  perl-carp
  perl-clone
  perl-config-general
  perl-data-dumper
  perl-digest-md5
  perl-file-temp
  perl-font-ttf
  perl-gd
  perl-getopt-long
  perl-list-moreutils
  perl-math-bezier
  perl-math-round
  perl-math-complex
  perl-math-vecstat
  perl-memoize
  perl-params-validate
  perl-pod-usage
  perl-readonly
  perl-regexp-common
  perl-set-intspan
  perl-statistics-basic
  perl-storable
  perl-svg
  perl-text-balanced
  perl-text-format
  perl-time-hires
)
optdepends=('circos-docs: tutorials'
            'circos-tools: addons')
source=(http://$pkgname.ca/distribution/$pkgname-${pkgver/_/-}.tgz)
noextract=($pkgname-${pkgver/_/-}.tgz)
sha256sums=(26cde7700e797643d8edd647329be4ebdfe87691cb8e4b082078cd910f22ca92)

package() {
  # dist
  bsdtar -xf $pkgname-${pkgver/_/-}.tgz -C "$pkgdir" \
    -s ":^$pkgname-${pkgver/_/-}:opt/$pkgname:" \
    $pkgname-${pkgver/_/-}/{bin,data,error,etc,example,fonts,lib,tiles}

  # docs
  bsdtar -xf $pkgname-${pkgver/_/-}.tgz -C "$pkgdir" \
    -s ":^$pkgname-${pkgver/_/-}:usr/share/doc/$pkgname:" \
    $pkgname-${pkgver/_/-}/{README,CITATION}

  # sanitize
  rm -f "$pkgdir"/opt/$pkgname/bin/{$pkgname.exe,compile.{bat,make}}
  find "$pkgdir" -exec sh -c \
    "file '{}' | grep -qE 'ELF|executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
  chown -R root:root "$pkgdir"

  # symlinks
  install -m 755 -d "$pkgdir"/usr/bin/
  ln -sf /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/
  ln -sf /opt/$pkgname/bin/gddiag "$pkgdir"/usr/bin/
}
