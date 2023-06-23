# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=fastqc
_pkgname=FastQC
pkgver=0.12.1
pkgrel=4
pkgdesc='A quality control tool for high throughput sequence data.'
arch=('any')
url="https://www.bioinformatics.babraham.ac.uk/projects/fastqc"
license=('GPL3')
depends=('perl' 'java-runtime>=11' 'ttf-dejavu')
makedepends=('ant' 'java-environment>=11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s-andrews/FastQC/archive/refs/tags/v${pkgver}.tar.gz"
        "fastqc.sh"
        "$pkgname.patch::https://github.com/s-andrews/FastQC/commit/e73f094ec165882cc71707a5dd5d3dd263a51b83.patch")
sha256sums=('cad8bfd11ecf388204c28a62b162dda032aac8ecd08819c49b053aa66613e92b'
            'e1b8e3d5ef1b5804af65f888edbd89c98018b8b43fc114e7cc6bada741c9a352'
            '61cdeadcc3f2885a4aa5412ea2b215364f279ffc5aecec513afa2bc00c182c15')
prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i "../$pkgname.patch"
}
build() {
  cd $_pkgname-$pkgver
  # use latest available java
  local _javaenv="$(archlinux-java status | tail -n +2 | cut -d ' ' -f 3 | sort -nk 2 -t - | tail -n 1)"
  JAVA_HOME="/usr/lib/jvm/$_javaenv" ant
}
package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$_pkgname-$pkgver/bin"/* "$pkgdir/usr/share/$pkgname/"
  chmod 755 "$pkgdir/usr/share/$pkgname/fastqc"

  install -Dm755 fastqc.sh "$pkgdir/usr/bin/fastqc"
}
