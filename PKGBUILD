# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=w3af-git
pkgver=1.6.46.14017.4e045fd
pkgrel=2
pkgdesc="Web Application Attack and Audit Framework"
url='http://w3af.org/'
arch=('any')
license=('GPL2')
depends=('python2-clamd' 'python2-pybloomfiltermmap' 'python2-esmre' 'python2-phply' 'python2-pysqlite' 'python2-nltk' 'python2-chardet' 'pdfminer' 'python2-futures' 'python2-pyopenssl' 'python2-lxml' 'scapy' 'python2-guess-language' 'python2-cluster' 'python2-msgpack' 'python2-ntlm' 'python2-pygithub' 'python2-smmap' 'python2-gitpython' 'graphviz' 'pygtksourceview2' 'pygtk' 'gtk2' 'python2-beautifulsoup3' 'xdot' 'halberd' 'python2-jinja' 'python2-ndg-httpsclient' 'python2-stopit' 'python2-tblib' 'python2-darts.util.lru' 'python2-pip' 'python2-setuptools')
makedepends=('git')
options=('!strip')
provides=('w3af')
conflicts=('w3af')
source=(${pkgname}::git+https://github.com/andresriancho/w3af
        w3af.desktop)
sha512sums=('SKIP'
            '8ce7a6e97bf1d4fd357a7a6ee72638bdb6be0c63dacd4c099a99f64dcb8b30180831074ec1699904233548d385c3b1c445402d9538d50e5be2ea87c84630a38e')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}

  # Enforce python2
  sed -i -e 's|#!\s*/usr/bin/python[0-9.]*$|#!/usr/bin/python2|g' \
         -e 's|#!\s*/usr/bin/env python[0-9.]*$|#!/usr/bin/env python2|g' \
         $(find . -name '*.py') tools/* w3af_{console,gui} \
         extras/docker/scripts/w3af_{console_docker,gui_docker}

  # Remove dependency checks.
  sed -i 's/dependency_check()/#&/' w3af_{console,gui}
}

package() {
  cd ${pkgname}

  # Base directories.
  install -d "${pkgdir}/usr/share/w3af"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications/"

  cp --no-preserve=ownership -r * "${pkgdir}/usr/share/w3af"

  install -Dm644 "${srcdir}/w3af.desktop" "${pkgdir}/usr/share/applications"

  # Joint script for w3af_console.
  cat > "${pkgdir}/usr/bin/w3af" <<EOF
#!/bin/sh
exec python2 /usr/share/w3af/w3af_console "\$@"
EOF

  # Joint script for w3af_gui.
  cat > "${pkgdir}/usr/bin/w3af-gui" <<EOF
#!/bin/sh
exec python2 /usr/share/w3af/w3af_gui "\$@"
EOF

  chmod +x "${pkgdir}"/usr/share/w3af/w3af_{console,gui} "${pkgdir}/usr/bin"/{w3af,w3af-gui}
}

# vim: ts=2 sw=2 et:
