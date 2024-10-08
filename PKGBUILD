# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>  
# Contributor: Hansruedi Patzen <hp@revy.ch>

pkgname=banana9
pkgver=9.0.5
pkgrel=4
provides=('banana9')
conflicts=('banana9')
pkgdesc='Banana Accounting 9 Software'
arch=('x86_64')
url='https://www.banana.ch/'
license=('custom')
depends=('gtk3')
options=(emptydirs)

source=(
  "https://cdn.banana.ch/accounting/files/${pkgname}/exe/${pkgname}.tgz"
)
sha512sums=(
  '82b3b02ac8c2349588a2738b364a56305ca74a8b7a4aa284b2cc2b8ad2d1819f3ee44574bd28aa30eace372987929e007e548bf92b859787580d634328e5e636'
)

_install_dir="/opt/${pkgname}"

package() {
  install -d "${pkgdir}/${_install_dir}"
  rm "${srcdir}/${pkgname}.tgz"
  bsdtar cf - --cd "${srcdir}" . | bsdtar xf - --cd "${pkgdir}/${_install_dir}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s-@exepath@-${_install_dir}/start_${pkgname}.sh-g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # we can't use a symlink as start_banana.sh uses `dirname $0` without readlink.
  install -D /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/usr/bin/env sh
exec "${_install_dir}/start_${pkgname}.sh" "\$@"
END

  install -Dm644 "${srcdir}/banico.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/banico.svg"
  install -Dm644 "${srcdir}/usr/share/mime-ac2.xml" "${pkgdir}/usr/share/mime-ac2.xml"

  _license_source="${srcdir}/usr/share/License"
  for license_file in $(find "${_license_source}" -type f -name "*.txt"); do
    install -Dm644 "${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/${license_file#${_license_source}}"
  done
}


