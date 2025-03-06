# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jule"
_pkgname="${_name}c"
pkgname="${_pkgname}-bin"
pkgver=0.1.3
pkgrel=2
pkgdesc="Jule programming language compiler"
arch=('aarch64' 'x86_64')
url="https://jule.dev"
_url="https://github.com/julelang/${_name}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('clang: clang backend support'
            'gcc: gcc backend support')
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-arm64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${_name}${pkgver}/${_name}-linux-amd64.zip")
noextract=("${source_aarch64[@]%::*}" 
           "${source_x86_64[@]%::*}")
sha256sums_aarch64=('745afa38194b93f2f73312790da9068c5d59380245c5b9444fedc650c75084b7')
sha256sums_x86_64=('8d0182573a9b1e3240be313ede065a5c0873ec53874966bd076828a58a0aca7b')

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
