# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: wtx <sdrb@onet.eu>

pkgname="pccts"
pkgver=1.33MR33
pkgrel=2
pkgdesc="Purdue Compiler-Compiler Tool Set"
arch=('x86_64')
url="http://www.polhode.com/pccts.html"
license=('custom:Public Domain')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.zip")
source=("${_pkgsrc}.zip::http://www.polhode.com/pccts133mr.zip"
        "${pkgname}_conversion_format_3.0_quilt.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-6.4/debian/patches/conversion-format-3.0-quilt.patch"
        "${pkgname}_fix_implicit_declarations.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-6.4/debian/patches/implicit-declarations.patch"
        "${pkgname}_fix_format_security.patch"
        "${pkgname}_fix_genmk_flags.patch")
sha256sums=('d5aaf0b53999f43a9ff97c4993ba9f9682ed1864603c34f5e2728ae6a40f30a4'
            'a0473aa7167a751e9397a44fbd77295b4e8c5573a266de57b72b0bc3a8639bab'
            'bd040b0818f4ff9cc1a8c14b7efe926e5cd5200c79c32160b6450b0e2df4714d'
            '883df724e644ec30814b6135ac6ceadac6a11d197793fdd6f3ad56981832b871'
            'dcbd4391361b437a59ecea535e1717c449ed16ef8555f4ec08ff9e0b9d5ec316')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.zip" --strip-components 1 -C "${srcdir}/${_pkgsrc}"

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  find . -type f -exec sed -i 's/^CFLAGS[[:space:]]*=/CFLAGS +=/' {} +
  find . -type f -exec sed -i 's/\$(CFLAGS)/$(CFLAGS) $(LDFLAGS)/g' {} +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "bin" -type f -executable -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;

  cd "${srcdir}/${_pkgsrc}/h"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;
  cd "${pkgdir}/usr/include/${pkgname}"
  rm -f *.bat *.dsp *.dsw

  cd "${srcdir}/${_pkgsrc}/sorcerer/lib"
  install -Dm644 "errsupport.c"    "${pkgdir}/usr/include/${pkgname}/sorcerer/errsupport.c"
  install -Dm644 "STreeParser.cpp" "${pkgdir}/usr/include/${pkgname}/sorcerer/STreeParser.cpp"

  cd "${srcdir}/${_pkgsrc}/sorcerer/h"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/include/${pkgname}/sorcerer/{}" \;

  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "antlr/antlr.1" "${pkgdir}/usr/share/man/man1/antlr.1"
  install -Dm644 "dlg/dlg.1"     "${pkgdir}/usr/share/man/man1/dlg.1"

  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "history.txt" "${pkgdir}/usr/share/doc/${pkgname}/HISTORY.txt"
  install -Dm644 "history.ps"  "${pkgdir}/usr/share/doc/${pkgname}/HISTORY.ps"
  install -Dm644 "RIGHTS"      "${pkgdir}/usr/share/licenses/${pkgname}/RIGHTS"

  install -Dm644 "CHANGES_FROM_131.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGES_FROM_131.txt"
  install -Dm644 "CHANGES_FROM_133.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGES_FROM_133.txt"
  install -Dm644 "CHANGES_FROM_133_BEFORE_MR13.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGES_FROM_133_BEFORE_MR13.txt"
  install -Dm644 "CHANGES_SUMMARY.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGES_SUMMARY.txt"

  find "testcpp"  -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/{}" \;

  cd "${srcdir}/${_pkgsrc}/support"
  find "rexpr" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/support/{}" \;
  find "set"   -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/support/{}" \;
  find "sym"   -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/support/{}" \;

  cd "${srcdir}/${_pkgsrc}/sorcerer"
  find "test"    -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/sorcerer/{}" \;
  find "testcpp" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/examples/sorcerer/{}" \;

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/sorcerer/README"
  install -Dm644 "UPDATES" "${pkgdir}/usr/share/doc/${pkgname}/sorcerer/UPDATES"
}
