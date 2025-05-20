# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.1.5
pkgrel=1
pkgdesc="Jule programming language compiler"
arch=('aarch64' 'x86_64')
url="https://jule.dev"
_url="https://github.com/julelang/${_name}"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc')
optdepends=('clang: clang backend support'
            'gcc: gcc backend support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-arm64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-amd64.zip")
noextract=("${source_aarch64[@]%::*}" 
           "${source_x86_64[@]%::*}")
sha256sums_aarch64=('ea12097840dcccae7b522c3e1a0e2e208dbebfb3b883556f87271ac9cf1f0d65')
sha256sums_x86_64=('578eefbaaa4f75d996354c72f1f09615bd3ec25e09b9efa37554c31af623ae53')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}" "${_name}"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "api" "std" -type f ! -name '*.md' -exec \
    install -Dm644 "{}" "${pkgdir}/usr/lib/${_name}/{}" \;
  find "bin"       -type f ! -name '*.md' -exec \
    install -Dm755 "{}" "${pkgdir}/usr/lib/${_name}/{}" \;

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/include/${_name}"
  ln -vsf "/usr/lib/${_name}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  find "${pkgdir}/usr/lib/${_name}/api" -type f -execdir \
    ln -sf "/usr/lib/${_name}/api/{}" "${pkgdir}/usr/include/${_name}/{}" \;
  # ln -vsf "/usr/lib/${_name}/api" "${pkgdir}/usr/include/${_name}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
