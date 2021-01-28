# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=mx-bash-config-git
pkgver=19.10.09_140
pkgrel=1
pkgdesc="GUI tool written in Qt to modify the bashrc"
arch=('x86_64')
url="https://mxlinux.org/wiki/help-files/help-bash-config"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
install=bash-config.install
source=("git+https://github.com/TheNiteCoder/mx-bashrc-config"
        "https://raw.githubusercontent.com/MX-Linux/mx-goodies/master/bin/fancy-prompts.bash")
md5sums=('SKIP'
         '90de09da55a2ede5f18ab06678a4c76c')

pkgver() {
  cd "$srcdir"/mx-bashrc-config/application/debian

  # official number from changelog + number of commits as suffix
  last_release=$(head -n 1 changelog | cut -f 2 -d "(" | cut -f 1 -d ")" )
  echo -n "${last_release}_" && git rev-list master --count
}

prepare() {
  cd "$srcdir"/mx-bashrc-config/application

  # change file location
  sed -i 's;/usr/local/bin/fancy-prompts.bash;/usr/share/bash-config/fancy-prompts.bash;' *.*

  qmake -config release QMAKE_CXXFLAGS_RELEASE+="${CXXFLAGS} ${CPPFLAGS}" \
                        QMAKE_LFLAGS_RELEASE+="${LDFLAGS}"
}

build() {
  cd "$srcdir"/mx-bashrc-config/application

  make
}

package() {
  cd "$srcdir"/mx-bashrc-config/application

  # the "install" target in the makefile does nothing, copying manually

  install -Dm755 bash-config -t "$pkgdir"/usr/bin/
  install -Dm644 bashrc-config.desktop "$pkgdir"/usr/share/applications/bash-config.desktop
  install -Dm644 help/* -t "$pkgdir"/usr/share/doc/bash-config/help/
  install -Dm644 "$srcdir"/fancy-prompts.bash -t "$pkgdir"/usr/share/bash-config/

  echo "Keywords=MX" >> "$pkgdir"/usr/share/applications/bash-config.desktop
}
