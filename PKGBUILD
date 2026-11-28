# Maintainer: czyt <czytcn@gmail.com>

pkgname=bowel-bin
pkgver=0.4.10
pkgrel=1
pkgdesc="Desktop client for the mihomo proxy core, for non-commercial use"
arch=('x86_64' 'aarch64')
url="https://github.com/21stware/bowel"
license=('PolyForm-Noncommercial-1.0.0')
# The app is written in Go with GTK 3 and WebKitGTK, which it loads when it
# opens its window; the mihomo core it drives is a program of its own.
depends=('glibc' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
optdepends=(
  'gtk-layer-shell: put the window of the app in the layer shell of Wayland'
)
provides=('bowel')
conflicts=('bowel' 'bowel-git')
# The program of the release is already stripped; stripping it again may break it.
options=('!strip' '!debug')

# The version of the mihomo core that the release carries. The core is under
# the GPL, which asks for its source to be offered with it.
_mihomo_ver=1.19.33

# The release carries the client as a Debian package for each architecture.
_deb_x86_64="bowel_${pkgver}_amd64.deb"
_deb_aarch64="bowel_${pkgver}_arm64.deb"

source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/21stware/bowel/v${pkgver}/LICENSE"
  "PACKAGING-EXCEPTION.md::https://raw.githubusercontent.com/21stware/bowel/v${pkgver}/PACKAGING-EXCEPTION.md"
  "mihomo-v${_mihomo_ver}-source.tar.gz::https://github.com/21stware/bowel/releases/download/v${pkgver}/mihomo-v${_mihomo_ver}-source.tar.gz"
)
source_x86_64=("${_deb_x86_64}::https://github.com/21stware/bowel/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::https://github.com/21stware/bowel/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums=('29674d8efb4bb229267c3036e3c11aa17857f167a34b8723450bb767c7284c3e'
            'fdd6b28f92ddd5735bd495bfa45629aa8e34692ca0ec7e8d0764998ae49d3494'
            'e7c596b37ff27ec487d19b1920f73e0c97a78067ea35766530ee9659ade72711')
sha256sums_x86_64=('6077772e94cf043fa87f582be23421038618408786937ef3c48cb6bd953088b6')
sha256sums_aarch64=('bdf9a6ea6b6cf2c7db6846d1da67280a902fcfff2c306425c324ba1f71593a51')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"

  # Do not assume a compression for the payload of the Debian package: look
  # the member up instead.
  local data_archive
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  # The Debian package holds the app in /opt/bowel, next to the fonts, the
  # rule data and the core it drives, and its desktop entry and its icons
  # where the desktop of Arch Linux looks for them.
  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # Arch Linux keeps programs in /usr, and the app looks for the fonts, the
  # rule data and the core next to the program itself.
  install -d "${pkgdir}/usr/lib"
  mv "${pkgdir}/opt/bowel" "${pkgdir}/usr/lib/bowel"
  rmdir "${pkgdir}/opt"

  # The command of the app, which the desktop entry does not name.
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/bowel/bowel "${pkgdir}/usr/bin/bowel"

  # The desktop entry of the app runs it by the path of the Debian package.
  sed -i 's|^Exec=/opt/bowel/bowel$|Exec=/usr/bin/bowel|' \
    "${pkgdir}/usr/share/applications/bowel.desktop"

  # The licence of the app, and the exception of the licensor that allows
  # packaging it: the terms ask every package to carry both.
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/PACKAGING-EXCEPTION.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/PACKAGING-EXCEPTION.md"

  # The source of the mihomo core, whose licence (GPL-3.0) asks for it to be
  # offered with the program.
  install -Dm644 "${srcdir}/mihomo-v${_mihomo_ver}-source.tar.gz" \
    "${pkgdir}/usr/src/${pkgname}/mihomo-v${_mihomo_ver}-source.tar.gz"
}
