# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lance Chen <cyen0312@gmail.com>

pkgname=enjarify-git
pkgver=1.0.2.57.2a94b40
pkgrel=1
pkgdesc='Translates Dalvik bytecode to equivalent Java bytecode'
url='https://github.com/google/enjarify'
arch=('any')
license=('Apache')
depends=("python")
makedepends=('git')
provides=('enjarify')
conflicts=('enjarify')
source=(${pkgname}::git+https://github.com/google/enjarify)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -r 's| -Xss515m||g' -i enjarify/runtests.py
  sed 's|for bits in range(256):|for opts in [options.NONE, options.PRETTY, options.ALL]:|' -i enjarify/hashtests.py
  sed '/options.Options/d' -i enjarify/hashtests.py
  sed 's|bits|0|g' -i enjarify/hashtests.py
}

build() {
  cd ${pkgname}
  python -m compileall .
  python -O -m compileall .
}

check() {
  cd ${pkgname}
  LC_CTYPE=en_US.UTF-8 python -m enjarify.hashtests
}

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/lib/enjarify"
  cp -R enjarify enjarify.sh "${pkgdir}/usr/lib/enjarify"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/enjarify/enjarify.sh "${pkgdir}/usr/bin/enjarify"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
