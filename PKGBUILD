# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=altium2kicad

pkgname=${_pkgname}-git
pkgver=r219.f7e739f
pkgrel=4
pkgdesc="Altium to KiCad converter for PCB and schematics"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="https://github.com/thesourcerer8/altium2kicad"
license=('AGPL3')
depends=(
  'perl'
)
source=(
  "git+${url}"
)
sha256sums=(
  'SKIP'
)

conflicts=( 'perl-math-bezier' )

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  :
}

package () {
  cd "${_pkgname}"

  # Install license file
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" \
    "LICENSE"

  # Install readmes
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" \
    "README.md" "Tests.md"

  # # Install Freecad macro
  # install -Dm644 "step2wrl.FCMacro" \
  #   "${pkgdir}/usr/share/"

  # Install Perl libraries
  find "Math" -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/lib/perl5/5.30/vendor_perl/{}" \;

  # Install executables
  install -d "${pkgdir}/usr/bin"
  for exe in "unpack" "convertpcb" "convertschema" ; do
    install -Dm755 -t "${pkgdir}/usr/lib/altium2kicad" "${exe}.pl"
    ln -s "/usr/lib/altium2kicad/${exe}.pl" "${pkgdir}/usr/bin/altium2kicad_${exe}"
  done

}
