# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dstask"
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="A terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('armv7h' 'x86_64')
url="https://calbryant.uk/blog/dstask-a-taskwarrior-alternative"
_url="https://github.com/naggie/${_pkgname}"
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-linux-arm5"
               "${_pkgname}-import-${pkgver}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-arm5")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-linux-amd64"
               "${_pkgname}-import-${pkgver}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-amd64")
sha256sums=('36620010be81ccfd933c1c8ccf6fc21f227a2a9922cccdea16212a64ec0e7efd'
            'f1630544f9da6d125967a9224cee919b686a7b2b3ea37d7ecbfa8216b2837534')
sha256sums_armv7h=('719ee1aa2aaa30fc4405cb1a4e2ba34ba4382c1cdb438f7f92aba77256e20ac5'
                   'b62d1b4de96d702d9a915b122bf4405869560e57bf56794c372f7b166c5c042e')
sha256sums_x86_64=('060553b091411d5f6799ebe2fb4cf56c5f082a90f99b59859de84b097e6fa263'
                   '117ee9891dd327dfe04f122569dde4e8167bcfe44665ee2052f1733c90480c8b')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgname}-${pkgver}-${CARCH}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh; do
    ./"${_pkgname}-${pkgver}-${CARCH}" "${_sh}-completion" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-${pkgver}-${CARCH}"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgname}-import-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-import"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
