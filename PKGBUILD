# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=signal-desktop-fix-sway
pkgver=0.1.0
pkgrel=2
pkgdesc='Workaround for signal-desktop issue #6368 so its window appears under Sway'
arch=('any')
url='https://github.com/signalapp/Signal-Desktop/issues/6368'
license=('Apache')
depends=('patch-asar' 'signal-desktop')
optdepends=(
  'hyprland: Wayland compositor for which this workaround has been reported to work, too'
  'signal-desktop-blur-me-not: Auto-enable Wayland (ozone) for signal-desktop'
  'sway: Wayland compositor at which this workaround is primarily aimed'
)
options=('!strip')
install="${pkgname}.install"

source=(
  'patches__app__main.js.patch-execute'
  "${pkgname}.hook"
  "${pkgname}-patch.sh"
  "${pkgname}-unpatch.sh"
)

sha512sums=(
  '35e35b19f9b32dafd4247a3a15f665b40db196f7c8513bf1d073c83138654e2055dacd8a2e21f26fa600e6c8a7d174e9f0c074f418a1fab759eed7cfd55d209f'
  '1421e3833b3342861a5d381d6a77f9523ab1a358584675cebb27cf2c479c287bb72aa24871bb19b355ce433c1d3d7d026f8f98f4aa103fde16c2f5a02bd761b0'
  'ce5950f3630b37990abc21813ce465a6ea0e5bfb922fe16569fefb7859b29109d5b320c7e75cf78cef26ed50bbc50266cc9a4826b01fb05d858dc9af4c4ac391'
  '3b4dc5df827f31597ae3a917a8a887bd83566d66cc6959e1b21fb3f3ef720ecd7e1f77d22f9252f37e87aac135ea8d6f324ac20b7bb316a5c287b83e6713a369'
)

prepare() {
  cd "${srcdir}"

  echo >&2 'Generating reverse patches'
  mkdir -p reverse
  sed -e 's/true/false/' patches__app__main.js.patch-execute \
    > reverse/patches__app__main.js.patch-execute
}

package() {
  echo >&2 'Packaging runtime patches'

  for srcfile in "${srcdir}"/*.patch-execute; do
    srcfile_relative="${srcfile#"${srcdir%/}/"}"
    destfile="${srcfile_relative//__//}"
    patchname="$(basename "${destfile}")"

    echo >&2 "Packaging ${destfile}"
    install -D -m 644 -T \
      "${srcdir}/${srcfile_relative}" \
      "${pkgdir}/usr/share/${pkgname}/${destfile}"

    echo >&2 "Packaging reverse-${destfile}"
    install -D -m 644 -T \
      "${srcdir}/reverse/${srcfile_relative}" \
      "${pkgdir}/usr/share/${pkgname}/reverse-${destfile}"
  done

  echo >&2 "Packaging libalpm scripts"
  install -D -m 755 -T \
    "${srcdir}/${pkgname}-patch.sh" \
    "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
  install -D -m 755 -T \
    "${srcdir}/${pkgname}-unpatch.sh" \
    "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"

  echo >&2 "Packaging libalpm hook"
  install -D -m 644 -t "${pkgdir}/usr/share/libalpm/hooks" \
    "${srcdir}/${pkgname}.hook"
}
