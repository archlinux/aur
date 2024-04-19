# Maintainer: doublesack <doublesackI@gmail.com>
_base=textidote
pkgname=${_base}-git
pkgrel=1
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=(any)
url="https://github.com/sylvainhalle/${_base}"
license=('GPL-3.0-only')
provides=(${_base})
depends=('java-runtime-headless>=8')
optdepends=(
  'bash-completion: for completion when using bash'
  'zsh-completions: for completion when using zsh'
  )
makedepends=('git' 'ant')
source=("git+${url}.git")
sha512sums=('SKIP')
pkgver=v0.9.rc9abf44

prepare() {
  cd "${srcdir}/${_base}"
  ant download-deps
}

pkgver() {
  cd "${_base}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r/;s/-/./g'
}

build() {
  cd "${srcdir}/${_base}"
  ant
  cat > textidote << EOL
#! /bin/bash
java -jar /usr/share/java/textidote.jar --name textidote "\$@"
EOL
}

check() {
  cd "${srcdir}/${_base}"
  ant test
}

package() {
  cd ${srcdir}/${_base}

  install -Dm644 Completions/${_base}.bash "${pkgdir}"/usr/share/bash-completion/completions/${_base}
  install -Dm644 Completions/${_base}.zsh "${pkgdir}"/usr/share/zsh/site-functions/_${_base}
  install -Dm755 ${_base} "${pkgdir}"/usr/bin/${_base}
  install -D ${_base}*[0-9].jar "${pkgdir}"/usr/share/java/${_base}.jar
}

