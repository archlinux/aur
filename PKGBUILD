# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_base=brew
pkgname=${_base}-git
pkgver=2.7.4.r6568.ga93906a15
pkgrel=1
pkgdesc="The missing package manager for macOS (or Linux)"
arch=(x86_64)
url="https://github.com/Home${_base}/${_base}"
license=(BSD CCPL)
depends=(ruby-irb java-runtime)
makedepends=(git)
provides=(${_base})
conflicts=(linux${_base}-git linux${_base} ${_base})
source=(${_base}::git+${url}.git#branch=master
  brew4archlinux.patch::${url}/pull/5926.patch)
sha512sums=('SKIP'
            '5500cd6b43022a2fd90ac24f2189df4b02e96acfe6383d356a0dd4d74e161b53f3b65709624b243dec00c270ab812f84c6e276e6692106d5a50c360055a03c35')

pkgver() {
  if [ -d ${srcdir}/${_base} ]; then
    cd ${srcdir}/${_base}
    (
      set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
  fi
}

prepare() {
  cd ${srcdir}/${_base}
  patch -p1 -i ../brew4archlinux.patch
}

package() {
  cd ${srcdir}/${_base}

  install -dm777 "${pkgdir}/opt/${_base}"
  install -dm777 "${pkgdir}/opt/${_base}/bin"
  cp -a "${srcdir}/${_base}/." "${pkgdir}/opt/${_base}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/${_base}/bin/brew "${pkgdir}/usr/bin/brew"

  install -dm755 "${pkgdir}/usr/share/man/man1"
  ln -sf /opt/${_base}/manpages/brew{,-cask}.1 -t "${pkgdir}/usr/share/man/man1"

  install -dm755 "${pkgdir}/etc/bash_completion.d"
  ln -sf "/opt/${_base}/completions/bash/brew" -t "${pkgdir}/etc/bash_completion.d/"

  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  ln -sf /opt/${_base}/completions/zsh/_brew{,_cask} -t "${pkgdir}/usr/share/zsh/site-functions"
}
