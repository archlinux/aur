# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=electron-blur-me-not

# Some pkgnames are commented out; this means that no `blur-me-not`
# package is required for those. Instead, create a flags file in
# `~/.config` (or in `XDG_CONFIG_HOME`), and add the necessary flags
# to that file. The name of the flags file varies per package.
# Using a flags file is much simpler than a `blur-me-not` package.
pkgname=(
  '1password-blur-me-not'
  # 'code' -- create a `code-flags.conf` file instead
  'rambox-pro-bin-blur-me-not'
  'signal-desktop-blur-me-not'
  'spotify-blur-me-not'
)

pkgver=0.1.2
pkgrel=3
pkgdesc='Auto-enable Wayland (ozone) for apps that come with a vendored Electron'
arch=('any')
url='https://aur.archlinux.org/packages/electron-blur-me-not'
license=('Apache')
options=('!strip')

source=(
  "${pkgbase}.hook"
  "${pkgbase}-patch.sh"
  "${pkgbase}-unpatch.sh"
  'electron-flags.conf'
  'electron-launcher.sh'
)

sha512sums=(
  '5057477e2155a61a110a106e66376137f19472df215383435885529f6d8fbdc533ad912cb6a964cc2c8112d93f2443540729c3877b2259268729040c860f4506'
  '331d86cdb0d10a82dfae45331a34a22b2938895fe874b10433674f33f9aed851289ab8cbbba35fce38bae376bcd83c82537592ee17cdfd930c1bf1db3cef8748'
  'bbe9bcbd7b6f2cd50061ba56d3e123fb76c734f2a878a2d40f7cceb5e300ab5de2127628c450bb979a64fd14abd38b867e87b70e6269710f9f459431d5d46d59'
  '5f623fe7d7d750b19072ba6bd3a0ab44a46f938040c4cdfa0d8ba5ec78e6345f0b3793a8fb8950a65c39d661d7a2ac4f1cffd5c981b96385729c4c05a6fd5f3a'
  'fe94d357a5da3333beaa88d1dc9a02b75c6d07ab83d32029f8ac216e783cfc8a90f4bdad2b6e01a10d796228acface0896240528811def3cfee70c13d40807d1'
)

_pkgdesc() {
  printf 'Auto-enable Wayland (ozone) for %s' "${pkgname%-blur-me-not}"
}

# shellcheck disable=SC2128 # during execution, pkgname is a string
_package() {
  local _executable
  _executable="${1?}"
  install="${pkgname}.install"

  mkdir -p \
    "${pkgdir}/usr/share/${pkgname}" \
    "${pkgdir}/usr/share/libalpm/hooks" \
    "${pkgdir}/usr/share/libalpm/scripts"

  install -D -m 644 -T \
    "${srcdir}/electron-flags.conf" \
    "${pkgdir}/etc/${pkgname%-blur-me-not}-flags.conf"

  sed \
    -e "s/{{basename}}/${pkgname%-blur-me-not}/g" \
    -e "s#{{executable}}#${_executable}#g" \
    "${srcdir}/electron-launcher.sh" \
    > "${pkgdir}/usr/share/${pkgname}/${_executable##*/}-launcher.sh"
  sed \
    -e "s#{{launcher}}#/usr/share/${pkgname}/${_executable##*/}-launcher.sh#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "${srcdir}/${pkgbase}-patch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
  sed \
    -e "s#{{executable}}#${_executable}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "${srcdir}/${pkgbase}-unpatch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"
  sed \
    -e "s#{{executable}}#${_executable}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "${srcdir}/${pkgbase}-unpatch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"

  chmod 755 "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
  chmod 755 "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/${_executable##*/}-launcher.sh"

  sed \
    -e "s/{{basename}}/${pkgname%-blur-me-not}/g" \
    "${srcdir}/${pkgbase}.hook" \
    > "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}

package_1password-blur-me-not() {
  depends=("${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc '1Password')"
  _package '/opt/1Password/1password'
}

package_rambox-pro-bin-blur-me-not() {
  depends=("${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Rambox Pro')"
  _package '/opt/rambox/rambox'
}

package_signal-desktop-blur-me-not() {
  depends=("${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Signal Desktop')"
  _package '/usr/lib/signal-desktop/signal-desktop'
}

package_spotify-blur-me-not() {
  depends=("${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Spotify')"
  _package '/opt/spotify/spotify'
}
