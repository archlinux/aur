# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=rainbow-git
pkgver=2.7.1.295.8173eef
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
makedepends=('git'
             'python-setuptools'
             'python-jinja')
changelog=Changelog
provides=(rainbow)
conflicts=(rainbow)
source=("${pkgname}::git+https://github.com/nicoulaj/rainbow")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
                    "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgbase}
  python setup.py build
}

package() {
  cd ${pkgbase}

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -v -m755 -d "${pkgdir}/etc/bash_completion.d"
  install -v -m644 build/completion/rainbow "${pkgdir}/etc/bash_completion.d/"

  install -v -m755 -d "${pkgdir}/usr/share/zsh/site-functions"
  install -v -m644 build/completion/_rainbow "${pkgdir}/usr/share/zsh/site-functions/"

  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 build/man/rainbow.1.gz "${pkgdir}/usr/share/man/man1/"
}
