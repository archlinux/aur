# Maintainer: Jake Howard <aur at theorangeone dot net>
pkgname=heroku-audit
pkgver=0.0.3
pkgrel=1
pkgdesc="Command-line tool for reporting on specific attributes of a Heroku environment."
url="https://github.com/torchbox/heroku-audit"
license=('BSD')
arch=('x86_64')
depends=(zlib readline xz openssl glibc expat bzip2 libffi util-linux-libs ncurses mpdecimal)
source=("https://github.com/torchbox/heroku-audit/archive/${pkgver}.tar.gz")
makedepends=(python-build python-wheel)
sha256sums=('69514c421d3d626db8a9f6ddb7441ba49cb3c970855e5a865488ed1a5adacc49')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Create a temporary virtualenv to install the build dependencies in
  python -m venv venv
  source venv/bin/activate

  pip install -e . pyinstaller

  venv/bin/pyinstaller -D --strip heroku_audit/__main__.py --name heroku-audit --clean --noconfirm
}

check() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./dist/heroku-audit/heroku-audit --version > /dev/null
  ./dist/heroku-audit/heroku-audit --list > /dev/null
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  mkdir -p "${pkgdir}"/opt
  cp -r dist/heroku-audit "${pkgdir}"/opt/heroku-audit

  mkdir -p "${pkgdir}"/usr/bin/
  ln -s /opt/heroku-audit/heroku-audit "${pkgdir}"/usr/bin/

  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
