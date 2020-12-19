# Maintainer: Karmanyaah Malhotra <karmanyaahm@gmail.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=dex2jar-git
pkgver=2.1.nightly.28.r13.gd7a86110
pkgrel=1
pkgdesc='Tools to work with android .dex and java .class files, git version'
arch=('i686' 'x86_64')
url='https://github.com/pxb1988/dex2jar'
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=$pkgver")
license=('Apache-2.0')
depends=('java-runtime')
makedepends=('java-environment>=7' 'git' 'gradle')
source=("${pkgname%-git}"::'git+https://github.com/pxb1988/dex2jar')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  gradle clean installDist
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/opt/${pkgname%-git}/bin"
  mkdir -p "$pkgdir/opt/${pkgname%-git}/lib"
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}"

  install -m755 "$srcdir/${pkgname%-git}"/dex-tools/build/install/dex-tools/*.sh "$pkgdir/opt/${pkgname%-git}"
  install -m755 "$srcdir/${pkgname%-git}"/dex-tools/build/install/dex-tools/bin/dex-tools "$pkgdir/opt/${pkgname%-git}/bin"
  install -m644 "$srcdir/${pkgname%-git}"/dex-tools/build/install/dex-tools/lib/* "$pkgdir/opt/${pkgname%-git}/lib"
  install -m644 "$srcdir/${pkgname%-git}"/dex-tools/build/install/dex-tools/NOTICE.txt "$pkgdir/opt/${pkgname%-git}"
  install -m644 "$srcdir/${pkgname%-git}"/dex-tools/build/install/dex-tools/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname%-git}"

  for i in $(ls "$pkgdir"/opt/"${pkgname%-git}"/*.sh); do
    f=$(basename $i)
    ln -s "/opt/${pkgname%-git}/$f" "$pkgdir/usr/bin/${f%.sh}"
  done

  ln -s "d2j-dex2jar" "$pkgdir/usr/bin/dex2jar"
}
