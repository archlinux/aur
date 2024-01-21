# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Robert Gonciarz <goncairz (malpa) gmail (kropka) com>
# Maintainer: Kevin Baxmann <kvbx@kvbx.de>
# Maintainer: Enzo Mallard <enzo+aur@mallard.ml>

pkgname=micronaut
pkgver=4.2.3
pkgrel=1
pkgdesc="Application Framework"
arch=('x86_64')
url="https://github.com/micronaut-projects/micronaut-starter"
license=(Apache)
depends=('java-environment>=8')
makedepends=('unzip')
source=(https://github.com/micronaut-projects/micronaut-starter/archive/v${pkgver}.tar.gz)
sha512sums=('f64b75fb559f8bd29a54cfdd2fd7b0e47c389dff750f88711f6f31e6e3152f0a7d8702afd6f584ce9af2902df308daff26c85fb0c33b2088d077d66bed1ec75e')

build() {

  function build_failed {
    if [ "$?" != "0" ]; then
      tput bold
      echo
      echo "Building may have failed due to an incompatible JDK."
      echo "Please set JAVA_HOME to a JDK compatible with gradle 8.3 (between 8 and 20)."
      echo "(e.g. install 'jdk8-openjdk' and run 'archlinux-java set java-8-openjdk')"
      echo "After building the package you may set it back to a newer version"
      echo
      tput sgr0
    fi
  }

  trap build_failed EXIT

  cd "$srcdir/micronaut-starter-$pkgver"
  ./gradlew micronaut-cli:assembleDist

  unzip "starter-cli/build/distributions/$pkgname-cli-$pkgver.zip"
}

package() {
  cd "$srcdir/micronaut-starter-$pkgver"

  install -dm755 "$pkgdir"/usr/lib/$pkgname/lib
  install -Dm644 -t "$pkgdir"/usr/lib/$pkgname/lib "$pkgname-cli-$pkgver"/lib/*
  install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgname-cli-$pkgver/bin/mn"

  install -Dm644 "$pkgname-cli-$pkgver/bin/mn_completion" "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  install -Dm644 "$pkgname-cli-$pkgver/bin/mn_completion" "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$pkgname-cli-$pkgver/LICENSE"

  sed -i "s|^APP_HOME.*$|APP_HOME=/usr/lib/$pkgname|" "$pkgdir"/usr/bin/mn
}

# vim:set ts=2 sw=2 et:
