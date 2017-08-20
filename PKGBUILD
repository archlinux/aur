# Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=peppercarrot-fonts-git
pkgver=r41.3d2511e
pkgrel=2
pkgdesc="Fonts required to correctly view and edit Pepper&Carrot SVGs"
arch=('any')
url="https://github.com/Deevad/peppercarrot_fonts"
license=('GPL3' 'Apache' 'Custom:OFL10' 'Custom:OFL11' 'Custom:MITX11'
         'Custom:MplusFont' 'Custom:CCBY3')
depends=('fontconfig' 'xorg-font-utils'
         # Already packaged OTF fonts
         'otf-pecita' 'otf-yanone-kaffeesatz'
         # Already packaged TTF fonts
         'ttf-droid-nonlatin-ib' 'ttf-impallari-lobster-font' 'lohit-fonts')

_licensefiles=('OFL10' 'OFL11' 'MITX11' 'MPlusFont' 'CCBY3')
source=('git+https://github.com/Deevad/peppercarrot_fonts.git'
        "${_licensefiles[@]}")
sha256sums=('SKIP'
            '51e1e3abf7ac7cb4129254cb32ff87fac06827db94caafe081589ab1613b3467'
            'e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            'f9c4c77baa3828004ee54b8a4f2db2e88ed44a6237a493965bf551fac0fcb62d'
            'faec1e722fd066a741d447bfff06e26e4daaa72b7796cbed7d416a27ddc751a3'
            'e6bc9e9c474700b708f568bac9e5a8a9bcb2b1dad53442f5ba449fcb848b8e76')

pkgver() {
  cd "${srcdir}/peppercarrot_fonts"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Copy the fonts
  # We can't use just a single install command because some fonts are in more
  # than one directory.
  local i
  for i in "${srcdir}"/peppercarrot_fonts/*/*; do
    local extension="${i##*.}"
    local dest=""

    case "${extension}" in
      ttf|ttc) dest="TTF"; ;;
      otf)     dest="OTF"; ;;
    esac

    if [ -n "${dest}" ]; then
      local filename="${i##*/}"

      case "${filename,,}" in
        pecita*|yanonekaffeesatz*)  ;; # Already packaged OTF
        droidkufi*|lobster*|lohit*) ;; # Already packaged TTF

        *) install -D -m644 "${i}" \
          "${pkgdir}/usr/share/fonts/${dest}/${filename}"; ;;
      esac
    fi
  done

  # Install licenses
  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -dm755 "${licdir}"
  sed -nr '
    # sed script to extract the license section
    /^## License/,$ { # Start at the license heading
      /^##? [^L]/q    # Stop when we reach the next section
      p
    }
    ' "${srcdir}/peppercarrot_fonts/README.md" > "${licdir}/README.md"
  chmod 644 "${licdir}/README.md"
  install -m644 "${_licensefiles[@]}" "${licdir}"
}

# vim:set tw=80 ts=2 sw=2 et:
