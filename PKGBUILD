# Maintainer: Barry Smith <brrtsm[at]gmail[dot]com>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Mech <tiago.bmp@gmail.com>
# Contributor: Ermak <ermak@email.it>

pkgname=w3af
pkgver=1.6.54
pkgrel=1
pkgdesc="Web Application Attack and Audit Framework"
url='http://w3af.org/'
arch=('any')
license=('GPL2')
depends=('python2-clamd' 'python2-pybloomfiltermmap' 'python2-esmre' 'python2-phply' 'python2-pysqlite' 'python2-nltk' 'python2-chardet' 'pdfminer' 'python2-futures' 'python2-pyopenssl' 'python2-lxml' 'scapy' 'python2-guess-language' 'python2-cluster' 'python2-msgpack' 'python2-ntlm' 'python2-pygithub' 'python2-smmap' 'python2-gitpython' 'graphviz' 'pygtksourceview2' 'pygtk' 'gtk2' 'python2-beautifulsoup3' 'xdot' 'halberd' 'python2-jinja' 'python2-ndg-httpsclient' 'python2-stopit' 'python2-tblib' 'python2-darts.util.lru' 'python2-pip' 'python2-setuptools' 'python2-termcolor' 'python2-pyasn1' 'python2-vulndb' 'python2-markdown' 'python2-psutil' 'mitmproxy' 'python2-tldextract' 'python2-ruamel.ordereddict' 'python2-pebble' 'python2-lz4' 'python2-diff_match_patch' 'python2-webkit-server' 'joe' 'tcpdump' 'libffi' 'stunnel')
makedepends=('git')
options=('!strip')
provides=('w3af')
conflicts=('w3af-git')
optdepends=('webkitgtk2: required for w3af-gui'
'pywebkit: required for w3af-gui')
source=(${pkgver}.tar.gz::https://github.com/andresriancho/${pkgname}/archive/${pkgver}.tar.gz
        w3af.desktop)
sha512sums=('8132bb3ee0433739b9a3bd4a6b25d90e9f71d915eb1f7a63c382199bfc8b9dc5abe6bdd73c7715ab5804e6cf22a99f8ba98ac39cee92a5f3e547f7cb939f8ac6'
            '8ce7a6e97bf1d4fd357a7a6ee72638bdb6be0c63dacd4c099a99f64dcb8b30180831074ec1699904233548d385c3b1c445402d9538d50e5be2ea87c84630a38e')

prepare() {
  cd ${pkgname}-${pkgver}

  # Enforce python2
  sed -i -e 's|#!\s*/usr/bin/python[0-9.]*$|#!/usr/bin/python2|' \
         -e 's|#!\s*/usr/bin/env python[0-9.]*$|#!/usr/bin/env python2|' \
         $(find . -name '*.py') tools/* w3af_{console,gui} \
         extras/docker/scripts/w3af_{console_docker,gui_docker}

  # Fix pyclamd module name
  sed -i -e 's/import clamd/import pyclamd/g' w3af/plugins/grep/clamav.py

  # Remove dependency checks.
  sed -i 's/dependency_check()/#&/' w3af_{console,gui}
}

package() {
  cd ${pkgname}-${pkgver}

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
