# Maintainer: RunasSudo <aur at yingtongli dot me>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: yhaupenthal <y dot h plus aur at posteo dot de>
# Contributor: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Reventlov <contact+aur@volcanis.me>
pkgname=isso-git
pkgver=0.12.2
pkgrel=5
pkgdesc="A commenting python server similar to Disqus"
arch=('any')
url="http://posativ.org/isso/"
license=('MIT')
depends=('python-bleach' 'python-jinja' 'python-werkzeug' 'python-html5lib' 'python-misaka' 'python-itsdangerous' 'python-six' 'python-cffi' 'sqlite' 'python-setuptools' 'python-flask-caching')
conflicts=('isso')
provides=('isso')
makedepends=('git' 'python' 'bower' 'python-sphinx' 'nodejs-requirejs')
backup=('etc/isso.conf')
source=("git+https://github.com/posativ/isso.git"
  "https://raw.githubusercontent.com/posativ/isso/master/LICENSE"
  "isso.service")
install=isso.install
sha256sums=('SKIP'
            'd909d060d71c4d9ce92102fa68aa53c963db9b4b6ca315fa0817eafb07651fe2'
            '5e625e14f757101dcfa9cdacb18c191d5f6f0324a2c68dc8847cb77e343b7eef')
validpgpkeys=("7757B21C0C6E5AE4BC6F6462FD1BA15E0E87FE5C")

build() {
  cd "${srcdir}/isso"
  npm install node-sass
  export PATH="${srcdir}/isso/node_modules/node-sass/bin":$PATH

  make init all
  python setup.py sdist
}

package() {
  cd "${srcdir}"
  # License
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/isso/LICENSE"

  msg "Starting build..."
  cd "${srcdir}/isso"
  python setup.py install --root="${pkgdir}/" --optimize=1

  # ... systemd
  install -D -m 644 "${srcdir}/isso.service" "${pkgdir}/usr/lib/systemd/system/isso.service"
  # ... common config
  install -D -m 644 "${srcdir}/isso/share/isso.conf" "${pkgdir}/etc/isso.conf"
  # ... man pages
  install -D -m 644 "${srcdir}/isso/man/man1/isso.1" "${pkgdir}/usr/share/man/man1/isso.1"
  install -D -m 644 "${srcdir}/isso/man/man5/isso.conf.5" "${pkgdir}/usr/share/man/man5/isso.conf.5"
}

# vim:set ts=2 sw=2 et:
